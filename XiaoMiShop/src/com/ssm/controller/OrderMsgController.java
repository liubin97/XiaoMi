package com.ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;
import com.ssm.model.service.OrderMsgService;
import com.ssm.model.service.PurchaseService;

@Controller
public class OrderMsgController {
	@Autowired
    private OrderMsgService orderMsgService;
	
	@RequestMapping("selectOrdersByStatus")
	public String selectOrdersByStatus(int order_status,HttpSession session,Model model){
		Map<String,Object> esmap=new HashMap<String, Object>();
		String user_email=(String) session.getAttribute("user_email");
		esmap.put("user_email", user_email);
		esmap.put("order_status", order_status);
		List<Order> ordermsglist=orderMsgService.selectOrdersByStatus(esmap);
		model.addAttribute("ordermsglist", ordermsglist);
		model.addAttribute("order_status", order_status);
		return "forward:myorder.jsp";
	}
	
	@RequestMapping("selectOrders")
	public String selectOrders(int order_status,String searchkey,HttpSession session,Model model){
		Map<String,Object> esmap=new HashMap<String, Object>();
		String user_email=(String) session.getAttribute("user_email");
		esmap.put("user_email", user_email);
		esmap.put("order_status", order_status);
		List<Order> ordermsglist=orderMsgService.selectOrdersByStatus(esmap);
		List<Order> searchlist=new ArrayList<Order>();
	
		for(Order order:ordermsglist){
			
			int flag=0;
			if(order.getAddress().getRecv_people().indexOf(searchkey)!=-1){
				System.out.println("");
				flag=1;
			}
			if(String.valueOf(order.getOrder_id()).equals(searchkey)){
				flag=1;
			}
			for(OrderItem orderitem:order.getOrder_items()){
				if(orderitem.getGoodsDetail().getGoods().getGoods_name().indexOf(searchkey)!=-1){
					flag=1;
				}
			
			}
			if(flag==1){
				searchlist.add(order);
				
			}
			
			
		}
		
		model.addAttribute("ordermsglist", searchlist);
		model.addAttribute("order_status", order_status);
		return "forward:myorder.jsp";
	}
	
	@RequestMapping("getDetail")
	public String getDetail(int order_id,Model model){
		Order order=orderMsgService.getDetail(order_id);
		model.addAttribute("detail", order);
		return "forward:order_msg_detail.jsp";
	}
	
	@RequestMapping("finishOrder")
	public String finishOrder(int order_id){
		orderMsgService.updateFinish(order_id);
		return "redirect:getDetail.action?order_id="+order_id;
	}
	
}
