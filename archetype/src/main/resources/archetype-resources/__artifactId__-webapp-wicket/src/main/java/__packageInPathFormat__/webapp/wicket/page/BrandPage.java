package ${package}.webapp.wicket.page;

import ${package}.api.biz.IBrandService;
import ${package}.api.persistence.BrandBeanImpl;
import cn.com.rexen.core.web.wicket.BasePage;
import org.apache.aries.blueprint.annotation.Reference;
import org.apache.wicket.AttributeModifier;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.AjaxFormValidatingBehavior;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.ajax.markup.html.form.AjaxButton;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;
import org.apache.wicket.model.AbstractReadOnlyModel;
import org.apache.wicket.model.CompoundPropertyModel;
import org.apache.wicket.model.PropertyModel;
import org.apache.wicket.request.mapper.parameter.PageParameters;
import org.apache.wicket.util.time.Duration;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.Date;
import java.util.List;

/**
 * @类描述：品牌维护
 * @创建人：sunlf
 * @创建时间：2014-03-29 上午10:25
 * @修改人：
 * @修改时间：
 * @修改备注：
 */

public class BrandPage extends BasePage {
    @Named
    @Inject
    @Reference(id = "brandService", serviceInterface = IBrandService.class)
    private IBrandService brandService;

    Label label1 = new Label("pageName1", "添加产品");
    Label label2 = new Label("pageName2", "编辑产品");
    final DataView<BrandBeanImpl> brandBeanDataView;

    public BrandPage() {
        label1.setVisible(true);
        label2.setVisible(false);
        add(label1);
        add(label2);

        final Form<BrandBeanImpl> form = new Form<BrandBeanImpl>("add_brand_form", new CompoundPropertyModel<BrandBeanImpl>(new BrandBeanImpl()));
        add(form);
        AjaxFormValidatingBehavior.addToAllFormComponents(form, "keydown", Duration.ONE_SECOND);

        TextField formName = new TextField("name");
        TextField formSummary = new TextField("summary");

        form.add(formName);
        form.add(formSummary);

        form.add(new AjaxButton("submit_button", form) {
            @Override
            protected void onSubmit(AjaxRequestTarget target, Form<?> submitForm) {
                BrandBeanImpl brandBean = (BrandBeanImpl) getParent().getDefaultModelObject();
                brandBean.setCreateDate(new Date());
                brandBean.setState("未发布");
                brandService.putBrand(brandBean);
                setResponsePage(BrandPage.class);
                label1.setVisible(true);
                label2.setVisible(false);
            }

            @Override
            protected void onError(AjaxRequestTarget target, Form<?> form) {
                System.out.println("onError");
            }
        });

        add(new Link("reset_form_1") {
            @Override
            public void onClick() {
                form.setModelObject(new BrandBeanImpl());
                label1.setVisible(true);
                label2.setVisible(false);
            }
        });

        form.add(new Link("reset_form_2") {
            @Override
            public void onClick() {
                form.setModelObject(new BrandBeanImpl());
                label1.setVisible(true);
                label2.setVisible(false);
            }
        });



        //填充列表
        List<BrandBeanImpl> brandBeanList = brandService.getAllBrand();
        ListDataProvider<BrandBeanImpl> listDataProvider = new ListDataProvider<BrandBeanImpl>(brandBeanList);
        brandBeanDataView = new DataView<BrandBeanImpl>("brandRow", listDataProvider) {
            private static final long serialVersionUID = 1L;

            @Override
            protected void populateItem(final Item<BrandBeanImpl> item) {
                final BrandBeanImpl brandBean;
                brandBean = item.getModelObject();
                item.setOutputMarkupId(true);
                item.add(new Label("name", brandBean.getName()));
                item.add(new Label("createDate", brandBean.getCreateDate()));
                item.add(new Label("checkPerson", brandBean.getCheckPerson()));
                item.add(new Label("number", brandBean.getNumber()));
                item.add(new Label("summary", brandBean.getSummary()));

                final Label state = new Label("state", new PropertyModel<Integer>(brandBean,"state"));
                state.setOutputMarkupId(true);
                item.add(state);
                item.add(new Label("date", brandBean.getDate()));
                item.add(new Link("edit") {
                    @Override
                    public void onClick() {
                        BrandBeanImpl releaseBrand = (BrandBeanImpl) getParent().getDefaultModelObject();
                        form.setModelObject(releaseBrand);
                    }
                });
                item.add(new Link("del") {
                    @Override
                    public void onClick() {
                        BrandBeanImpl releaseBrand= (BrandBeanImpl) getParent().getDefaultModelObject();
                        brandService.deleteBrand(releaseBrand.getId());
                        setResponsePage(BrandPage.class);
                    }
                });

                item.add(new AjaxLink("editResource") {
                    @Override
                    public void onClick(AjaxRequestTarget target) {
                        BrandBeanImpl bean = (BrandBeanImpl) getParent().getDefaultModelObject();
                        PageParameters pageParameters=new PageParameters();
                        pageParameters.add("brandId",bean.getId());
                        setResponsePage(CartypeResources.class,pageParameters);
                    }
                });
                item.add(new AjaxLink("release") {
                    @Override
                    public void onClick(AjaxRequestTarget target) {
                        BrandBeanImpl releaseBrand= item.getModelObject();
                        releaseBrand.setState("待审核");
                        BrandBeanImpl releaseBran2=brandService.putBrand(releaseBrand);
                        item.getModelObject().setRevision(releaseBran2.getRevision());
                        target.add(item);
                    }

                    @Override
                    public boolean isVisible() {
                        return "未发布".equals(brandBean.getState()) || "被驳回".equals(brandBean.getState());
                    }
                });
                item.add(new AjaxLink("approve") {
                    @Override
                    public void onClick(AjaxRequestTarget target) {
                        BrandBeanImpl releaseBrand= item.getModelObject();
                        releaseBrand.setState("已发布");
                        releaseBrand.setNumber("1.0");
                        releaseBrand.setDate(new Date());
                        releaseBrand.setCheckPerson("系统管理员");
                        BrandBeanImpl releaseBran2=brandService.putBrand(releaseBrand);
                        item.getModelObject().setRevision(releaseBran2.getRevision());
                        target.add(item);
                    }
                    @Override
                    public boolean isVisible() {
                        return "待审核".equals(brandBean.getState());
                    }
                });
                item.add(new AjaxLink("reject") {
                    @Override
                    public void onClick(AjaxRequestTarget target) {
                        BrandBeanImpl releaseBrand= item.getModelObject();
                        releaseBrand.setState("被驳回");
                        BrandBeanImpl releaseBran2=brandService.putBrand(releaseBrand);
                        item.getModelObject().setRevision(releaseBran2.getRevision());
                        target.add(item);
                    }
                    @Override
                    public boolean isVisible() {
                        return "待审核".equals(brandBean.getState());
                    }
                });
                item.add(AttributeModifier.replace("class", new AbstractReadOnlyModel<String>() {
                    private static final long serialVersionUID = 1L;

                    @Override
                    public String getObject() {
                        return (item.getIndex() % 2 == 1) ? "even" : "odd";
                    }
                }));
            }
        };
        brandBeanDataView.setOutputMarkupId(true);
        add(brandBeanDataView);
    }
}