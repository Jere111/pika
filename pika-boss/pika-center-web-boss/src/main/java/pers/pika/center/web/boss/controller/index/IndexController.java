package pers.pika.center.web.boss.controller.index;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.pika.center.service.user.api.sys.MenuService;
import pers.pika.center.service.user.entity.sys.SysMenu;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 主页控制类
 *
 * @author Jere
 * @create 2018-04-30 15:58
 */

@Controller
@RequestMapping(value="")
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "")
    public String index(HttpServletRequest request, ModelMap  map) {

        Subject currentUser = SecurityUtils.getSubject();
        // 验证是否成功登录的方法
        if(currentUser.isAuthenticated()) {

            // 获取所有左侧父菜单
            List<SysMenu> parentMenuList = menuService.getAllParentList();
            for (SysMenu parentMenu : parentMenuList) {
                parentMenu.setHasMenu(true);

                // 获取子菜单
                List<SysMenu> subMenu = menuService.getSubMenuByParentId(parentMenu.getId());
                parentMenu.setSubMenu(subMenu);
            }

            String sessionId = request.getSession().getId();
            map.put("menuList", parentMenuList);

            Subject subject = SecurityUtils.getSubject();
            if(subject != null){
                map.put("userName", String.valueOf(subject.getPrincipal()));
            }

            /**
             * 1、实现的功能：同一个账户只能同时在一个终端登录，重复登录会剔除之前的用户。
             * 2、这里的sessionId的作用，是为了在首页创建socket连接的时候，作为用户名参数的后缀，用于区分相同登录账户的不同客户端。
             *      比如：new WebSocket("ws://域名/websck?loginUserName=帐户名_sessionId的值");
             */
            map.put("sessionId", sessionId);
            return "index";//跳转到index.jsp

        }

        return "login/login";

    }
}
