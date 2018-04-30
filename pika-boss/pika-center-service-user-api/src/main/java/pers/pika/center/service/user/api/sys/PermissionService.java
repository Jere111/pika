package pers.pika.center.service.user.api.sys;

import pers.pika.center.common.core.service.BaseService;
import pers.pika.center.service.user.entity.sys.SysPermission;

import java.util.List;

/**
 * Created by Jere on 2018/4/30.
 */
public interface PermissionService extends BaseService<SysPermission> {

    /**
     * 获取用户拥有的权限列表
     * @param userName
     * @return
     */
    List<SysPermission> getUserPermissions(String userName);

}
