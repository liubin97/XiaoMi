package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping("login")
    public String login(HttpServletRequest request, HttpSession session){
        System.out.println("-----------------------------------------------------------");
        System.out.println("into login");
        String redirectURL = request.getParameter("redirectURL");
        System.out.println("url:"+redirectURL);
        session.setAttribute("user_email","xdmango@qq.com");
        redirectURL = redirectURL.substring(0, redirectURL.indexOf("?"));
        System.out.println("url:"+redirectURL);


        return "redirect:"+redirectURL;
    }

//    @RequestMapping("login")
//    public RedirectView login(HttpServletRequest request, HttpSession session){
//        System.out.println("----------------------------------------------");
//        System.out.println("into login");
//        String redirectURL = request.getParameter("redirectURL");
//        System.out.println("url:"+redirectURL);
//        session.setAttribute("user_email","1");
////        redirectURL = redirectURL.substring(0, redirectURL.indexOf("?"));
////        System.out.println("url:"+redirectURL);
//
//        return new RedirectView(redirectURL,true,false,false);
//    }
}
