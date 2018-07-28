package com.ssm.model.bean;

import java.util.List;

public class GoodsDetail {
	private int goods_detail_id;
	private int goods_id;
	private String kind;
	private String color;
<<<<<<< HEAD
	private double prime_price;
	private double discount_price;
	private int stock;
	private int goods_detail_status;
	private List<GoodsPicture> goodsPictureList;
	
=======
	private float prime_price;
	private float discount_price;
	private int stock;
	private int goods_detail_status;
	private Goods goods;
	private List<GoodsPicture> goodsPictureList;
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
>>>>>>> master
	public int getGoods_detail_id() {
		return goods_detail_id;
	}
	public void setGoods_detail_id(int goods_detail_id) {
		this.goods_detail_id = goods_detail_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
<<<<<<< HEAD
	public double getPrime_price() {
		return prime_price;
	}
	public void setPrime_price(double prime_price) {
		this.prime_price = prime_price;
	}
	public double getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(double discount_price) {
=======
	public float getPrime_price() {
		return prime_price;
	}
	public void setPrime_price(float prime_price) {
		this.prime_price = prime_price;
	}
	public float getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(float discount_price) {
>>>>>>> master
		this.discount_price = discount_price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getGoods_detail_status() {
		return goods_detail_status;
	}
	public void setGoods_detail_status(int goods_detail_status) {
		this.goods_detail_status = goods_detail_status;
	}
	public List<GoodsPicture> getGoodsPictureList() {
		return goodsPictureList;
	}
	public void setGoodsPictureList(List<GoodsPicture> goodsPictureList) {
		this.goodsPictureList = goodsPictureList;
	}
	
	
}
