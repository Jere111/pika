package pers.pika.center.service.user.dao.sys;

import org.apache.ibatis.annotations.Param;
import pers.pika.center.service.user.entity.sys.SysPermission;
import tk.mybatis.mapper.common.Mapper;


import java.util.List;

/**
 * Created by Jere on 2018/4/30.
 */
public interface PermissionMapper extends Mapper<SysPermission> {

    /**
     * 获取用户权限列表
     * @param userName
     * @return
     */
    List<SysPermission> getUserPermissions(@Param("userName") String userName);

}
