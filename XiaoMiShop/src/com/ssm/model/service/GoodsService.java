package com.ssm.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsAttribute;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GoodsPicture;
import com.ssm.model.bean.GoodsPreviewPicture;
import com.ssm.model.dao.GoodsDAO;

@Service
public class GoodsService {
	final int PAGESIZE = 5;
	@Autowired
	private GoodsDAO goodsDAO;
	
	public void insertGoods(Goods goods){
		//插入Goods表
		goodsDAO.insertGoods(goods);
		//获取商品id
		int goodsId = goods.getGoods_id();
		//int goodsId = goodsDAO.getGoodIdByCode(goods.getGoods_code());
		//插入概述图片表
		for(GoodsPreviewPicture gpp : goods.getGoodsPreviewPictureList()){
			gpp.setGoods_id(goodsId);
			goodsDAO.insertGoodsPicture(gpp);
		}
		
		//插入商品属性表
		if(goods.getGoodsAttributeList()!=null){
			for(GoodsAttribute goodsAttribute : goods.getGoodsAttributeList()){
				goodsAttribute.setGoods_id(goodsId);
				goodsDAO.insertAttribute(goodsAttribute);
			}
		}
		
		
	}

	public void insertDetail(GoodsDetail goodsDetail) {
		//插入商品版本细节表
		goodsDAO.insertDetail(goodsDetail);
		//获取商品版本id
		//int detailId = goodsDAO.getDetailIdByInfo(goodsDetail);
		int detailId = goodsDetail.getGoods_detail_id();
		//插入商品图片集图片
		for(GoodsPicture gpic : goodsDetail.getGoodsPictureList()){
			gpic.setGoods_detail_id(detailId);
			goodsDAO.insertDetailPicture(gpic);
		}
	}
	public void updateStockAdd(GoodsDetail goodsDetail) {
		goodsDAO.updateStockAdd(goodsDetail);
	}

	public void updateStockChange(GoodsDetail goodsDetail) {
		goodsDAO.updateStockChange(goodsDetail);
		
	}

	public void updateGoods(Goods goods) {
		goodsDAO.updateGoods(goods);
		
	}
	public void updateGoodsPic(Goods goods) {
		if(goods.getGoodsPreviewPictureList()==null){
			return;
		}
		for(GoodsPreviewPicture pic : goods.getGoodsPreviewPictureList()){
			pic.setGoods_id(goods.getGoods_id());
			if(pic.getGoods_pre_pic_status()==1){
				if(pic.getGoods_preview_pic_id()==0){
					goodsDAO.insertGoodsPicture(pic);
				}else{
					goodsDAO.updateGoodsPicture(pic);
				}				
			}
			if(pic.getGoods_pre_pic_status()==-1){
				goodsDAO.deleteGoodsPicture(pic.getGoods_preview_pic_id());
			}
		}
		
	}
	public void updateAttribute(List<GoodsAttribute> attributeList) {
		for(GoodsAttribute goodsAttribute :attributeList){
			if(goodsAttribute.getAttribute_status()==1){
				if(goodsAttribute.getGoods_attribute_id()==0){
					goodsDAO.insertAttribute(goodsAttribute);
				}else{
					goodsDAO.updateAttribute(goodsAttribute);
				}
			}
			if(goodsAttribute.getAttribute_status()==-1){
				goodsDAO.deleteAttribute(goodsAttribute.getGoods_attribute_id());
			}
		}
		
	}
	public void updateDetail(GoodsDetail goodsDetail) {
		
		goodsDAO.updateDetail(goodsDetail);
		
	}
	public void updateDetailPic(GoodsDetail goodsDetail) {
		for(GoodsPicture pic : goodsDetail.getGoodsPictureList()){
			pic.setGoods_detail_id(goodsDetail.getGoods_detail_id());
			if(pic.getPicture_set_status()==1){
				if(pic.getPicture_set_id()==0){
					goodsDAO.insertDetailPicture(pic);
				}else{
					goodsDAO.updateDetailPicture(pic);
				}				
			}
			if(pic.getPicture_set_status()==-1){
				goodsDAO.deleteDetailPicture(pic.getPicture_set_id());
			}
		}
		
	}
	
