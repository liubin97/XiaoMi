package com.ssm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;
import com.ssm.model.dao.UserGroupBuyDAO;

public class UserGroupBuyService {
	
	@Autowired
	private UserGroupBuyDAO userGroupBuyDAO;
	
	public List<Order> selectUserGroupBuyOrder(String user_email){
		List<Order> orders = userGroupBuyDAO.selectUserGroupBuyOrder(user_email);
		for(Order o : orders) {
			for(OrderItem or : o.getOrder_items()) {
				or.setGoodsDetail(userGroupBuyDAO.selectGoodsDetail(or.getGoods_detail_id()));
			}
		}
		
		return orders;
	}
	
	public void deleteUserGroup(String user_email,int groupId) {
		
	}
}
