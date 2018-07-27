package com.ssm.model.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.GroupBuyList;
import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;
import com.ssm.model.bean.UserAddress;
import com.ssm.model.dao.GroupBuyInfoDAO;
import com.ssm.model.dao.GroupBuyListDAO;
import com.ssm.model.dao.GroupBuyOrderDAO;

@Service
public class GroupBuyService {
	
	@Autowired
	private GroupBuyInfoDAO groupBuyInfoDAO;
	@Autowired
	private GroupBuyListDAO groupBuyListDAO;
	@Autowired 
	private GroupBuyOrderDAO groupBuyOrderDAO;
	
	public List<GroupBuyInfo> selectAllGroupBuyGoods(){	
		return groupBuyInfoDAO.selectAllGroupBuyInfo();
	}
	
	public GroupBuyInfo selectGroupBuyInfoById(int groupBuyInfoId) {
		GroupBuyInfo gbi = groupBuyInfoDAO.selectGroupBuyInfoById(groupBuyInfoId);
		gbi.setGroupList(groupBuyListDAO.selectGroupBuyListById(groupBuyInfoId));
		return gbi;
	}
	
	public List<UserAddress> selectUserAddress(String user_email){
		return groupBuyInfoDAO.selectUserAddress(user_email);
	}
	
	public boolean isInGroup(int groupId,String user_email) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_email", user_email);
		map.put("groupId", groupId);
		if(groupBuyListDAO.isInGroup(map)==0) {
			return true;
		}
		return false;
	}
	
	public void insertGroup(int groupId,int addressId,String user_email) {
		GroupBuyList group = groupBuyListDAO.selectGroupById(groupId);
		GroupBuyInfo gbi = groupBuyInfoDAO.selectGroupBuyInfoById(group.getGroup_buy_info_id());

		groupBuyListDAO.insertGroup(group.getGroup_id());
		generateGroupBuyOrder(gbi.getGoods_detail_id(),user_email,addressId,group.getGroup_id(),gbi.getGroup_buy_price());
	}
	
	public void generateGroupBuyOrder(int goods_detail_id,String user_email,int addressId,int groupId,float sum_money) {
		Order order = new Order();
		order.setAddress_id(addressId);
		order.setGoods_num(1);
		order.setGroup_id(groupId);
		order.setOrder_date(new Date());
		order.setOrder_type(2);
		order.setUser_email(user_email);
		order.setSum_money(sum_money);
		order.setOrder_status(2);
		groupBuyOrderDAO.insertNewOrder(order);
		
		OrderItem orderitem = new OrderItem();
		orderitem.setGoods_detail_id(goods_detail_id);
		orderitem.setItem_price(sum_money);
		orderitem.setOrder_id(order.getOrder_id());
		orderitem.setOrder_item_num(1);
		orderitem.setComment_flag(1);
		groupBuyOrderDAO.insertNewOrderItem(orderitem);
	}
	
}
