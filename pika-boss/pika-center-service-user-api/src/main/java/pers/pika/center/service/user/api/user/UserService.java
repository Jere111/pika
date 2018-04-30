package pers.pika.center.service.user.api.user;

import pers.pika.center.common.core.service.BaseService;
import pers.pika.center.service.user.entity.sys.SysUser;


/**用户接口
 * Created by Jere on 2018/4/12.
 */
public interface UserService extends BaseService<SysUser> {
    /**
     * 根据ID获取用户
     * @param userId
     * @return
     * @throws Exception
     */
    SysUser getUserById(Long userId) throws Exception;

    /**
     * 根据username获取用户
     * @param username
     * @return
     */
    SysUser getUserByName(String username);
}
