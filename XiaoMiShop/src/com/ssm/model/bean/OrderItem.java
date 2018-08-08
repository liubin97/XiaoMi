package com.ssm.model.bean;

public class OrderItem {
	private int order_item_id;
	private int order_id;
	private int goods_detail_id;
	private float item_price;
	private int order_item_num;
	private int comment_flag;
	private GoodsDetail goodsDetail;
	
	public GoodsDetail getGoodsDetail() {
		return goodsDetail;
	}
	public void setGoodsDetail(GoodsDetail goodsDetail) {
		this.goodsDetail = goodsDetail;
	}
	public int getOrder_item_id() {
		return order_item_id;
	}
	public void setOrder_item_id(int order_item_id) {
		this.order_item_id = order_item_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getGoods_detail_id() {
		return goods_detail_id;
	}
	public void setGoods_detail_id(int goods_detail_id) {
		this.goods_detail_id = goods_detail_id;
	}
	public float getItem_price() {
		return item_price;
	}
	public void setItem_price(float item_price) {
		this.item_price = item_price;
	}
	public int getOrder_item_num() {
		return order_item_num;
	}
	public void setOrder_item_num(int order_item_num) {
		this.order_item_num = order_item_num;
	}
	public int getComment_flag() {
		return comment_flag;
	}
	public void setComment_flag(int comment_flag) {
		this.comment_flag = comment_flag;
	}
	
}
