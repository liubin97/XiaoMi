package com.ssm.model.bean;

public class GoodsAttribute {
	private int goods_attribute_id;
	private int goods_id;
	private String attribute_name;
	private String attribute_value;
	private String attribute_status;
	
	public int getGoods_attribute_id() {
		return goods_attribute_id;
	}
	public void setGoods_attribute_id(int goods_attribute_id) {
		this.goods_attribute_id = goods_attribute_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getAttribute_name() {
		return attribute_name;
	}
	public void setAttribute_name(String attribute_name) {
		this.attribute_name = attribute_name;
	}
	public String getAttribute_value() {
		return attribute_value;
	}
	public void setAttribute_value(String attribute_value) {
		this.attribute_value = attribute_value;
	}
	public String getAttribute_status() {
		return attribute_status;
	}
	public void setAttribute_status(String attribute_status) {
		this.attribute_status = attribute_status;
	}
	
	
}
