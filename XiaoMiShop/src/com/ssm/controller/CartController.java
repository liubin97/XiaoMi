package com.ssm.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.model.bean.Cart;
import com.ssm.model.service.CartService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class CartController {

	@Autowired
    private CartService cartService;
	
	@RequestMapping("searchCart")
	public String searchCart(HttpSession session,Model model,HttpServletRequest request) throws UnsupportedEncodingException{
		String user_email=(String) session.getAttribute("user_email");
		if(user_email==null||"".equals(user_email)){
				List<Cart> cartlist=new ArrayList<Cart>();
			  Cookie[] cookies = request.getCookies();
		        String jsonStr = null;
		        if (cookies != null) {
		            for (Cookie c : cookies) {
		                if (c.getName().equals("cartlist")) {
		                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
		                }
		            }
		        }
		        
		        if (jsonStr == null) {
		     
		        } else {
		            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
		            //json字符串为 jsonStr
		            JSONObject jb = JSONObject.fromObject(jsonStr);
		            JSONArray ja = jb.getJSONArray("cartlist");
		            for (int i = 0; i < ja.size(); i++) {
		                Cart b = new Cart();
		                int goods_detail_id = ja.getJSONObject(i).getInt("goods_detail_id");
		                int goods_num = ja.getJSONObject(i).getInt("goods_num");
		                
		                b.setGoods_detail_id(goods_detail_id);
		                b.setGoods_num(goods_num);
		                b.setGoodsDetail(cartService.searchCartCookie(goods_detail_id));
	
		                cartlist.add(b);
		            }
		           
		        }
		        
			model.addAttribute("cartlist", cartlist);
		}else{
			List<Cart> cartlist=cartService.searchCart(user_email);
			model.addAttribute("cartlist", cartlist);
		}
		return "forward:cart.jsp";
	}
	
	@RequestMapping("insertCart")
	public String insertCart(int goods_detail_id,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		String user_email=(String) session.getAttribute("user_email");
		List<Cart> cartlist=new ArrayList<Cart>();
		
		if(user_email==null||"".equals(user_email)){
			 Cookie[] cookies = request.getCookies();
		        String jsonStr = null;
		        if (cookies != null) {
		            for (Cookie c : cookies) {
		                if (c.getName().equals("cartlist")) {
		                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
		                }
		            }
		        }
		        
		        if (jsonStr == null) {
		        	Cart c=new Cart();
		        	c.setGoods_detail_id(goods_detail_id);
		        	c.setGoods_num(1);
		        	cartlist.add(c);
		        } else {
		            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
		            //json字符串为 jsonStr
		        	boolean isExist = false;
		            JSONObject jb = JSONObject.fromObject(jsonStr);
		            JSONArray ja = jb.getJSONArray("cartlist");
		            for (int i = 0; i < ja.size(); i++) {
		                Cart b = new Cart();
		                int goods_detail_id1 = ja.getJSONObject(i).getInt("goods_detail_id");
		                int goods_num = ja.getJSONObject(i).getInt("goods_num");
		                
		                b.setGoods_detail_id(goods_detail_id1);
		                b.setGoodsDetail(cartService.searchCartCookie(goods_detail_id));
		                
		                if(goods_detail_id1==goods_detail_id){
		                	 isExist = true;
		                	 goods_num++;
		                }
		                b.setGoods_num(goods_num);
		                

		                cartlist.add(b);
		            }
		            
		            if (!isExist) {
		            	Cart b = new Cart();
		            	b.setGoods_detail_id(goods_detail_id);
		            	b.setGoods_num(1);
		            	b.setGoodsDetail(cartService.searchCartCookie(goods_detail_id));
		            	cartlist.add(b);
		            }
		           
		        }
		        
		        
		        
		        JSONObject jsonObj = new JSONObject();
		        JSONArray jsonArray = JSONArray.fromObject(cartlist);
		        jsonObj.put("cartlist", jsonArray);
		        String jsonDataStr = jsonObj.toString();
		        
		        Cookie cart = new Cookie("cartlist", URLEncoder.encode(jsonDataStr, "utf-8"));
		        cart.setMaxAge(60 * 60 * 24 * 7);
		        cart.setPath("/");
		        response.addCookie(cart);
		        
		}else{
			Cart cart=cartService.searchHave(goods_detail_id);
			if(cart==null){
				Cart c=new Cart();
				c.setGoods_detail_id(goods_detail_id);
				c.setGoods_num(1);
				c.setUser_email(user_email);
				cartService.insertCart(c);
			}else{
				cartService.updateAddNum1(cart.getCart_id());
			}
		}
		int return_goods_id=cartService.searchCartCookie(goods_detail_id).getGoods_id();
		return "redirect:displayGoodsPurchaseInfo.action?goods_id="+return_goods_id;    /*  地址需要改进  */
	}
	
	@RequestMapping("updateAddNum")
	public String updateAddNum(HttpSession session,int cart_id,int goods_detail_id,int num){
		String msg=cartService.updateAddNum(cart_id, goods_detail_id, num);
		session.setAttribute("cartmsg", msg);
		return "redirect:searchCart.action";
	}
	@RequestMapping("updateSubNum")
	public String updateSubNum(HttpSession session,int cart_id,int goods_detail_id,int num){
		String msg=cartService.updateSubNum(cart_id, goods_detail_id, num);
		session.setAttribute("cartmsg", msg);
		return "redirect:searchCart.action";
	}
	@RequestMapping("updateAddNumCookie")
	public String updateAddNumCookie(HttpSession session,Model model,int goods_detail_id,int num,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		 
		String msg=null;
		List<Cart> cartlist=new ArrayList<Cart>();
		if(cartService.findInStock(goods_detail_id)>num){
			 
			 Cookie[] cookies = request.getCookies();
		        String jsonStr = null;
		        if (cookies != null) {
		            for (Cookie c : cookies) {
		                if (c.getName().equals("cartlist")) {
		                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
		                }
		            }
		        }
		        
		        if (jsonStr == null) {
		       
		        } else {
		            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
		            //json字符串为 jsonStr
		        	boolean isExist = false;
		            JSONObject jb = JSONObject.fromObject(jsonStr);
		            JSONArray ja = jb.getJSONArray("cartlist");
		            for (int i = 0; i < ja.size(); i++) {
		                Cart b = new Cart();
		                int goods_detail_id1 = ja.getJSONObject(i).getInt("goods_detail_id");
		                int goods_num = ja.getJSONObject(i).getInt("goods_num");
		                
		                b.setGoods_detail_id(goods_detail_id1);
		                b.setGoodsDetail(cartService.searchCartCookie(goods_detail_id1));
		                
		                if(goods_detail_id1==goods_detail_id){
		                	 isExist = true;
		                	 goods_num++;
		                }
		                b.setGoods_num(goods_num);
		                

		                cartlist.add(b);
		            }
		            

		           
		        }
		        
		        
		        
		        JSONObject jsonObj = new JSONObject();
		        JSONArray jsonArray = JSONArray.fromObject(cartlist);
		        jsonObj.put("cartlist", jsonArray);
		        String jsonDataStr = jsonObj.toString();
		        
		        Cookie cart = new Cookie("cartlist", URLEncoder.encode(jsonDataStr, "utf-8"));
		        cart.setMaxAge(60 * 60 * 24 * 7);
		        cart.setPath("/");
		        response.addCookie(cart);
			
			
			
			
			 System.out.println("增加成功");
			 msg="增加成功";
		 }else{
			 msg="库存不够";
		 }
		session.setAttribute("cartmsg", msg);
		return "redirect:searchCart.action";
	}
	@RequestMapping("updateSubNumCookie")
	public String updateSubNumCookie(HttpSession session,Model model,int goods_detail_id,int num,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		
		String msg=null;
		List<Cart> cartlist=new ArrayList<Cart>();
		if(num>1){
			 
			
			 Cookie[] cookies = request.getCookies();
		        String jsonStr = null;
		        if (cookies != null) {
		            for (Cookie c : cookies) {
		                if (c.getName().equals("cartlist")) {
		                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
		                }
		            }
		        }
		        
		        if (jsonStr == null) {
		        
		        } else {
		            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
		            //json字符串为 jsonStr
		        	boolean isExist = false;
		            JSONObject jb = JSONObject.fromObject(jsonStr);
		            JSONArray ja = jb.getJSONArray("cartlist");
		            for (int i = 0; i < ja.size(); i++) {
		                Cart b = new Cart();
		                int goods_detail_id1 = ja.getJSONObject(i).getInt("goods_detail_id");
		                int goods_num = ja.getJSONObject(i).getInt("goods_num");
		                
		                b.setGoods_detail_id(goods_detail_id1);
		                b.setGoodsDetail(cartService.searchCartCookie(goods_detail_id1));
		                
		                if(goods_detail_id1==goods_detail_id){
		                	 isExist = true;
		                	 goods_num--;
		                }
		                b.setGoods_num(goods_num);
		                

		                cartlist.add(b);
		            }
		            

		           
		        }
		        
		        
		        
		        JSONObject jsonObj = new JSONObject();
		        JSONArray jsonArray = JSONArray.fromObject(cartlist);
		        jsonObj.put("cartlist", jsonArray);
		        String jsonDataStr = jsonObj.toString();
		        
		        Cookie cart = new Cookie("cartlist", URLEncoder.encode(jsonDataStr, "utf-8"));
		        cart.setMaxAge(60 * 60 * 24 * 7);
		        cart.setPath("/");
		        response.addCookie(cart);
			 
			 
			 System.out.println("减少成功");
			 if(cartService.findInStock(goods_detail_id)<num-1){
				 msg="减少成功,但大于库存";
			 }else{
				msg="减少成功";
			 }
			 
		 }else{
			 msg="不允许减少";
		 }
		session.setAttribute("cartmsg", msg);
		return "redirect:searchCart.action";
	}

	
	
	
	
	@RequestMapping("mergeCart")
	public String mergeCart(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		String user_email=(String) request.getSession().getAttribute("user_email");
    	List<Cart> cartlist=new ArrayList<Cart>();
    	 Cookie[] cookies = request.getCookies();
	        String jsonStr = null;
	        if (cookies != null) {
	            for (Cookie c : cookies) {
	                if (c.getName().equals("cartlist")) {
	                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
	                }
	            }
	        }
	        
	        if (jsonStr == null) {
	        	
	        } else {
	            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
	            //json字符串为 jsonStr
	        	boolean isExist = false;
	            JSONObject jb = JSONObject.fromObject(jsonStr);
	            JSONArray ja = jb.getJSONArray("cartlist");
	            for (int i = 0; i < ja.size(); i++) {
	                Cart b = new Cart();
	                int goods_detail_id1 = ja.getJSONObject(i).getInt("goods_detail_id");
	                int goods_num = ja.getJSONObject(i).getInt("goods_num");
	                
	                b.setGoods_detail_id(goods_detail_id1);
	                
	                b.setGoods_num(goods_num);
	                b.setUser_email(user_email);
	          
	                	if(cartService.searchHave(goods_detail_id1)==null){
	                		cartService.insertCart(b);
	                	}else{
	                		
	                	}
	                
	                
	            }

	           
	        }
	        
	        
	        
	        JSONObject jsonObj = new JSONObject();
	        JSONArray jsonArray = JSONArray.fromObject(cartlist);
	        jsonObj.put("cartlist", jsonArray);
	        String jsonDataStr = jsonObj.toString();
	        
	        Cookie cart = new Cookie("cartlist", URLEncoder.encode(jsonDataStr, "utf-8"));
	        cart.setMaxAge(0);
	        cart.setPath("/");
	        response.addCookie(cart);
	        return "redirect:searchCart.action";
	        
	}
	@RequestMapping("getCartNum")
	public @ResponseBody int getCartNum(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		String user_email=(String) session.getAttribute("user_email");
		if(user_email==null||"".equals(user_email)){
			
			List<Cart> cartlist=new ArrayList<Cart>();
			  Cookie[] cookies = request.getCookies();
		        String jsonStr = null;
		        if (cookies != null) {
		            for (Cookie c : cookies) {
		                if (c.getName().equals("cartlist")) {
		                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
		                }
		            }
		        }
		        
		        if (jsonStr == null) {
		        	return 0;
		        } else {
		            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
		            //json字符串为 jsonStr
		            JSONObject jb = JSONObject.fromObject(jsonStr);
		            JSONArray ja = jb.getJSONArray("cartlist");
		            return ja.size();
		           
		        }
		        
			
			
			
		}else{
			return cartService.getCartNum(user_email);
		}
		
	}
	@RequestMapping("deleteItem")
	public String deleteItem(int cart_id,HttpSession session){
		cartService.deleteItem(cart_id);
		session.setAttribute("cartmsg", "删除成功");
		return "redirect:searchCart.action";
	}
	@RequestMapping("deleteCart")
	public String deleteCart(int goods_detail_id,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		String user_email=(String) session.getAttribute("user_email");
		List<Cart> cartlist=new ArrayList<Cart>();
		if(user_email==null||"".equals(user_email)){
			
			 Cookie[] cookies = request.getCookies();
		        String jsonStr = null;
		        if (cookies != null) {
		            for (Cookie c : cookies) {
		                if (c.getName().equals("cartlist")) {
		                    jsonStr = URLDecoder.decode(c.getValue(),"utf-8");
		                }
		            }
		        }
		        
		        if (jsonStr == null) {
		        
		        } else {
		            //2.2不为空，表示有数据，解析出来后再判断将某一个book对象的num加1
		            //json字符串为 jsonStr
		        	boolean isExist = false;
		            JSONObject jb = JSONObject.fromObject(jsonStr);
		            JSONArray ja = jb.getJSONArray("cartlist");
		            for (int i = 0; i < ja.size(); i++) {
		                Cart b = new Cart();
		                int goods_detail_id1 = ja.getJSONObject(i).getInt("goods_detail_id");
		                int goods_num = ja.getJSONObject(i).getInt("goods_num");
		                
		                b.setGoods_detail_id(goods_detail_id);
		                b.setGoodsDetail(cartService.searchCartCookie(goods_detail_id));
		                b.setGoods_num(goods_num);
		                if(goods_detail_id1==goods_detail_id){
		                	
		                }else{
		                	cartlist.add(b);
		                }
		                
		            }
		            
		       
		           
		        }
		        
		        
		        
		        JSONObject jsonObj = new JSONObject();
		        JSONArray jsonArray = JSONArray.fromObject(cartlist);
		        jsonObj.put("cartlist", jsonArray);
		        String jsonDataStr = jsonObj.toString();
		        
		        Cookie cart = new Cookie("cartlist", URLEncoder.encode(jsonDataStr, "utf-8"));
		        cart.setMaxAge(60 * 60 * 24 * 7);
		        cart.setPath("/");
		        response.addCookie(cart);

		}else{
			
		}
		
		session.setAttribute("cartmsg", "删除成功");
		return "redirect:searchCart.action";
		
	}
	

	
}
