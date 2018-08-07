package com.ssm.utils;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
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
            String requesturl=httpServletRequest.getRequestURI();
            //TODO
            // 判断请求的类型
           // String desturl=requesturl.substring(11);

            System.out.println("------------------------------------------------");
            System.out.println("getServletPath:"+httpServletRequest.getServletPath());
            String contextPath = httpServletRequest.getContextPath();
            String realPath = httpServletRequest.getSession().
                    getServletContext().getRealPath("/");
            String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName()+":"+
                    httpServletRequest.getServerPort()+contextPath+"/";
            System.out.println("contextPath:"+contextPath);
            System.out.println("realPath:"+realPath);
            System.out.println("basePath:"+basePath);
            System.out.println();

            String redirectUrl =basePath+ "login.jsp" + "?redirectURL=" + requesturl;
            System.out.println(redirectUrl);

            //获取url参数
            redirectUrl += "?" + httpServletRequest.getQueryString();

            //判断是否为ajax请求
            if (httpServletRequest.getHeader("x-requested-with") != null && httpServletRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
                /*httpServletResponse.setHeader("SESSIONSTATUS", "TIMEOUT");
                httpServletResponse.setHeader("CONTEXTPATH", redirectUrl);*/
                httpServletResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);//403禁止
                PrintWriter out = httpServletResponse.getWriter();
                out.print("loseSession");//session失效
                out.flush();
                return false;
            }else{//正常请求

                httpServletResponse.sendRedirect(redirectUrl);
                return false;// 拦截用户，不可执行该Handler
            }


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
