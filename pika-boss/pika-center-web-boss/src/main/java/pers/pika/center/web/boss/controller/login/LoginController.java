package pers.pika.center.web.boss.controller.login;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.pika.center.common.core.util.CryptoUtils;
import pers.pika.center.common.core.util.JsonUtil;
import pers.pika.center.common.core.vo.AjaxResult;
import pers.pika.center.service.user.api.user.UserService;
import pers.pika.center.service.user.qo.sys.LoginQo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

/**
 * 登录管理
 *
 * @author Jere
 * @create 2018-04-14 0:13
 */

@Controller
@RequestMapping("/login")
public class LoginController {

    private Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserService userService;

    @RequestMapping("/tologin")
    public String find() {
        return "login/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response, ModelMap map,
                        @Valid LoginQo loginQo, BindingResult bindingResult) throws IOException {

        response.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=utf-8");

        //ajax登录方式
        AjaxResult<String> result = new AjaxResult<String>();

        // 错误消息
        String loginErrorMsg = "";

        // 参数错误验证
        if (bindingResult.hasErrors()) {
            if (!loginQo.isOpenAjaxLogin()) {
                loginErrorMsg = "用户名或密码不能为空";
                map.put("loginErrorMsg", loginErrorMsg);
                return "login/login";
            } else {
                result.setCode(10001);
                result.setMsg(loginErrorMsg);
                response.getWriter().println(JsonUtil.toJson(result));
                return null;
            }
        }

        UsernamePasswordToken token = new UsernamePasswordToken(loginQo.getUserName(), CryptoUtils.encodeMD5(loginQo.getPassword()));
        Subject subject = null;
        try {
            // 设置是否记住我
            if (null == loginQo.getRememberMe() || "".equals(loginQo.getRememberMe().trim())
                    || "off".equals(loginQo.getRememberMe())) {
                token.setRememberMe(false);
            } else {
                token.setRememberMe(true);
            }
            SecurityUtils.getSubject().login(token);
            subject = SecurityUtils.getSubject();
            LOGGER.debug("用户：{0} 登录成功", subject.getPrincipal());

            SecurityUtils.getSubject().getSession().setTimeout(1000 * 60 * 60);
            request.getSession().setAttribute("nickName", subject.getPrincipal());
        } catch (Throwable e) {
            /**
             * 这些异常都是shiro中的异常，你可以阵对不同的异常来显示不同的消息提示。 异常的捕捉抛出，请查看
             * pers.zb.web.shiro.GlobalAuthorizingRealm 中的
             * doGetAuthenticationInfo方法。
             * AuthenticationException异常是所有异常的父类，所以，应该把这个异常放在最后一个if判断
             */
            // UnknownAccountException 该账号不存在
            // CredentialsException 密码错误
            if (e instanceof ConcurrentAccessException) {
                loginErrorMsg = "您的账户已经在别处登录";

            } else if (e instanceof LockedAccountException) {
                loginErrorMsg = "您的账户已被锁定";

            } else if (e instanceof DisabledAccountException) {
                loginErrorMsg = "您的账户已被禁用";

            } else if (e instanceof AuthenticationException) {
                loginErrorMsg = "账号不存在或密码错误";

            } else {
                LOGGER.error("未知的登陆错误", e);
                loginErrorMsg = "未知的登陆错误，请稍后重试";
            }
        }

        // 登录出现错误
        if (!"".equals(loginErrorMsg) && loginErrorMsg.length() > 0) {
            if (!loginQo.isOpenAjaxLogin()) {
                map.put("loginErrorMsg", loginErrorMsg);
                return "login/login";
            } else {
                result.setCode(10003);
                result.setMsg(loginErrorMsg);
                response.getWriter().println(JsonUtil.toJson(result));
                return null;
            }
        }

        if (!loginQo.isOpenAjaxLogin()) {//登录成功，进入主页
            return "redirect:/index";
        } else {
            response.getWriter().println(JsonUtil.toJson(result));
            return null;
        }
    }
}
