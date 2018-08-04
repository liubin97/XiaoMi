package com.ssm.controller;

import java.util.List;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.model.bean.Admin;
import com.ssm.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping("select.action")
	public String selectAdmin(Model model){
		List<Admin> list = adminService.selectAdmin();
		model.addAttribute("resultList", list);
		return "select";
	}
}
