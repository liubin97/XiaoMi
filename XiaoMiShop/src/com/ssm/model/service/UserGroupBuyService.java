package com.ssm.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.GroupBuyList;
import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;
import com.ssm.model.dao.UserGroupBuyDAO;

@Service
public class UserGroupBuyService {
	
	@Autowired
	private UserGroupBuyDAO userGroupBuyDAO;
	
	//查看用户所有团购订单
	public List<Order> selectUserGroupBuyOrder(String user_email){
		
		List<Order> orders = userGroupBuyDAO.selectUserGroupBuyOrder(user_email);
		for(Order o : orders) {
			for(OrderItem or : o.getOrder_items()) {
				or.setGoodsDetail(userGroupBuyDAO.selectGoodsDetail(or.getGoods_detail_id()));
			}
		}
		
		return orders;
	}
	
	public Order selectGroupBuyOrderDetail(int orderId) {
		Order orderdetail = userGroupBuyDAO.selectGroupBuyOrderById(orderId);
		
			for(OrderItem or : orderdetail.getOrder_items()) {
				or.setGoodsDetail(userGroupBuyDAO.selectGoodsDetail(or.getGoods_detail_id()));
				System.out.println("goods_detail_id:"+or.getGoodsDetail().getGoods_detail_id());
				System.out.println("goods_detail_color:"+or.getGoodsDetail().getColor());
				System.out.println("goods_url:"+or.getGoodsDetail().getGoods().getGoods_pic_url());
			}
		
		return orderdetail;
	}
	
	//用户退出团
	public void deleteUserGroup(String user_email,int orderId) {
		Order order = userGroupBuyDAO.selectGroupBuyOrderById(orderId);
		userGroupBuyDAO.deleteOrder(orderId);
		userGroupBuyDAO.exitGroup(order.getGroup_id());
		GroupBuyList gbl = userGroupBuyDAO.selectGroupById(order.getGroup_id());
		if(gbl.getCurrent_num()==0) {
			userGroupBuyDAO.deleteGroup(gbl.getGroup_id());
			GroupBuyInfo gbi = userGroupBuyDAO.selectGroupBuyInfoById(gbl.getGroup_buy_info_id());
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("num", gbi.getGroup_num());
			map.put("goodsDetailId", gbi.getGoods_detail_id());
			userGroupBuyDAO.increaseStock(map);
		}
	}
}
