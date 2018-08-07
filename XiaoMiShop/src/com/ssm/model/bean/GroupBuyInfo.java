package com.ssm.model.bean;

import java.util.Date;
import java.util.List;

public class GroupBuyInfo {
	private int group_buy_info_id;
	private int goods_detail_id;
	private int group_num;
	private float group_buy_price;
	private Date group_starttime;
	private Date group_endtime;
	private int group_buy_info_status;
	
	private GoodsDetail goodsdetail;
	private List<GroupBuyList> groupList;
	
	public GoodsDetail getGoodsdetail() {
		return goodsdetail;
	}
	public void setGoodsdetail(GoodsDetail goodsdetail) {
		this.goodsdetail = goodsdetail;
	}
	public List<GroupBuyList> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<GroupBuyList> groupList) {
		this.groupList = groupList;
	}
	public int getGroup_buy_info_id() {
		return group_buy_info_id;
	}
	public void setGroup_buy_info_id(int group_buy_info_id) {
		this.group_buy_info_id = group_buy_info_id;
	}
	public int getGoods_detail_id() {
		return goods_detail_id;
	}
	public void setGoods_detail_id(int goods_detail_id) {
		this.goods_detail_id = goods_detail_id;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public float getGroup_buy_price() {
		return group_buy_price;
	}
	public void setGroup_buy_price(float group_buy_price) {
		this.group_buy_price = group_buy_price;
	}
	public Date getGroup_starttime() {
		return group_starttime;
	}
	public void setGroup_starttime(Date group_starttime) {
		this.group_starttime = group_starttime;
	}
	public Date getGroup_endtime() {
		return group_endtime;
	}
	public void setGroup_endtime(Date group_endtime) {
		this.group_endtime = group_endtime;
	}
	public int getGroup_buy_info_status() {
		return group_buy_info_status;
	}
	public void setGroup_buy_info_status(int group_buy_info_status) {
		this.group_buy_info_status = group_buy_info_status;
	}
	
}
