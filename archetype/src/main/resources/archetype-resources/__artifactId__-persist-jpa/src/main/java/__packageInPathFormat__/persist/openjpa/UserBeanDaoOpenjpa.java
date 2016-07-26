package ${package}.persist.openjpa;

import ${package}.api.dao.IUserBeanDao;
import ${package}.api.persistence.IUserBean;
import ${package}.entities.UserBeanImpl;
import cn.com.rexen.core.impl.persistence.GenericOpenJpaDao;

import java.util.List;

/**
 * Created by dell on 14-1-16.
 */
public class UserBeanDaoOpenjpa extends GenericOpenJpaDao<IUserBean, Long> implements IUserBeanDao {
    private final String className = UserBeanImpl.class.getName();

    /**
     * Constructor that sets the entity to User.class.
     */
    public UserBeanDaoOpenjpa() {
//        super.setEntityManager(UserBeanImpl.class);
    }

    @Override
    public List<IUserBean> getUserList() {
        log.debug("get user info");
        return super.getAll(className);
    }

    @Override
    public IUserBean saveUser(IUserBean user) {
        return super.save(user);
    }

    @Override
    public void removeUser(Long userId) {
        super.remove(className, userId);
    }

    @Override
    public IUserBean getUser(Long userId) {
        return super.get(className, userId);
    }

    public IUserBean getUser(String username) {
        IUserBean user = this.findUnique("select u from UserBeanImpl u where u.name=?1", username);
        return user;
    }
}
