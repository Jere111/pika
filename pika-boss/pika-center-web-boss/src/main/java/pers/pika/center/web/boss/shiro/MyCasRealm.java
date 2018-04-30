package pers.pika.center.web.boss.shiro;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import pers.pika.center.service.user.api.sys.PermissionService;
import pers.pika.center.service.user.api.sys.RoleService;
import pers.pika.center.service.user.api.user.UserService;
import pers.pika.center.service.user.entity.sys.SysPermission;
import pers.pika.center.service.user.entity.sys.SysRole;
import pers.pika.center.service.user.entity.sys.SysUser;
import pers.pika.center.service.user.enums.UserStatus;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * cas与shiro集成，单点登陆认证核心
 *
 * @author Jere
 * @create 2018-04-30 9:29
 */

public class MyCasRealm extends CasRealm {

    private static final Logger LOGGER = LoggerFactory.getLogger(CasRealm.class);

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    /**
     * 登录认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        CasToken casToken = (CasToken)token;

        if (token == null) {
            return null;
        }

        String ticket = (String) casToken.getCredentials();
        if (StringUtils.isBlank(ticket)) {
            return null;
        }

        TicketValidator ticketValidator = ensureTicketValidator();

        Assertion casAssertion;
        String username = null;

        try {
            casAssertion = ticketValidator.validate(ticket, getCasService());

            AttributePrincipal casPrincipal = casAssertion.getPrincipal();
            username = casPrincipal.getName();

            Map<String, Object> attributes = casPrincipal.getAttributes();
            casToken.setUserId(username);
            String rememberMeAttributeName = getRememberMeAttributeName();
            String rememberMeStringValue = (String) attributes.get(rememberMeAttributeName);
            boolean isRemembered = rememberMeStringValue != null && Boolean.parseBoolean(rememberMeStringValue);
            if (isRemembered) {
                casToken.setRememberMe(true);
            }

            List<Object> principals = org.apache.shiro.util.CollectionUtils.asList(username, attributes);
            PrincipalCollection principalCollection = new SimplePrincipalCollection(principals, getName());

            return new SimpleAuthenticationInfo(principalCollection, ticket);

        } catch (TicketValidationException e) {
            e.printStackTrace();
        }

        /**======================================目前针对账户锁定、禁用等特殊需求，暂未实现，因为CAS处理这些情况比较麻烦，后期会完善。============================================*/

        if (StringUtils.isEmpty(username)) {
            LOGGER.error("登录用户名为空.");
            throw new AccountException("登录用户名为空.");
        }

        // 根据用户名加载记录
        SysUser user;
        try {
            user = userService.getUserByName(username);
        } catch (Exception e) {
            e.printStackTrace();
            throw new AuthenticationException("根据登录用户名" + username + "获取用户数据失败.", e);
        }
        if (user == null) {
            final String errmsg = "未查询到对应的用户数据，登录用户名:[" + username + "]";
            LOGGER.error(errmsg);
            throw new UnknownAccountException(errmsg);
        } else if (user.getStatus() == UserStatus.LOCK) {// 锁定状态
            throw new LockedAccountException("帐户 [" + username + "] 被锁定.");
        } else if (user.getStatus() == UserStatus.DISABLE) {
            throw new DisabledAccountException("帐户 [" + username + "] 被禁用");
        }
        return new SimpleAuthenticationInfo(user.getUserName(),user.getPassword(), getName());
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String userName = (String)principals.fromRealm(getName()).iterator().next();
        SysUser user = null;
        try {
            // 根据用户名加载记录
            user = userService.getUserByName(userName);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        if (user == null) {
            return null;
        }

        // 添加session
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        session.setAttribute("userInfo", user);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        try {
            // roles
            Set<String> roles = new HashSet<String>();
            // 查找用户角色
            List<SysRole> roleLi = roleService.getUserRoles(userName);
            if (CollectionUtils.isNotEmpty(roleLi)) {
                for (SysRole foo : roleLi) {
                    roles.add(foo.getName());
                }
            }
            info.addRoles(roles);

            // 根据用户名获取权限
            // permissions
            Set<String> permissions = new HashSet<String>();
            List<SysPermission> permissionsLi = permissionService.getUserPermissions(userName);
            if (CollectionUtils.isNotEmpty(permissionsLi)) {
                for (SysPermission foo : permissionsLi) {
                    if (StringUtils.isNotEmpty(foo.getCode())) {
                        permissions.add(foo.getCode());
                    }
                }
            }
            info.addStringPermissions(permissions);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Fetch roles and permissions for user[" + userName + "] failed: ", e);
        }

        return info;
    }

    /**
     * 刷新用户权限缓存
     */
    public void clearAuthz() {
        //这里是只清除当前用户的权限缓存数据
        this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
    }
}
