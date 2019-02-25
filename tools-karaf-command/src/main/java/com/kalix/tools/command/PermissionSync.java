package com.kalix.tools.command;

import com.kalix.framework.core.api.web.IApplication;
import com.kalix.framework.core.api.web.IMenu;
import com.kalix.framework.core.api.web.IModule;
import com.kalix.framework.core.util.ScriptRunner;
import com.kalix.framework.core.web.manager.ApplicationManager;
import com.kalix.framework.core.web.manager.MenuManager;
import com.kalix.framework.core.web.manager.ModuleManager;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 * Created by Administrator on 2018-12-07.
 * sunlf
 * 权限数据同步
 */
public class PermissionSync {

    private String appOptionSql = "update sys_application set opflag='1';";
    private String funOptionSql = "update sys_function set opflag='1';";

    private String appSelectIdSql = "SELECT id FROM public.sys_application WHERE code='%s';";
    private String appMaxIdSql = "select max(id) from public.sys_application;";
    private String appInsertSql = "INSERT INTO public.sys_application " +
            "(id, createby, creationdate, updateby, updatedate, code, location, name ,iconCls ,remark, version_, supportmobile, opflag) " +
            "VALUES ('%s', '管理员', '%s', '管理员', '%s', '%s', '', '%s', '%s', '%s', '1', '%s', '0');";
    private String appUpdateSql = "UPDATE public.sys_application " +
            "set updatedate='%s', code='%s', name='%s', iconCls='%s', remark='%s', supportmobile='%s', opflag='0' where id='%s';";

    private String funSelectIdSql = "SELECT id FROM public.sys_function WHERE applicationid='%s' and code='%s';";
    private String funMaxIdSql = "select max(id) from public.sys_function;";
    private String funInsertSql = "INSERT INTO public.sys_function " +
            "(id, createby, creationdate, updateby, updatedate, applicationid, code, isleaf, name, parentid, permission, remark, version_, dataPermission, dataPermissionKey, opflag) " +
            "VALUES ('%s', '管理员', '%s', '管理员', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '', '1', '%s', '%s', '0');";
    private String funUpdateSql = "UPDATE public.sys_function " +
            "set updatedate='%s', name='%s', permission='%s', opflag='0' where id='%s';";

    private String funBtnSelectIdSql = "SELECT id FROM public.sys_function WHERE applicationid='%s' and code='%s' and parentid='%s';";

    private String role_appSelectSql = "SELECT id FROM sys_role_application WHERE applicationid='%s' and roleid='1';";
    private String role_appMaxIdSql = "select max(id) from sys_role_application;";
    private String role_appInsertSql = "INSERT INTO sys_role_application " +
            "(id, createby, creationdate, updateby, updatedate, applicationid, roleid, version_) " +
            "VALUES ('%s', '管理员', '%s', '管理员', '%s','%s', '1',  '1');";

    private String role_funSelectSql = "SELECT id FROM sys_role_function WHERE functionid='%s' and roleid='1';";
    private String role_funMaxIdSql = "select max(id) from sys_role_function;";
    private String role_funInsertSql = "INSERT INTO sys_role_function " +
            "(id, createby, creationdate, updateby, updatedate, functionid, roleid, version_) " +
            "VALUES ('%s', '管理员', '%s', '管理员', '%s','%s', '1',  '1');";

    private String role_appClearSql = "DELETE FROM sys_role_application where applicationid in (select id from sys_application where opflag='1');";
    private String role_funClearSql = "DELETE FROM sys_role_function where functionid in (select id from sys_application where opflag='1') " +
            "or functionid in (select id from sys_function where opflag='1');";
    private String appClearSql = "DELETE FROM sys_application where opflag='1';";
    private String funClearSql = "DELETE FROM sys_function where opflag='1';";

    String strNow = Util.getNowString();

    //get datasource
    DataSource dataSource = Util.getKalixDataSource();
    Connection conn;
    Statement statement = null;
    ResultSet rs = null;
    //run script
    ScriptRunner scriptRunner = new ScriptRunner(dataSource, false, true);

