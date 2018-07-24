package com.ssm.model.service;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.dao.MGroupBuyDAO;

import java.util.List;

@Service
public class MGroupBuyService {
	
	@Autowired
	private MGroupBuyDAO mGroupBuyDAO;
	
	public void addGroupBuy(GroupBuyInfo groupBuyInfo) {
		mGroupBuyDAO.addGroupBuy(groupBuyInfo);
		
	}
	public List<Goods> getAllGoods(){
		List<Goods> list = mGroupBuyDAO.getAllGoods();
		return list;
	}

	public List<GoodsDetail> getAllGoodsDetail() {
		List<GoodsDetail> list = mGroupBuyDAO.getAllGoodsDetail();
		return list;
	}

	public List<GoodsDetail> selectGoodsDetailByGoodsId(int goods_id) {
		List<GoodsDetail> list = mGroupBuyDAO.selectGoodsDetailByGoodsId(goods_id);
		return list;
	}

	public List<GroupBuyInfo> selectGroupBuyInfo(GroupBuyInfo groupBuyInfo) {
		List<GroupBuyInfo> list = mGroupBuyDAO.selectGroupBuyInfo(groupBuyInfo);
		return list;
	}
}
