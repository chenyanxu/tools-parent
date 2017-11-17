package com.kalix.tools.command;

import com.kalix.framework.core.util.JNDIHelper;
import org.fusesource.jansi.AnsiConsole;

import javax.sql.DataSource;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.fusesource.jansi.Ansi.Color.RED;
import static org.fusesource.jansi.Ansi.ansi;

/**
 * Created by Administrator on 2016-08-03.
 */
public class Util {
    /**
     * 获得kalix数据源
     *
     * @return
     */
    public static DataSource getKalixDataSource() {
        Map<String, String> map = new HashMap<>();
        map.put("osgi.jndi.service.name", "jdbc/ds");

        try {
            return JNDIHelper.getJNDIServiceForName(DataSource.class.getName(), map);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获得当前日期的字符串
     * @return
     */
    public static String getNowString(){
        SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date now=new Date();
        String nowString=myFmt.format(now);
        return nowString;
    }

    public static void outPrint(String str) {
        AnsiConsole.systemInstall();
        System.out.println(ansi().eraseScreen().fg(RED).a(str).reset());
        AnsiConsole.systemUninstall();
    }
}
