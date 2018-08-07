package com.ssm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.model.bean.Message;
import com.ssm.model.service.AccountService;
import com.ssm.model.service.NoticeMsgService;
import  java.util.*;
@Controller
public class NoticeMsgController {
	
	@Autowired
    private NoticeMsgService noticeMsgService;
	
	@RequestMapping("getNoReadNum")
	public @ResponseBody int getNoReadNum(HttpSession session){
		String user_email=(String) session.getAttribute("user_email");
		if(user_email==null||"".equals(user_email)){
			return 0;
		}else{
			int noread=noticeMsgService.getNoReadNum(user_email);
			return noread;
		}
	}
	
	@RequestMapping("selectByTypeFlag")
	public String selectByTypeFlag(HttpSession session,Model model,int read_flag){
		String user_email=(String) session.getAttribute("user_email");
		Map<String,Object> etfmap=new HashMap<String, Object>();
		etfmap.put("user_email", user_email);
		etfmap.put("read_flag", read_flag);
		List<Message> msglist=noticeMsgService.selectByTypeFlag(etfmap);
		model.addAttribute("msglist", msglist);
		model.addAttribute("read_flag", read_flag);
		return "forward:noticemsg.jsp";
	}
	@RequestMapping("updateRead")
	public String updateRead(int message_id,int read_flag){
		noticeMsgService.updateRead(message_id);
		return "redirect:selectByTypeFlag.action?read_flag="+read_flag;
	}
	@RequestMapping("deleteMsg")
	public String deleteMsg(int message_id,int read_flag){
		noticeMsgService.deleteMsg(message_id);
		return "redirect:selectByTypeFlag.action?read_flag="+read_flag;
	}
	
}
