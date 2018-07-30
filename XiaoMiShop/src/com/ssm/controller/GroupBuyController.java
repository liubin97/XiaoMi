package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.Address;
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
	public ModelAndView selectUserAddress(Integer groupId,int groupBuyInfoId,HttpSession session){
		ModelAndView mav = new ModelAndView();

		String user_email = (String)session.getAttribute("user_email");
		List<Address> list = groupBuyService.selectUserAddress(user_email);
		
		GroupBuyInfo gbi = groupBuyService.selectGroupBuyInfoById(groupBuyInfoId);
		
		mav.addObject("addressList", list);
		mav.addObject("groupBuyInfo", gbi);
		mav.setViewName("selectUserAddress");
		
		return mav;
	}
}
