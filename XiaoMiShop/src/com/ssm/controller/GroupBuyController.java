package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.UserAddress;
import com.ssm.model.service.GroupBuyService;

@Controller
public class GroupBuyController {
	@Autowired
	private GroupBuyService groupBuyService;
	
	@RequestMapping("selectAllGroupBuyInfo")
	public String selectAllGroupBuyInfo(Model model) {
		List<GroupBuyInfo> list = groupBuyService.selectAllGroupBuyGoods();
		model.addAttribute("allGroupBuyInfo",list);
		return "selectAllGroupBuyInfo";
	}
	
	@RequestMapping("selectGroupBuyInfoById")
	public String selectGroupBuyInfoById(Model model,int groupBuyInfoId) {
		GroupBuyInfo gbi = groupBuyService.selectGroupBuyInfoById(groupBuyInfoId);
		model.addAttribute("resultGroupBuyInfo", gbi);
		return "selectGroupBuyInfo";
	}
	
	@RequestMapping("selectUserAddress")
	public @ResponseBody List<UserAddress> selectUserAddress(@RequestBody String user_email){
		List<UserAddress> list = groupBuyService.selectUserAddress(user_email);
		return list;
	}
}
