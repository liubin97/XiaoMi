package com.ssm.utils;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.Map;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if (httpServletRequest.getSession().getAttribute("user_email") == null) {
            /*
             * 用户没登录，跳转到登录页面（使用重定向，因为这里跨系统了也就是不是在一个工程内部）
             * 要携带参数：redirectURL。（上一个页面的url，也就是发出当前Request请求的url，
             * 用于登录完成后返回之前的页面继续操作。）
             */
            String redirectUrl = "login.jsp" + "?redirectURL=" + httpServletRequest.getRequestURI();
            //获取url参数
            redirectUrl += "?" + httpServletRequest.getQueryString();
            httpServletResponse.sendRedirect(redirectUrl);
            return false;// 拦截用户，不可执行该Handler
        }
        // 用户已经登录，放行。
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
