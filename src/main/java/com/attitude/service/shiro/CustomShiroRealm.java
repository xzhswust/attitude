package com.attitude.service.shiro;

/**
 * Created by zh.xu on 14-3-23.
 */

import com.attitude.common.utils.MapperServiceUtil;
import com.attitude.common.utils.Md5Util;
import com.attitude.dal.mybatis.dao.UserMapper;
import com.attitude.dal.mybatis.entity.User;
import com.attitude.dal.mybatis.entity.UserExample;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import java.util.List;

/**
 * 自定义的指定Shiro验证用户登录的类
 */
public class CustomShiroRealm extends AuthorizingRealm {

    /**
     * 为当前登录的Subject授予角色和权限
     * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
     * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
     * @see 若使用了Spring3.1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache
     * @see 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        String userName = (String) super.getAvailablePrincipal(principals);
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        try {
            UserMapper userMapper = MapperServiceUtil.getUserMapperService();
            UserExample userExample = new UserExample();
            userExample.createCriteria().andUserNameEqualTo(userName);
            List<User> users = userMapper.selectByExample(userExample);
            if (null != users && users.size() == 1) {
                //simpleAuthorInfo.addRole(users.get(0).getUserrole());
                return simpleAuthorInfo;
            }else{
                //throw new UnknownAccountException();
                return null;
            }
        } catch (Exception ex) {
            //throw new AuthenticationException(ex.getMessage());
            return null;
        }
    }


    /**
     * 验证当前登录的Subject
     * @see 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken) authcToken; //获取基于用户名和密码的令牌
        String userName = token.getUsername();
        List<User> users = null;
        try {
            UserMapper userMapper = MapperServiceUtil.getUserMapperService();
            UserExample userExample = new UserExample();
            userExample.createCriteria().andUserNameEqualTo(userName);
            users = userMapper.selectByExample(userExample);
        }catch (Exception ex){
            throw new AuthenticationException(ex.getMessage());
        }
        if (null == users || users.size() == 0) {
            throw new UnknownAccountException();
        }

        if (null != token && null != token.getPassword()) {
            String password = String.valueOf(users.get(0).getPassword());

            if (Md5Util.getMd5Password(String.valueOf(token.getPassword())).equals(password)) {
                AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(token.getUsername(), token.getPassword(), token.getUsername());

                Subject user = SecurityUtils.getSubject();
                user.getSession().setAttribute("currUser", userName);  //记录登录用户名
                user.getSession().setAttribute("realName", users.get(0).getRealName());   //记录用户真实姓名

                return authcInfo;
            }
        }

        throw new IncorrectCredentialsException();
    }
}
