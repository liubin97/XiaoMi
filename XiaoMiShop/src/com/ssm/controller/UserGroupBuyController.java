package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ssm.model.service.UserGroupBuyService;

@Controller
public class UserGroupBuyController {
	@Autowired
	private UserGroupBuyService userGroupBuyService;
	
	public String selectUserGroupBuyOrder() {
		
		
		return null;
	}
}
