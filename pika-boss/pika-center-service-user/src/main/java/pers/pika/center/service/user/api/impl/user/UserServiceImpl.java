package pers.pika.center.service.user.api.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.pika.center.common.core.service.impl.BaseServiceImpl;
import pers.pika.center.service.user.api.user.UserService;
import pers.pika.center.service.user.dao.sys.UserMapper;
import pers.pika.center.service.user.entity.sys.SysUser;

import java.util.List;

/**
 * 用户接口服务
 *
 * @author Jere
 * @create 2018-04-12 21:58
 */

@Service("userServiceImpl")
public class UserServiceImpl extends BaseServiceImpl<SysUser> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public SysUser getUserById(Long userId) throws Exception {
        if (userId != null) {
            return userMapper.selectByPrimaryKey(userId);
        }
        return null;
    }

    @Override
    public SysUser getUserByName(String username) {
        List<SysUser> list = userMapper.getUserByName(username);
        if(list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
}
