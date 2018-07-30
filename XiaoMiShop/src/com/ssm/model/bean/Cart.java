package com.ssm.model.bean;

public class Cart {
	private int cart_id;
	private String user_email;
	private GoodsDetail goods_detail;
	private int goods_num;
	public int getCart_id() {
		return cart_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public GoodsDetail getGoods_detail() {
		return goods_detail;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setGoods_detail(GoodsDetail goods_detail) {
		this.goods_detail = goods_detail;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
}
