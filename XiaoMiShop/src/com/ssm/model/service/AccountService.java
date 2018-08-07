package com.ssm.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.User;
import com.ssm.model.dao.*;

@Service
public class AccountService {
	   @Autowired
	   private AccountDAO accountDAO;
	   
	   public String insertAccount(User user){
		   
		   
		   if(accountDAO.findEmail(user.getUser_email())==null || "".equals(accountDAO.findEmail(user.getUser_email()))){
			   System.out.println("插入账户");
			   accountDAO.insertAccount(user);
			   return "注册成功";
		   }else{
			   System.out.println("账户已被注册");
			   return "账户已被注册";
		   }
	   }
	   
	   public User findUser(User user){
		   return accountDAO.findUser(user);
	   }
	   
	   public void editUserPic(Map<String, Object> picmap){
		   accountDAO.editUserPic(picmap);
	   }
	   
	   public void updateUser(User user){
		   accountDAO.updateUser(user);
	   }
	   public String editPsw(Map<String, Object> psdmap){
		   User user=new User();	
		   user.setUser_email((String) psdmap.get("user_email"));
		   user.setPassword((String) psdmap.get("oldpassword"));
		   if(accountDAO.findUser(user)==null){
			   return "原密码输入错误";
		   }else{
			   accountDAO.editPsw(psdmap);
			   return "密码修改成功";
		   }
	   }
}
