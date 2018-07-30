package com.ssm.model.dao;

import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;

public interface GroupBuyOrderDAO {

	public void insertNewOrder(Order order);
	public void insertNewOrderItem(OrderItem orderitem);
	public void settleGroupBuyOrder(int groupId);
}
