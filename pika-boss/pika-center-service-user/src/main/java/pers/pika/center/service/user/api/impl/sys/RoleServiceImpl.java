package pers.pika.center.service.user.api.impl.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.pika.center.common.core.service.impl.BaseServiceImpl;
import pers.pika.center.service.user.api.sys.RoleService;
import pers.pika.center.service.user.dao.sys.RoleMapper;
import pers.pika.center.service.user.entity.sys.SysRole;

import java.util.List;

/**
 * 用户角色服务
 *
 * @author Jere
 * @create 2018-04-30 10:28
 */
@Service("roleServiceImpl")
public class RoleServiceImpl extends BaseServiceImpl<SysRole> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<SysRole> getUserRoles(String username) {
        return roleMapper.getUserRoles(username);
    }
}
