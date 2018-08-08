package com.ssm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsAttribute;
import com.ssm.model.bean.GoodsPreviewPicture;
import com.ssm.model.dao.GoodsDAO;

@Service
public class GoodsDisplayService {
	@Autowired
	private GoodsDAO goodsDisplayDAO;
	
	public List<GoodsAttribute> getRevisedGoodsAttributes(Integer goodsId){
		List<GoodsAttribute> attributeList = goodsDisplayDAO.getAttributesByGoodsId(goodsId);
		return attributeList;
	};
	
	
	public List<GoodsPreviewPicture> getGoodsPictures(Integer goodsId) {
		List<GoodsPreviewPicture> picList = goodsDisplayDAO.getGoodsPicByGoodsId(goodsId);
		return picList;
	}
}