    public void init() throws Exception {
        try {
            conn = dataSource.getConnection();
            List<IApplication> applicationList = ApplicationManager.getInstall().getApplicationList();
            if (applicationList != null && !applicationList.isEmpty()) {
                this.updateOption();
                for (IApplication application : applicationList) {
                    int appId = this.dealWithApp(application);
                    this.dealWithApplicationPermit(appId);
                    this.dealWithFunctionPermit(appId);
                    List<IModule> moduleList = ModuleManager.getInstall().getModuleList(application.getId());
                    if (moduleList != null && !moduleList.isEmpty()) {
                        for (IModule module : moduleList) {
                            int moduleId = this.dealWithModule(appId, module);
                            this.dealWithFunctionPermit(moduleId);
                            List<IMenu> allMenu = MenuManager.getInstall().getMenuList(module.getId());
                            if (allMenu != null && !allMenu.isEmpty()) {
                                for (IMenu menu : allMenu) {
                                    int menuId = this.dealWithMenu(appId, moduleId, menu);
                                    this.dealWithFunctionPermit(menuId);
                                }
                            }
                        }
                    }
                }
                this.clearData();
            }
        } finally {
            if (conn != null)
                conn.close();
            if (statement != null)
                statement.close();
            if (rs != null)
                rs.close();
        }
    }

