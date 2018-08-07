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

import com.ssm.model.bean.Order;
import com.ssm.model.service.UserGroupBuyService;

@Controller
public class UserGroupBuyController {
	@Autowired
	private UserGroupBuyService userGroupBuyService;
	
	@RequestMapping("selectUserGroupBuyOrder")
	public ModelAndView selectUserGroupBuyOrder(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("用户查询团购订单");
		//String user_email = (String)session.getAttribute("user_email");
		String user_email = "222@222.com";
		List<Order> list = userGroupBuyService.selectUserGroupBuyOrder(user_email);
//		for(Order o:list) {
//			System.out.println("order_id="+o.getOrder_id());
//		}
		mav.addObject("orderList", list);
		mav.setViewName("myGroupOrder");
		return mav;
	}
	
	@RequestMapping("selectGroupBuyOrderDetail")
	public ModelAndView selectGroupOrderDetail(int orderId) {
		ModelAndView mav = new ModelAndView();
		Order orderDetail = userGroupBuyService.selectGroupBuyOrderDetail(orderId);
		System.out.println(orderDetail.getOrder_id());
		mav.addObject("orderDetail", orderDetail);
		mav.setViewName("myGroupBuyOrderDetail");
		return mav;
	}
	
	@RequestMapping("deleteUserGroup")
	public String deleteUserGroup(int orderId) {
		
		//String user_email = (String)session.getAttribute("user_email");
		String user_email = "222@222.com";
		System.out.println(orderId);
		userGroupBuyService.deleteUserGroup(user_email, orderId);
		
		return "redirect:selectUserGroupBuyOrder.action";
	}
}
