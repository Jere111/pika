package pers.pika.center.web.boss.shiro;

import org.apache.shiro.ShiroException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Shiro全局身份验证错误视图转发
 *
 * @author Jere
 * @create 2018-04-30 9:41
 */

public class OperatorExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView modelAndView = new ModelAndView();

        if(e instanceof UnauthorizedException){//未授权，没有权限
            modelAndView.setViewName("/unauthorized");
        }else if(e instanceof ShiroException){//shiro系统错误
            modelAndView.setViewName("/syserror");
        }else{//其他异常
            modelAndView.setViewName("/user/500");
        }
        return modelAndView;
    }
}
