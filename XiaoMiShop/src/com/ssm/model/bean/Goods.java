package com.ssm.model.bean;

import java.util.List;

public class Goods {
	private int id;
	private int categoryId;
	private int code;
	private String name;
	private String videoUrl;
	private List<GoodsAttribute> attributeList;
	private List<GoodsDetail> detailList;
	private List<GoodsPreviewPicture> previewPictureList;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
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
	
}