	public String[] getAllKindByGoodsId(Integer goodsId) {
		String[] kindList = goodsDAO.getAllKindByGoodsId(goodsId);
		return kindList;
	}

	public List<GoodsDetail> getAllColorBygoodsIdAndKind(GoodsDetail goodsDetail) {
		List<GoodsDetail> detailList = goodsDAO.getAllColorBygoodsIdAndKind(goodsDetail);
		return detailList;
	}

	public Map<String, Object> getAllStockByGoodsId(Integer goodsId, Integer pageNum) {
		Page<GoodsDetail> page = PageHelper.startPage(pageNum, PAGESIZE);
		goodsDAO.getAllDetailByGoodsId(goodsId);
		List<GoodsDetail> detailList = page.getResult();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("detailList", detailList);
		map.put("pageCount",page.getPages());
		return map;
	}
	public Map<String, Object> getAllDetailByGoodsId(Integer goodsId, Integer pageNum) {
		Page<GoodsDetail> page = PageHelper.startPage(pageNum, PAGESIZE);
		goodsDAO.getAllDetailByGoodsId(goodsId);
		List<GoodsDetail> detailInfo = page.getResult();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("detailInfo", detailInfo);
		map.put("pageCount",page.getPages());
		return map;
	}
	public Goods getGoodsByGoodsId(Integer goodsId) {
		Goods goods = goodsDAO.getGoodsByGoodsId(goodsId);
		return goods;
	}
	public List<GoodsPreviewPicture> getGoodsPicByGoodsId(Integer goodsId) {
		List<GoodsPreviewPicture> picList = goodsDAO.getGoodsPicByGoodsId(goodsId);
		return picList;
	}

	public List<GoodsAttribute> getAttributesByGoodsId(Integer goodsId) {
		List<GoodsAttribute> attributeList = goodsDAO.getAttributesByGoodsId(goodsId);
		return attributeList;
	}
	public GoodsDetail getDetailByDetailId(int goods_detail_id) {
		GoodsDetail goodsDetail = goodsDAO.getDetailByDetailId(goods_detail_id);
		return goodsDetail;
	}

	public void deleteDetail(Integer goods_detail_id) {
		goodsDAO.deleteDetail(goods_detail_id);
		
	}
	public void deleteGoodsByGoodsId(Integer goodsId) {
		goodsDAO.deleteGoodsByGoodsId(goodsId);
		goodsDAO.deleteAllDetailByGoodsId(goodsId);
		
	}
	public List<GoodsPicture> getDetailPicByDetailId(Integer detailId) {
		List<GoodsPicture> detailPicList = goodsDAO.getDetailPicByDetailId(detailId);
		return detailPicList;
	}

	public String validateGoods(Goods goods) {
		String flag = "false";
		int goodsId = goods.getGoods_id();
		//判断是否为更改商品信息
		if(goodsId!=0){
			goods.setGoods_id(0);
		}
		Goods oldGoods = goodsDAO.getGoodsByGoodsInfo(goods);
		if(oldGoods==null||oldGoods.getGoods_id()==goodsId){
			flag = "true";
		}
		return flag;
	}

	public String validateGoodsDetail(GoodsDetail goodsDetail) {
		String flag = "false";
		int goodsDetailId = goodsDetail.getGoods_detail_id();
		//判断是否为更改商品信息
		if(goodsDetailId!=0){
			goodsDetail.setGoods_detail_id(0);
		}
		GoodsDetail oldGoodsDetail = goodsDAO.getDetailByDetailInfo(goodsDetail);
		if(oldGoodsDetail==null||oldGoodsDetail.getGoods_detail_id()==goodsDetailId){
			flag = "true";
		}
		return flag;
	}

	public void updateAllStockChange(List<GoodsDetail> goodsDetail) {
		if(goodsDetail==null){
			return;
		}
		for(GoodsDetail detail : goodsDetail){
			goodsDAO.updateStockChange(detail);
		}
		
	}

	

	


	

	





	

	


}
