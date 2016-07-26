package ${package}.webapp.wicket;

import cn.com.rexen.core.web.api.module.IMenuModule;

/**
 * Created with IntelliJ IDEA.
 * Cartype: sunlf
 * Date: 14-3-10
 * Time: 下午4:58
 * To change this template use File | Settings | File Templates.
 */
public class BrandMenuModule implements IMenuModule {
    @Override
    public String getTargetTag() {
        return new String("cartype.module.bundles");
    }

    @Override
    public int getIndex() {
        return 0;
    }

    @Override
    public String getName() {
        return "产品管理";
    }

    @Override
    public String getIcon() {
        return "icon-table";  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String getTag() {
        return "8plat";  //To change body of implemented methods use File | Settings | File Templates.
    }
}
