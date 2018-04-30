package pers.pika.center.web.boss.controller.sys;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.pika.center.service.user.api.user.UserService;
import pers.pika.center.service.user.entity.sys.SysUser;

/**
 * 用户管理
 *
 * @author Jere
 * @create 2018-04-14 0:13
 */

@Controller
@RequestMapping("/user")
public class UserController {

    private Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserService userService;

    @RequestMapping("/find")
    public String find() {
        try {
            //SysUser sysUser = userService.getUserById(1L);
            //System.out.println(sysUser);
            System.out.println("hehe");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "login";
    }
}
