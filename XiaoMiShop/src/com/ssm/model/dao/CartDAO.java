package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.*;

public interface CartDAO {
	public List<Cart> searchCart(String user_email);
	public void deleteItem(int cartid);
	public void updateAddNum(int cartid);
	public void updateSubNum(int cartid);
	public void deleteAll(String email);
	public int findInStock(int goods_detail_id);
	public GoodsDetail searchCartCookie(int goods_detail_id);
	public void insertCart(Cart cart);
	public Cart searchHave(int goods_detail_id);
	public int getCartNum(String user_email);
}
