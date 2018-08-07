package com.ssm.model.bean;

public class GoodsPicture {
	private int picture_set_id;
	private int goods_detail_id;
	private String picture_set_url;
	private int picture_set_status;
	
	public int getPicture_set_id() {
		return picture_set_id;
	}
	public void setPicture_set_id(int picture_set_id) {
		this.picture_set_id = picture_set_id;
	}
	public int getGoods_detail_id() {
		return goods_detail_id;
	}
	public void setGoods_detail_id(int goods_detail_id) {
		this.goods_detail_id = goods_detail_id;
	}
	public String getPicture_set_url() {
		return picture_set_url;
	}
	public void setPicture_set_url(String picture_set_url) {
		this.picture_set_url = picture_set_url;
	}
	public int getPicture_set_status() {
		return picture_set_status;
	}
	public void setPicture_set_status(int picture_set_status) {
		this.picture_set_status = picture_set_status;
	}

	@Override
	public String toString() {
		return "GoodsPicture{" +
				"picture_set_id=" + picture_set_id +
				", goods_detail_id=" + goods_detail_id +
				", picture_set_url='" + picture_set_url + '\'' +
				", picture_set_status=" + picture_set_status +
				'}';
	}
}
