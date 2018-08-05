package com.ssm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Cart;
import com.ssm.model.dao.CartDAO;

@Service
public class CartService {
	 @Autowired
	 private CartDAO cartDAO;
	 
	 public List<Cart> searchCart(String user_email){
		 return cartDAO.searchCart(user_email);
	 }
	 
	 public void deleteItem(int[] items){
		 cartDAO.deleteItem(items);
	 }
	 
	 public String updateAddNum(int cartid,int goods_detail_id,int num){
		 if(cartDAO.findInStock(goods_detail_id)>num){
			 cartDAO.updateAddNum(cartid);
			 System.out.println("增加成功");
			 return "增加成功";
		 }else{
			 return "库存不够";
		 }
	 }
	 public String updateSubNum(int cartid,int goods_detail_id,int num){
		 if(num>1){
			 cartDAO.updateSubNum(cartid);
			 System.out.println("减少成功");
			 if(cartDAO.findInStock(goods_detail_id)<num-1){
				 return "减少成功,但大于库存";
			 }else{
				 return "减少成功";
			 }
			 
		 }else{
			 return "不允许减少";
		 }
	 }
	 
	 public void deleteAll(String email){
		 cartDAO.deleteAll(email);
	 }
	 
}