    private void updateOption() {
        StringBuilder builder = new StringBuilder();
        builder.append(appOptionSql);
        builder.append(funOptionSql);
        StringReader reader = new StringReader(builder.toString());
        try {
            Util.outPrint("update app and fun set option value eq 1!");
            scriptRunner.runScript(reader);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 处理application数据
     *
     * @param application
     * @return appId
     */
    private int dealWithApp(IApplication application) throws Exception {
        int appId = -1;
        String sql = String.format(appSelectIdSql, application.getId());
        statement = conn.createStatement();
        rs = statement.executeQuery(sql);
        if (rs.next()) {
            appId = rs.getInt(1);
        }
        String str = "";
        if (appId == -1) { // 新增
            appId = this.getNewId(appMaxIdSql, 1);
            str = String.format(appInsertSql, String.valueOf(appId), strNow, strNow, application.getId(), application.getText(),
                    application.getIconCls(), application.getText(), application.getSupportMobile()); // 格式化字符串
            Util.outPrint("insert application data of " + application.getId());
        } else { // 更新
            str = String.format(appUpdateSql, strNow, application.getId(), application.getText(), application.getIconCls(),
                    application.getText(), application.getSupportMobile(), String.valueOf(appId)); // 格式化字符串
            Util.outPrint("update application data of " + application.getId());
        }
        StringReader reader = new StringReader(str);
        scriptRunner.runScript(reader);
        return appId;
    }

    /**
     * 处理module数据
     *
     * @param appId
     * @param appId
     */
    private int dealWithModule(int appId, IModule module) throws Exception {
        int moduleId = -1;
        String sql = String.format(funSelectIdSql, String.valueOf(appId), module.getId());
        statement = conn.createStatement();
        rs = statement.executeQuery(sql);
        if (rs.next()) {
            moduleId = rs.getInt(1);
        }
        String str = "";
        if (moduleId == -1) { // 新增
            moduleId = this.getNewId(funMaxIdSql, 1001);
            str = String.format(funInsertSql, String.valueOf(moduleId), strNow, strNow, String.valueOf(appId),
                    module.getId(), "0", module.getText(), "-1", module.getPermission(), "0", ""); // 格式化字符串
            Util.outPrint("insert module data of " + module.getId());
        } else { // 更新
            str = String.format(funUpdateSql, strNow, module.getText(), module.getPermission(), String.valueOf(moduleId)); // 格式化字符串
            Util.outPrint("update module data of " + module.getId());
        }
        StringReader reader = new StringReader(str);
        scriptRunner.runScript(reader);
        return moduleId;
    }

    /**
     * 处理menu数据
     *
     * @param appId
     * @param moduleId
     * @param menu
     */
    private int dealWithMenu(int appId, int moduleId, IMenu menu) throws Exception {
        int menuId = -1;
        String sql = String.format(funSelectIdSql, String.valueOf(appId), menu.getId());
        statement = conn.createStatement();
        rs = statement.executeQuery(sql);
        if (rs.next()) {
            menuId = rs.getInt(1);
        }
        String str = "";
        if (menuId == -1) { // 新增
            menuId = this.getNewId(funMaxIdSql, 1001);
            String code = menu.getId();
            String dataPermission = code.substring(0, code.length() - 4).toLowerCase(); // 处理数据权限的字符串,去掉结尾的menu
            str = String.format(funInsertSql, String.valueOf(menuId), strNow, strNow, String.valueOf(appId),
                    code, "0", menu.getText(), String.valueOf(moduleId), menu.getPermission(), "1", dataPermission); // 格式化字符串
            Util.outPrint("insert menu data of " + menu.getId());
        } else { // 更新
            str = String.format(funUpdateSql, strNow, menu.getText(), menu.getPermission(), String.valueOf(menuId)); // 格式化字符串
            Util.outPrint("update menu data of " + menu.getId());
        }
        StringReader reader = new StringReader(str);
        scriptRunner.runScript(reader);

        // 处理菜单下的按钮
        // 数据格式 "新增,add;刪除,delete;修改,edit;查看,view";
        Integer btnParentId = new Integer(menuId);
        String strBtns = menu.getButtons();
        StringBuilder build = null;
        // when button value equal null it means no buttons has permission
        if (!strBtns.equals("null")) {
            String[] btns = strBtns.split(";");
            build = new StringBuilder();
            int lp = -1;
            for (String btn : btns) {
                String[] values = btn.split(",");
                String strName = values[0];
                String strKey = values[1];
                int btnId = -1;
                lp++;
                String btnSql = String.format(funBtnSelectIdSql, String.valueOf(appId), strKey, String.valueOf(btnParentId));
                rs = statement.executeQuery(btnSql);
                if (rs.next()) {
                    btnId = rs.getInt(1);
                }
                String btnStr = "";
                if (btnId == -1) { // 新增
                    btnId = this.getNewId(funMaxIdSql, 1001);
                    btnId += lp;
                    btnStr = String.format(funInsertSql, String.valueOf(btnId), strNow, strNow, String.valueOf(appId),
                            strKey, "1", strName, String.valueOf(btnParentId), menu.getPermission() + ":" + strKey, "0", ""); // 格式化字符串
                    Util.outPrint("insert button data of " + menu.getId());
                } else { // 更新
                    btnStr = String.format(funUpdateSql, strNow, strName, menu.getPermission() + ":" + strKey, String.valueOf(btnId)); // 格式化字符串
                    Util.outPrint("update button data of " + menu.getId());
                }
                build.append(btnStr);
            }
            StringReader btnReader = new StringReader(build.toString());
            scriptRunner.runScript(btnReader);
        }
        return menuId;
    }

    /**
     * 处理application授权信息
     *
     * @param appId
     */
    private void dealWithApplicationPermit(int appId) throws Exception {
        int roleAppId = -1;
        String sql = String.format(role_appSelectSql, String.valueOf(appId));
        statement = conn.createStatement();
        rs = statement.executeQuery(sql);
        if (rs.next()) {
            roleAppId = rs.getInt(1);
        }
        if (roleAppId == -1) { // 新增
            roleAppId = this.getNewId(role_appMaxIdSql, 1);
            String str = String.format(role_appInsertSql, String.valueOf(roleAppId), strNow, strNow, String.valueOf(appId)); // 格式化字符串
            StringReader reader = new StringReader(str);
            Util.outPrint("insert role application data ");
            scriptRunner.runScript(reader);
        }
    }

    /**
     * 处理function授权信息
     *
     * @param funId
     */
    private void dealWithFunctionPermit(int funId) throws Exception {
        int roleFunId = -1;
        String sql = String.format(role_funSelectSql, String.valueOf(funId));
        statement = conn.createStatement();
        rs = statement.executeQuery(sql);
        if (rs.next()) {
            roleFunId = rs.getInt(1);
        }
        if (roleFunId == -1) { // 新增
            roleFunId = this.getNewId(role_funMaxIdSql, 1000);
            String str = String.format(role_funInsertSql, String.valueOf(roleFunId), strNow, strNow, String.valueOf(funId)); // 格式化字符串
            StringReader reader = new StringReader(str);
            Util.outPrint("insert role function data ");
            scriptRunner.runScript(reader);
        }
    }

    private void clearData() {
        StringBuilder builder = new StringBuilder();
        builder.append(role_appClearSql);
        builder.append(role_funClearSql);
        builder.append(appClearSql);
        builder.append(funClearSql);
        StringReader reader = new StringReader(builder.toString());
        try {
            Util.outPrint("clear role_app and role_fun and app and fun data where option value eq 1!");
            scriptRunner.runScript(reader);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private int getNewId(String sql, int defaultValue) throws Exception {
        int id = -1;
        statement = conn.createStatement();
        rs = statement.executeQuery(sql);
        if (rs.next()) {
            id = rs.getInt(1) + 1;
        } else {
            id = defaultValue;
        }
        return id;
    }
}
