package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsAttribute;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GoodsPicture;
import com.ssm.model.bean.GoodsPreviewPicture;

public interface GoodsDAO {
	public void insertGoods(Goods goods);
	public void insertAttribute(GoodsAttribute goodsAttribute);
	public void insertDetail(GoodsDetail goodsDetail);
	public void insertDetailPicture(GoodsPicture goodsPicture);
	public void insertGoodsPicture(GoodsPreviewPicture goodsPreviewPicture);
	
	public void updateStockAdd(GoodsDetail goodsDetail);
	public void updateStockChange(GoodsDetail goodsDetail);
	public void updateGoods(Goods goods);
	public void updateGoodsPicture(GoodsPreviewPicture pic);
	public void updateAttribute(GoodsAttribute goodsAttribute);
	public void updateDetail(GoodsDetail goodsDetail);
	public void updateDetailPicture(GoodsPicture goodsPicture);
	
	public int getGoodIdByCode(int code);
	public String[] getAllKindByGoodsId(Integer goodsId);
	public List<GoodsDetail> getAllColorBygoodsIdAndKind(GoodsDetail goodsDetail);
	public List<GoodsDetail> getAllDetailByGoodsId(Integer goodsId);
	public Goods getGoodsByGoodsId(Integer goodsId);
	public List<GoodsPreviewPicture> getGoodsPicByGoodsId(Integer goodsId);
	public List<GoodsAttribute> getAttributesByGoodsId(Integer goodsId);
	public List<GoodsPicture> getDetailPicByDetailId(Integer detailId);
	public GoodsDetail getDetailByDetailId(int goods_detail_id);
	public Goods getGoodsByGoodsInfo(Goods goods);
	public GoodsDetail getDetailByDetailInfo(GoodsDetail goodsDetail);
	
	public void deleteGoodsPicture(int goods_preview_pic_id);
	public void deleteAttribute(int goods_attribute_id);
	public void deleteDetail(Integer goods_detail_id);
	public void deleteDetailPicture(int picture_set_id);
	
	










}
