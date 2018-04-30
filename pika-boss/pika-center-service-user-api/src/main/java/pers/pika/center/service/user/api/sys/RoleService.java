package pers.pika.center.service.user.api.sys;

import pers.pika.center.common.core.service.BaseService;
import pers.pika.center.service.user.entity.sys.SysRole;

import java.util.List;

/**
 * Created by Jere on 2018/4/30.
 */
public interface RoleService extends BaseService<SysRole> {

    /**
     * 获取用户拥有的角色列表
     * @param username
     * @return
     */
    List<SysRole> getUserRoles(String username);

}
