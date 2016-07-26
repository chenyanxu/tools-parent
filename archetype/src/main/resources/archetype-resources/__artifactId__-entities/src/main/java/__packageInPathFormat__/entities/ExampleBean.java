package ${package}.entities;

import cn.com.rexen.core.impl.persistence.PersistentEntity;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * Created by dell on 14-1-16.
 */
@Entity
@Table(name = "biz_example")
@Inheritance(strategy = InheritanceType.JOINED)
@XmlRootElement
public class ExampleBean extends PersistentEntity{

    private String name;
    private String password;
    private String email;

    public ExampleBeanImpl() {

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static void main(String[] args) throws Exception {

    }
}
