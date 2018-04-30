package pers.pika.center.service.user.qo.sys;

import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * 登录参数绑定
 *
 * @author Jere
 * @create 2018-04-29 23:59
 */

public class LoginQo implements Serializable {
    private static final long serialVersionUID = -4830309263466309037L;

    @NotEmpty
    private String userName;
    @NotEmpty
    private String password;

    private String rememberMe;

    private String code;//验证码


    private boolean openVerifyCode;//是否开启验证码验证

    private boolean openAjaxLogin;//是否使用ajax登录

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(String rememberMe) {
        this.rememberMe = rememberMe;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isOpenVerifyCode() {
        return openVerifyCode;
    }

    public void setOpenVerifyCode(boolean openVerifyCode) {
        this.openVerifyCode = openVerifyCode;
    }

    public boolean isOpenAjaxLogin() {
        return openAjaxLogin;
    }

    public void setOpenAjaxLogin(boolean openAjaxLogin) {
        this.openAjaxLogin = openAjaxLogin;
    }
}
