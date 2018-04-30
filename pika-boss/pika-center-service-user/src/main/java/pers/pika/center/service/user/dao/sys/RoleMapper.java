package pers.pika.center.service.user.dao.sys;

import org.apache.ibatis.annotations.Param;
import pers.pika.center.service.user.entity.sys.SysRole;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by Jere on 2018/4/30.
 */
public interface RoleMapper extends Mapper<SysRole> {

    /**
     * 获取用户拥有的角色列表
     * @param userName
     * @return
     */
    List<SysRole> getUserRoles(@Param("userName") String userName);

}
