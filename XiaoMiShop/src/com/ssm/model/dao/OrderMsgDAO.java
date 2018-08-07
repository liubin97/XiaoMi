package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.Order;

public interface OrderMsgDAO {
	public List<Order> selectOrdersByStatus(Map<String, Object> esmap);
	public Order getDetail(int order_id);
	public void updateFinish(int order_id);
	public List<Order> selectXiuComment(Map<String, Object> xcmap);
}