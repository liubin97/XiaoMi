package com.ssm.model.dao;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.Message;

import java.util.List;

public interface MGroupBuyDAO {

	public void addGroupBuy(GroupBuyInfo groupBuyInfo);

	public List<Goods> getAllGoods();

	public List<GoodsDetail> getAllGoodsDetail();

	public List<GoodsDetail> selectGoodsDetailByGoodsId(int goods_id);

	public List<GroupBuyInfo> selectGroupBuyInfo(GroupBuyInfo groupBuyInfo);

	public void editGroupBuyInfo(GroupBuyInfo groupBuyInfo);

	public GroupBuyInfo selectEditGroupBuy(int group_buy_info_id);

    public GoodsDetail selectGoodsDetailById(int goods_detail_id);

    public void addEditMessage(Message message);

    public List<String> selectEditMessgeUser(int group_buy_info_id);
}
