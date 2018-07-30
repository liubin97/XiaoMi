package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.Order;

public interface UserGroupBuyDAO {
	public List<Order> selectUserGroupBuyOrder(String user_email);
	public GoodsDetail selectGoodsDetail(int goodsDetailId);
}
