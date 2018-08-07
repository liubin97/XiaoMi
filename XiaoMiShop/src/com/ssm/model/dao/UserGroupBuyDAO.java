package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.GroupBuyList;
import com.ssm.model.bean.Order;

public interface UserGroupBuyDAO {
	public List<Order> selectUserGroupBuyOrder(String user_email);
	public GoodsDetail selectGoodsDetail(int goodsDetailId);
	
	public Order selectGroupBuyOrderById(int orderId);
	public void deleteOrder(int orderId);
	public void exitGroup(int groupId);
	public GroupBuyList selectGroupById(int groupId);
	public void deleteGroup(int groupId);
	public void increaseStock(Map<String,Object> map);
	public GroupBuyInfo selectGroupBuyInfoById(int groupBuyInfoId);
}
