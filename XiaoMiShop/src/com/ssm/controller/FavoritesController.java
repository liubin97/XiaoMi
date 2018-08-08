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

import com.ssm.model.bean.Favorites;
import com.ssm.model.dao.FavoritesDAO;
import com.ssm.model.service.AccountService;

@Controller
public class FavoritesController {
	@Autowired
    private FavoritesDAO favoritesService;
	
	@RequestMapping("searchFavorite")
	 public String searchFavorite(String searchkey,HttpSession session,Model model){
		
		if(searchkey==null || "".equals(searchkey)){
			searchkey="";
		}
		String user_email=(String) session.getAttribute("user_email");
		Map<String, Object> keyemail=new HashMap<String, Object>();
		keyemail.put("searchkey", searchkey);
		keyemail.put("user_email", user_email);
		
		List<Favorites> fl=favoritesService.searchFavorite(keyemail);
		for(Favorites f:fl){
			f.getGoods().setLowestprice(favoritesService.getLowestPrice(f.getGoods_id()));
		}
		
		
		model.addAttribute("favoriteslist", fl);
		return "forward:favorites.jsp";
		
	 }
	
	
	@RequestMapping("deleteFavorite")
	public String deleteFavorite(int favorites_id){
		favoritesService.deleteFavorite(favorites_id);
		return "redirect:searchFavorite.action";
	}
	
	
}
