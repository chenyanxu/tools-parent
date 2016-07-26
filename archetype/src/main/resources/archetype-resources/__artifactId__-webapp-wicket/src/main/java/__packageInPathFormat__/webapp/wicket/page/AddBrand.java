package ${package}.webapp.wicket.page;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.CompoundPropertyModel;

/**
 * Created by Administrator on 14-3-25.
 */
public class AddBrand extends Panel {
    TextField name;
    TextField mobile;
    TextField address;
    TextField contact;
    TextField zipcode;
    Cartype cartype = new Cartype();

    public AddBrand(String id) {
        super(id);

        Form form = new Form<Cartype>("add_brand_form", new CompoundPropertyModel<Cartype>(cartype)) {
            @Override
            protected void onSubmit() {
                cartype.setName(name.getValue());
//                distributorBeanService.addEntity(distributor);
                setResponsePage(BrandPage.class);
            }
        };
        add(form);

        name = new TextField("name");

        form.add(name);
    }
}
