package com.ssm.model.bean;

public class GoodsPreviewPicture {
	private int previewPictureId;
	private int goodsId;
	private String url;
	public int getPreviewPictureId() {
		return previewPictureId;
	}
	public void setPreviewPictureId(int previewPictureId) {
		this.previewPictureId = previewPictureId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
