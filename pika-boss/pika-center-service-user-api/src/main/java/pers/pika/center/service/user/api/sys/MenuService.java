package pers.pika.center.service.user.api.sys;

import pers.pika.center.common.core.service.BaseService;
import pers.pika.center.service.user.entity.sys.SysMenu;

import java.util.List;

/**
 * Created by Jere on 2018/4/30.
 */
public interface MenuService extends BaseService<SysMenu> {

    /**
     * 获取所有父菜单
     * @return
     */
    List<SysMenu> getAllParentList();

    /**
     * 获取父菜单下的子菜单
     * @param id
     * @return
     */
    List<SysMenu> getSubMenuByParentId(Long id);

}
