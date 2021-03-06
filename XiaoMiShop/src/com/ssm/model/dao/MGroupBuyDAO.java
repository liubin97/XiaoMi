package com.ssm.model.dao;

import com.ssm.model.bean.*;

import java.util.List;
import java.util.Map;

public interface MGroupBuyDAO {

	public void insertGroupBuy(GroupBuyInfo groupBuyInfo);

	public List<Goods> getAllGoods();

	public List<GoodsDetail> getAllGoodsDetail();

	public List<GoodsDetail> selectGoodsDetailByGoodsId(int goods_id);

	public List<GroupBuyInfo> selectGroupBuyInfo(GroupBuyInfo groupBuyInfo);

	public void updateGroupBuyInfo(GroupBuyInfo groupBuyInfo);

	public GroupBuyInfo selectEditGroupBuy(int group_buy_info_id);

    public GoodsDetail selectGoodsDetailById(int goods_detail_id);

    public void insertEditMessage(Message message);

    public List<String> selectEditMessgeUser(int group_buy_info_id);

    public  void deleteGroupBuying(int group_buy_info_id);

	public void updateGroupBuyingList(int group_buy_info_id);

	public void updateGroupBuyingOrder(int group_buy_info_id);

	public List<GroupBuyList> selectGroupListByGroupBuyId(int group_buy_info_id);

	public void updateGroupBuyGoodsStock(Map<String,Integer> map);

	public GroupBuyInfo selectGroupBuyInfoById(int group_buy_info_id);

    float selectGoodsDetailPriceById(int goods_detail_id);

    int selectGoodsDetailStockById(int goods_detail_id);
}
