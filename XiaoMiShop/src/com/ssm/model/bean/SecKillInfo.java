package com.ssm.model.bean;

import java.util.Date;

public class SecKillInfo {
	private int seckill_id;
	private int goods_detail_id;
	private int seckill_num;
	private Date seckill_starttime;
	private Date seckill_endtime;
	private Date create_time;
	private int seckill_status;
	private float seckill_money;
	private String seckill_name;
	public String getSeckill_name() {
		return seckill_name;
	}

	public void setSeckill_name(String seckill_name) {
		this.seckill_name = seckill_name;
	}


	public int getGoods_detail_id() {
		return goods_detail_id;
	}
	public void setGoods_detail_id(int goods_detail_id) {
		this.goods_detail_id = goods_detail_id;
	}
	public int getSeckill_num() {
		return seckill_num;
	}
	public void setSeckill_num(int seckill_num) {
		this.seckill_num = seckill_num;
	}
	public Date getSeckill_starttime() {
		return seckill_starttime;
	}
	public void setSeckill_starttime(Date seckill_starttime) {
		this.seckill_starttime = seckill_starttime;
	}
	public Date getSeckill_endtime() {
		return seckill_endtime;
	}
	public void setSeckill_endtime(Date seckill_endtime) {
		this.seckill_endtime = seckill_endtime;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public int getSeckill_status() {
		return seckill_status;
	}
	public void setSeckill_status(int seckill_status) {
		this.seckill_status = seckill_status;
	}
	public float getSeckill_money() {
		return seckill_money;
	}
	public void setSeckill_money(float seckill_money) {
		this.seckill_money = seckill_money;
	}
	
	public int getSeckill_id() {
		return seckill_id;
	}
	public void setSeckill_id(int secKill_id) {
		this.seckill_id = secKill_id;
	}
	
	
}
