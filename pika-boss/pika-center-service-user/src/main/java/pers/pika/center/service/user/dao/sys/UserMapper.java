package pers.pika.center.service.user.dao.sys;

import org.apache.ibatis.annotations.Param;
import pers.pika.center.service.user.entity.sys.SysUser;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @author Jere
 * @create 2018-04-12 22:01
 */

public interface UserMapper extends Mapper<SysUser> {

    /**
     * 根据用户名获取用户
     * @param userName
     * @return
     */
    List<SysUser> getUserByName(@Param("userName") String userName);
}
