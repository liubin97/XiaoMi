package com.ssm.model.bean;

public class Cart {
	private int cart_id;
	private String user_email;
	private GoodsDetail goodsDetail;
	private int goods_detail_id;
	private int goods_num;
	public int getCart_id() {
		return cart_id;
	}
	public String getUser_email() {
		return user_email;
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

	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}

	public int getGoods_detail_id() {
		return goods_detail_id;
	}
	public void setGoods_detail_id(int goods_detail_id) {
		this.goods_detail_id = goods_detail_id;
	}
	public GoodsDetail getGoodsDetail() {
		return goodsDetail;
	}
	public void setGoodsDetail(GoodsDetail goodsDetail) {
		this.goodsDetail = goodsDetail;
	}
}
