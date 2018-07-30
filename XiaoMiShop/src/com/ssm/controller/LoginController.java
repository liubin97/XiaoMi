package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping("login")
    public String login(HttpServletRequest request, HttpSession session){
        System.out.println("into login");
        String redirectURL = request.getParameter("redirectURL");
        session.setAttribute("user_email","1");
        
        return "redirect:"+redirectURL;
    }
}
