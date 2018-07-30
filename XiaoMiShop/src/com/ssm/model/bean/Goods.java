package com.ssm.model.bean;

import java.util.List;

public class Goods {
	private int goods_id;
	private int goods_category_id;
	private int goods_code;
	private String goods_name;
	private String goods_pic_url;
	private String goods_desc_pic_url;
	private String video_set_url;
<<<<<<< HEAD
	private List<GoodsAttribute> attributeList;
	private List<GoodsDetail> detailList;
	private List<GoodsPreviewPicture> previewPictureList;
=======
	private List<GoodsAttribute> goodsAttributeList;
	private List<GoodsDetail> goodsDetailList;
	private List<GoodsPreviewPicture> goodsPreviewPictureList;

>>>>>>> master
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
<<<<<<< HEAD
	public String getGoods_pic_url() {
		return goods_pic_url;
	}
	public void setGoods_pic_url(String goods_pic_url) {
		this.goods_pic_url = goods_pic_url;
	}
=======

>>>>>>> master
	public String getVideo_set_url() {
		return video_set_url;
	}

	public void setVideo_set_url(String video_set_url) {
		this.video_set_url = video_set_url;
	}
<<<<<<< HEAD
	public List<GoodsAttribute> getAttributeList() {
		return attributeList;
	}
	public void setAttributeList(List<GoodsAttribute> attributeList) {
		this.attributeList = attributeList;
	}
	public List<GoodsDetail> getDetailList() {
		return detailList;
	}
	public void setDetailList(List<GoodsDetail> detailList) {
		this.detailList = detailList;
	}
	public List<GoodsPreviewPicture> getPreviewPictureList() {
		return previewPictureList;
	}
	public void setPreviewPictureList(List<GoodsPreviewPicture> previewPictureList) {
		this.previewPictureList = previewPictureList;
	}
=======

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

	public String getGoods_pic_url() {
		return goods_pic_url;
	}

	public void setGoods_pic_url(String goods_pic_url) {
		this.goods_pic_url = goods_pic_url;
	}

>>>>>>> master
	public String getGoods_desc_pic_url() {
		return goods_desc_pic_url;
	}
	public void setGoods_desc_pic_url(String goods_desc_pic_url) {
		this.goods_desc_pic_url = goods_desc_pic_url;
	}
	
	
	
}
