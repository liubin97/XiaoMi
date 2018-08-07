package com.ssm.model.bean;

import java.util.List;

public class GoodsCategory {
	private int goods_category_id;
	private String category_name;
	private String description;
	private List<Goods> goodsList;
	public int getGoods_category_id() {
		return goods_category_id;
	}
	public void setGoods_category_id(int goods_category_id) {
		this.goods_category_id = goods_category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
}
