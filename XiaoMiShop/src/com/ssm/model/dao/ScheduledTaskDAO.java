package com.ssm.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.Order;

public interface ScheduledTaskDAO {
	public List<GroupBuyInfo> selectTimeOutInfo(Date nowDateTime);
	public List<Order> selectOrderByGroupId(int groupId);
	public void settleGroup(int groupId);
	public void settleGroupBuyInfo(int groupBuyInfoId);
	public void settleOrder(int orderId);
	public void increaseStock(Map<String,Object> map);
}
