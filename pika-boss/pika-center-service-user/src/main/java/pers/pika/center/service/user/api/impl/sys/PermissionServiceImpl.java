package pers.pika.center.service.user.api.impl.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.pika.center.common.core.service.impl.BaseServiceImpl;
import pers.pika.center.service.user.api.sys.PermissionService;
import pers.pika.center.service.user.dao.sys.PermissionMapper;
import pers.pika.center.service.user.entity.sys.SysPermission;

import java.util.List;

/**
 * 用户权限服务
 *
 * @author Jere
 * @create 2018-04-30 10:39
 */

@Service("permissionServiceImpl")
public class PermissionServiceImpl extends BaseServiceImpl<SysPermission> implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<SysPermission> getUserPermissions(String userName) {
        return permissionMapper.getUserPermissions(userName);
    }
}
