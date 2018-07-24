package com.ssm.model.bean;

import java.util.List;

public class Goods {
	private int goods_id;
	private int goods_category_id;
	private int goods_code;
	private String goods_name;
	private String video_set_url;
	private List<GoodsAttribute> goodsAttributeList;
	private List<GoodsDetail> goodsDetailList;
	private List<GoodsPreviewPicture> goodsPreviewPictureList;
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getGoods_category_id() {
		return goods_category_id;
	}
	public void setGoods_category_id(int goods_category_id) {
		this.goods_category_id = goods_category_id;
	}
	public int getGoods_code() {
		return goods_code;
	}
	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getVideo_set_url() {
		return video_set_url;
	}
	public void setVideo_set_url(String video_set_url) {
		this.video_set_url = video_set_url;
	}
	public List<GoodsAttribute> getGoodsAttributeList() {
		return goodsAttributeList;
	}
	public void setGoodsAttributeList(List<GoodsAttribute> goodsAttributeList) {
		this.goodsAttributeList = goodsAttributeList;
	}
	public List<GoodsDetail> getGoodsDetailList() {
		return goodsDetailList;
	}
	public void setGoodsDetailList(List<GoodsDetail> goodsDetailList) {
		this.goodsDetailList = goodsDetailList;
	}
	public List<GoodsPreviewPicture> getGoodsPreviewPictureList() {
		return goodsPreviewPictureList;
	}
	public void setGoodsPreviewPictureList(List<GoodsPreviewPicture> goodsPreviewPictureList) {
		this.goodsPreviewPictureList = goodsPreviewPictureList;
	}
	
}
