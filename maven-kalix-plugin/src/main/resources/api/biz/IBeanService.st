package %packageName%.api.biz;

import cn.com.rexen.core.api.biz.IBizService;
import %packageName%.entities.%beanName%Bean;

import java.util.List;

/**
 * @类描述：公告管理
 * @创建人： sunlf
 * @创建时间：2014/10/10
 * @修改人：
 * @修改时间：
 * @修改备注：
 */
public interface I%beanName%BeanService extends IBizService {
    public List<%beanName%> query(String text);
}
