package com.ssm.model.bean;

import java.util.Date;
import java.util.List;


public class GroupBuyList {
	private int group_id;
	private int group_buy_info_id;
	private int current_num;
	private Date group_begin_time;
	private int group_buy_list_status;
	private List<User> groupers;
	public int getGroup_id() {
		return group_id;
	}
	public List<User> getGroupers() {
		return groupers;
	}
	public void setGroupers(List<User> groupers) {
		this.groupers = groupers;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_buy_info_id() {
		return group_buy_info_id;
	}
	public void setGroup_buy_info_id(int group_buy_info_id) {
		this.group_buy_info_id = group_buy_info_id;
	}
	public int getCurrent_num() {
		return current_num;
	}
	public void setCurrent_num(int current_num) {
		this.current_num = current_num;
	}
	public Date getGroup_begin_time() {
		return group_begin_time;
	}
	public void setGroup_begin_time(Date group_begin_time) {
		this.group_begin_time = group_begin_time;
	}
	public int getGroup_buy_list_status() {
		return group_buy_list_status;
	}
	public void setGroup_buy_list_status(int group_buy_list_status) {
		this.group_buy_list_status = group_buy_list_status;
	}
	
}
