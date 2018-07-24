package com.ssm.model.bean;

import java.util.List;

public class GoodsDetail {
	private int detailId;
	private int goodsId;
	private String kind;
	private String colour;
	private double primePrice;
	private double discountPrice;
	private int number;
	private List<GoodsPicture> pictureList;
	public int getDetailId() {
		return detailId;
	}
	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public double getPrimePrice() {
		return primePrice;
	}
	public void setPrimePrice(double primePrice) {
		this.primePrice = primePrice;
	}
	public double getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(double discountPrice) {
		this.discountPrice = discountPrice;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public List<GoodsPicture> getPictureList() {
		return pictureList;
	}
	public void setPictureList(List<GoodsPicture> pictureList) {
		this.pictureList = pictureList;
	}
	
}
