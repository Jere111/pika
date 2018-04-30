package pers.pika.center.service.user.dao.sys;

import org.apache.ibatis.annotations.Param;
import pers.pika.center.common.core.vo.Pager;
import pers.pika.center.service.user.entity.sys.SysMenu;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by Jere on 2018/4/30.
 */
public interface MenuMapper extends Mapper<SysMenu> {

    /**
     * 获取菜单列表
     * @param sysMenu
     * @param pager
     * @return
     */
    List<SysMenu> getList(@Param("menu") SysMenu sysMenu, @Param("pager") Pager<SysMenu> pager);

}
