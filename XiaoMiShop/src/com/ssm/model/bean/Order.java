package com.ssm.model.bean;

import java.sql.Date;
import java.util.List;

public class Order {
	private int order_id;
	private String user_email;
	private float sum_money;
	private int address_id;
	private Date order_date;
	private int order_type;
	private int goods_num;
	private int group_id;
	private int order_status;
	private List<OrderItem> order_items;
	
	public List<OrderItem> getOrder_items() {
		return order_items;
	}
	public void setOrder_items(List<OrderItem> order_items) {
		this.order_items = order_items;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public float getSum_money() {
		return sum_money;
	}
	public void setSum_money(float sum_money) {
		this.sum_money = sum_money;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_type() {
		return order_type;
	}
	public void setOrder_type(int order_type) {
		this.order_type = order_type;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
}
