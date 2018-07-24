package com.ssm.model.dao;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GroupBuyInfo;

import java.util.List;

public interface MGroupBuyDAO {

	public void addGroupBuy(GroupBuyInfo groupBuyInfo);

	public List<Goods> getAllGoods();

	public List<GoodsDetail> getAllGoodsDetail();

	public List<GoodsDetail> selectGoodsDetailByGoodsId(int goods_id);

	public List<GroupBuyInfo> selectGroupBuyInfo(GroupBuyInfo groupBuyInfo);
}
