package pers.pika.center.service.user.api.impl.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.pika.center.common.core.enums.Status;
import pers.pika.center.common.core.service.impl.BaseServiceImpl;
import pers.pika.center.service.user.api.sys.MenuService;
import pers.pika.center.service.user.dao.sys.MenuMapper;
import pers.pika.center.service.user.entity.sys.SysMenu;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 菜单服务
 *
 * @author Jere
 * @create 2018-04-30 16:53
 */
@Service("menuServiceImpl")
public class MenuServiceImpl extends BaseServiceImpl<SysMenu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<SysMenu> getAllParentList() {
        Example example = new Example(SysMenu.class);
        example.createCriteria().andEqualTo("parentId", 0).andEqualTo("status", Status.ENABLE);
        example.setOrderByClause("sort ASC");
        return menuMapper.selectByExample(example);
    }

    @Override
    public List<SysMenu> getSubMenuByParentId(Long id) {
        Example example = new Example(SysMenu.class);
        example.createCriteria().andEqualTo("parentId", id);
        example.setOrderByClause("sort ASC");//排序值升序排序
        return menuMapper.selectByExample(example);
    }
}
