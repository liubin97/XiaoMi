package com.ssm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Favorites;
import com.ssm.model.dao.*;

@Service
public class FavoritesService {
	 @Autowired
	 private FavoritesDAO favoritesDAO;
	 
	 public void deleteFavorite(int favorites_id){
		 favoritesDAO.deleteFavorite(favorites_id);
	 }
	 public List<Favorites> searchFavorite(Map<String,Object> keyemail){
		 return favoritesDAO.searchFavorite(keyemail);
	 }
}
