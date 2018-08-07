package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.*;

public interface FavoritesDAO {
	
	public void deleteFavorite(int favorites_id);
	public List<Favorites> searchFavorite(Map<String, Object> keyemail);
	public float getLowestPrice(int goods_id);
}
