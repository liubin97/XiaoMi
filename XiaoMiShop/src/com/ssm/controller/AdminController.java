package com.ssm.controller;

import java.util.List;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.model.bean.Admin;
import com.ssm.model.service.AdminService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("validateLogin.action")
	public String validateLogin(String admin_name, String admin_password, HttpSession session){
		int result = adminService.validateLogin(admin_name,admin_password);
		if(result == 0){
			session.setAttribute("admin_name",admin_name);
			return "forward:manageSecKill.jsp";
		}else {
			session.setAttribute("loginmsg","false");
			return "redirect:adminLogin.jsp";
		}

	}
}
