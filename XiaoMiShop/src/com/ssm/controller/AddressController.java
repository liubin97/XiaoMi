package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.model.bean.Address;
import com.ssm.model.service.AccountService;
import com.ssm.model.service.AddressService;

@Controller
public class AddressController {
	@Autowired
    private AddressService addressService;
	
	@RequestMapping("insertAddress")
	public String insertAddress(Address address,HttpSession session){
		String user_email=(String) session.getAttribute("user_email");
		address.setUser_email(user_email);
		address.setIsdefault(0);
		System.out.println(address.getAreaPath());
		addressService.insertAddress(address);
		session.setAttribute("addrstatus", "新建地址成功");
		return "redirect:getAllAddress.action";
	}
	
	@RequestMapping("getAllAddress")
	public String getAllAddress(HttpSession session,Model model){
		String user_email=(String) session.getAttribute("user_email");
		List<Address> addresslist=addressService.getAllAddress(user_email);
		model.addAttribute("addresslist", addresslist);
		return "forward:manage_address.jsp";
		
	}
	@RequestMapping("getAllAddress2")
	public String getAllAddress2(HttpSession session,Model model){
		String user_email=(String) session.getAttribute("user_email");
		List<Address> addresslist=addressService.getAllAddress(user_email);
		model.addAttribute("addresslist", addresslist);
		return "forward:manage_address2.jsp";
		
	}
	@RequestMapping("deleteAddress")
	public String deleteAddress(HttpSession session,int address_id){
		addressService.deleteAddress(address_id);
		session.setAttribute("addrstatus", "删除地址成功");
		return "redirect:getAllAddress.action";
	}
	
	@RequestMapping("updateDefault")
	public String updateDefault(int address_id,HttpSession session){
		String user_email=(String) session.getAttribute("user_email");
		addressService.updateDefault(user_email, address_id);
		session.setAttribute("addrstatus", "设置默认成功");
		return "redirect:getAllAddress.action";
	}

	@RequestMapping("insertAddressAjax")
	public @ResponseBody Address insertAddressAjax(@RequestBody Address address,HttpSession session){
		String user_email=(String) session.getAttribute("user_email");
		address.setUser_email(user_email);
		address.setIsdefault(0);
		System.out.println(address.getAreaPath());
		addressService.insertAddress(address);
		return address;
	}
	
	
}
