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
	public void insertPicture(GoodsPicture goodsPicture);
	public void insertGoodsPicture(GoodsPreviewPicture goodsPreviewPicture);
	public void updateStockAdd(GoodsDetail goodsDetail);
	public void updateStockChange(GoodsDetail goodsDetail);
	public int getGoodIdByCode(int code);
	public int getDetailIdByInfo(GoodsDetail goodsDetail);
	public String[] getAllKindByGoodsId(Integer goodsId);
	public List<GoodsDetail> getAllColorBygoodsIdAndcolor(GoodsDetail goodsDetail);
	public List<GoodsDetail> getAllDetailByGoodsId(Integer goodsId);
	public Goods getGoodsByGoodsId(Integer goodsId);


}
