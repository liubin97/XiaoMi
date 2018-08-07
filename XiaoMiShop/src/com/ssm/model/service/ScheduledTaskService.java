package com.ssm.model.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.GroupBuyList;
import com.ssm.model.bean.Order;
import com.ssm.model.dao.ScheduledTaskDAO;

@Service
public class ScheduledTaskService {
	@Autowired
	ScheduledTaskDAO scheduledTaskDAO;
	
	public void autoRun() {
		List<GroupBuyInfo> groupBuyInfoList = scheduledTaskDAO.selectTimeOutInfo(new Date());
		for(GroupBuyInfo gbi : groupBuyInfoList) {
			for(GroupBuyList gbl : gbi.getGroupList()) {
				List<Order> orders = scheduledTaskDAO.selectOrderByGroupId(gbl.getGroup_id());
				for(Order order : orders) {
					scheduledTaskDAO.settleOrder(order.getOrder_id());
				}
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("num", gbi.getGroup_num());
				map.put("goodsDetailId", gbi.getGoods_detail_id());
				scheduledTaskDAO.increaseStock(map);
				scheduledTaskDAO.settleGroup(gbl.getGroup_id());
			}
			scheduledTaskDAO.settleGroupBuyInfo(gbi.getGroup_buy_info_id());
		}
	}
}
