package ${package}.webapp.wicket;

import ${package}.webapp.wicket.page.CartypePage;
import cn.com.rexen.core.web.api.module.IMenuItemsModule;
import org.apache.wicket.Page;

/**
 * Created with IntelliJ IDEA.
 * Cartype: sunlf
 * Date: 14-3-13
 * Time: 下午4:14
 * To change this template use File | Settings | File Templates.
 */
public class BrandMenuItemsModule implements IMenuItemsModule {


    @Override
    public String getNo() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getIndex() {
        return 20;
    }

    @Override
    public Class<? extends Page> getPageClass() {
        return CartypePage.class;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String getName() {
        return "车型管理";  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String getIcon() {
        return "";  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String getTag() {
        return "cartype.module.bundles";  //To change body of implemented methods use File | Settings | File Templates.
    }
}
