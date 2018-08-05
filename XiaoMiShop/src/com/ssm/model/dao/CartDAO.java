package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.*;

public interface CartDAO {
	public List<Cart> searchCart(String user_email);
	public void deleteItem(int[] items);
	public void updateAddNum(int cartid);
	public void updateSubNum(int cartid);
	public void deleteAll(String email);
	public int findInStock(int goods_detail_id);
		
}
