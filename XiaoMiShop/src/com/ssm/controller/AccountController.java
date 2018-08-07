package com.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.model.bean.User;
import com.ssm.model.service.AccountService;
import com.ssm.utils.*;
@Controller
public class AccountController {
	@Autowired
    private AccountService accountService;
	
	@RequestMapping("insertAccount")
	public String insertAccount(User user,HttpSession session,Model model){
		String result=accountService.insertAccount(user);
		session.setAttribute("status", result);
		return "redirect:register.jsp";
	}
	@RequestMapping("findUser")
	public String findUser(User user,HttpSession session,HttpServletRequest request){
		System.out.println("hah");
		String redirectURL = request.getParameter("redirectURL");
		if(accountService.findUser(user)==null){
			
			session.setAttribute("status", "用户不存在");
			if(redirectURL==null || "".equals(redirectURL)){
				return "redirect:login.jsp";
			}else{
				return "redirect:login.jsp?redirectURL="+redirectURL;
			}
						
		}else{
			user=accountService.findUser(user);
			session.setAttribute("user_email", user.getUser_email());
			session.setAttribute("nickname", user.getNickname());
			session.setAttribute("user_imgurl", user.getImgurl());
			session.setAttribute("realname", user.getRealname());
			session.setAttribute("telephone", user.getTelephone());
			System.out.println("jin");
			if(redirectURL==null || "".equals(redirectURL)){
				return "redirect:index.jsp";
			}else{
				System.out.println("hah"+redirectURL);
				
				return "redirect:"+redirectURL;
			}
		}
	}
	
	@RequestMapping("updateUser")
	   public String updateUser(User user,HttpSession session){
		   user.setUser_email((String)session.getAttribute("user_email"));
		   accountService.updateUser(user);
		   session.setAttribute("nickname", user.getNickname());
		   session.setAttribute("realname", user.getRealname());
		   session.setAttribute("telephone", user.getTelephone());
		   return "redirect:modifyuser.jsp";
	   }
	@RequestMapping("editUserPic")
	public String editUserPic(MultipartFile user_pic,HttpSession session,HttpServletRequest request){
		System.out.println(user_pic);
		System.out.println(request.getSession().
                getServletContext().getRealPath("/"));
		String path=request.getSession().
                getServletContext().getRealPath("/")+"headpic/";
		String newname=FileUtil.updateFile(user_pic, path);
		String addr="headpic/"+newname;
		Map<String,Object> picmap=new HashMap<String,Object>();
		picmap.put("user_email", session.getAttribute("user_email"));
		picmap.put("imgurl", addr);
		accountService.editUserPic(picmap);
		session.setAttribute("user_imgurl", addr);
		return "redirect:modifyuser.jsp";
		
	}
	
	@RequestMapping("editPsw")
	public String editPsw(HttpSession session,String oldpassword,String newpassword){
		String user_email=(String) session.getAttribute("user_email");
		System.out.println("旧密码"+oldpassword);
		Map<String,Object> psdmap=new HashMap<String,Object>();
		psdmap.put("user_email", user_email);
		psdmap.put("oldpassword", oldpassword);
		psdmap.put("newpassword", newpassword);
		User user=new User();
		user.setUser_email(user_email);
		user.setPassword(oldpassword);
		if(accountService.findUser(user)==null){
			session.setAttribute("status", "原密码错误");
			return "redirect:editpsw.jsp";
		}else{
			accountService.editPsw(psdmap);
			session.removeAttribute("user_email");
			session.removeAttribute("nickname");
			session.removeAttribute("user_imgurl");
			session.removeAttribute("realname");
			session.removeAttribute("telephone");
			session.removeAttribute("status");
			session.setAttribute("status", "修改成功,请重新登录");
			return "redirect:login.jsp";
		}
		
	}
	
	
	
}
