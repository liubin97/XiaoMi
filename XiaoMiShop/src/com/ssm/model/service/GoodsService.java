package com.ssm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsAttribute;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GoodsPicture;
import com.ssm.model.bean.GoodsPreviewPicture;
import com.ssm.model.dao.GoodsDAO;

@Service
public class GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public void insertGoods(Goods goods){
		//插入Goods表
		goodsDAO.insertGoods(goods);
		//获取商品id
		int goodsId = goods.getGoods_id();
		//int goodsId = goodsDAO.getGoodIdByCode(goods.getGoods_code());
		//插入概述图片表
		for(GoodsPreviewPicture gpp : goods.getPreviewPictureList()){
			gpp.setGoods_id(goodsId);
			goodsDAO.insertGoodsPicture(gpp);
		}
		
		//插入商品属性表
		for(GoodsAttribute goodsAttribute : goods.getAttributeList()){
			goodsAttribute.setGoods_id(goodsId);
			goodsDAO.insertAttribute(goodsAttribute);
		}
		
	}

	public void insertDetail(GoodsDetail goodsDetail) {
		//插入商品版本细节表
		goodsDAO.insertDetail(goodsDetail);
		//获取商品版本id
		int detailId = goodsDAO.getDetailIdByInfo(goodsDetail);
		//插入商品图片集图片
		for(GoodsPicture gpic : goodsDetail.getGoodsPictureList()){
			gpic.setGoods_detail_id(detailId);
			goodsDAO.insertPicture(gpic);
		}
	}
	public void updateStockAdd(GoodsDetail goodsDetail) {
		goodsDAO.updateStockAdd(goodsDetail);
	}
	
	public String[] getAllKindByGoodsId(Integer goodsId) {
		String[] kindList = goodsDAO.getAllKindByGoodsId(goodsId);
		return kindList;
	}

	public List<GoodsDetail> getAllColorBygoodsIdAndcolor(GoodsDetail goodsDetail) {
		List<GoodsDetail> detailList = goodsDAO.getAllColorBygoodsIdAndcolor(goodsDetail);
		return detailList;
	}

	public List<GoodsDetail> getAllStockByGoodsId(Integer goodsId) {
		List<GoodsDetail> detailList = goodsDAO.getAllDetailByGoodsId(goodsId);
		return detailList;
	}
	public List<GoodsDetail> getAllDetailByGoodsId(Integer goodsId) {
		List<GoodsDetail> detailList = goodsDAO.getAllDetailByGoodsId(goodsId);
		return detailList;
	}
	public Goods getGoodsByGoodsId(Integer goodsId) {
		Goods goods = goodsDAO.getGoodsByGoodsId(goodsId);
		return goods;
	}
	public void updateStockChange(GoodsDetail goodsDetail) {
		goodsDAO.updateStockChange(goodsDetail);
		
	}

	

	


}
