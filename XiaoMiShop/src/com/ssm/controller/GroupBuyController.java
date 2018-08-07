package com.ssm.controller;

import java.util.Date;
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
	
	//查询所有的团购商品信息
	@RequestMapping("selectAllGroupBuyInfo")
	public String selectAllGroupBuyInfo(Model model) {
		List<GroupBuyInfo> list = groupBuyService.selectAllGroupBuyGoods();
		//System.out.println("2");
		
		model.addAttribute("allGroupBuyInfo",list);
		return "selectAllGroupBuyInfo";
	}
	
	//查询某一个具体的团购信息
	@RequestMapping("selectGroupBuyInfoById")
	public String selectGroupBuyInfoById(Model model,int groupBuyInfoId) {
		GroupBuyInfo gbi = groupBuyService.selectGroupBuyInfoById(groupBuyInfoId);
		System.out.println(gbi.getGroup_starttime().before(new Date()));
		int flag = 0;
		String url="";
		if(gbi.getGroup_starttime().after(new Date())) {
			flag = 1;
		}else if(gbi.getGroup_endtime().before(new Date())) {
			flag = 3;
		}else if(gbi.getGroup_starttime().before(new Date())&&gbi.getGroup_endtime().after(new Date())) {
			flag = 2;
			url="selectAllGroup.action";
		}
		
		model.addAttribute("resultGroupBuyInfo", gbi);
		model.addAttribute("flag", flag);
		model.addAttribute("url", url);
		return "selectGroupBuyInfo";
	}
	
	@RequestMapping("selectAllGroup")
	public String selectAllGroup(Model model,int groupBuyInfoId) {
		GroupBuyInfo gbi = groupBuyService.selectGroupBuyInfoById(groupBuyInfoId);
		model.addAttribute("resultGroupBuyInfo", gbi);
		return "selectAllGroup";
	}
	
	//给用户选择地址检查购物信息的页面
	@RequestMapping("selectUserAddress")
	public ModelAndView selectUserAddress(Integer groupId,int groupBuyInfoId,HttpSession session){
		ModelAndView mav = new ModelAndView();
		//String user_email = (String)session.getAttribute("user_email");
		System.out.println(groupId);
		if(groupId!=null) {
			System.out.println("该用户加入了团");
			String user_email = "222@222.com";
			List<Address> list = groupBuyService.selectUserAddress(user_email);
		
			GroupBuyInfo gbi = groupBuyService.selectGroupBuyInfoById(groupBuyInfoId);
		
			mav.addObject("addressList", list);
			mav.addObject("groupBuyInfo", gbi);
			mav.addObject("groupId", groupId);
			mav.setViewName("confirmGroupBuyOrder");
		}else {
			System.out.println("该用户发起了团");
			String user_email = "333@333.com";
			List<Address> list = groupBuyService.selectUserAddress(user_email);
		
			GroupBuyInfo gbi = groupBuyService.selectGroupBuyInfoById(groupBuyInfoId);
		
			mav.addObject("addressList", list);
			mav.addObject("groupBuyInfo", gbi);
			mav.setViewName("confirmGroupBuyOrder");
		}
		return mav;
	}
	
	//用户选择完地址检查完个人信息之后生成订单
	@RequestMapping("generateOrder")
	public String generateOrder(Integer groupId,HttpSession session,int addressId,int groupBuyInfoId) {
//		ModelAndView mav = new ModelAndView();
		//String user_email = (String)session.getAttribute("user_email");
		String user_email = "222@222.com";
		System.out.println("groupId:"+groupId);
		System.out.println("addressId:"+addressId);
		System.out.println("groupBuyInfoId:"+groupBuyInfoId);
		if(groupId!=null) {
			System.out.println("加入团");
			groupBuyService.insertGroup(groupId, addressId, user_email);
		}else {
			System.out.println("发起团");
			groupBuyService.insertNewGroup(groupBuyInfoId, user_email, addressId);
		}
		
//		mav.setViewName("selectAllGroupBuyInfo");
		
		return "redirect:selectAllGroupBuyInfo.action";
	}
	
	@RequestMapping("getIsInGroup")
	public @ResponseBody int getIsInGroup(int groupId,HttpSession session){
		//String user_email = (String)session.getAttribute("user_email");
		System.out.println("ajax groupId:"+groupId);
		
		int isInGroup = groupBuyService.getIsInGroup(groupId, "222@222.com");
		System.out.println(isInGroup);
		return isInGroup;
	}
	
	@RequestMapping("getStock")
	public @ResponseBody int getStock(int goodsDetailId) {
		System.out.println(goodsDetailId);
		return groupBuyService.getStock(goodsDetailId);
	}
	
}
