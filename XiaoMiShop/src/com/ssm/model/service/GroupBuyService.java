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
import com.ssm.model.bean.Message;
import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;
import com.ssm.model.bean.Address;
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
	
	public List<Address> selectUserAddress(String user_email){
		return groupBuyInfoDAO.selectUserAddress(user_email);
	}
	
	//判断用户是否在该团中
	public int getIsInGroup(int groupId,String user_email) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_email", user_email);
		map.put("groupId", groupId);
		System.out.println("user_email:"+user_email);
		System.out.println("groupId:"+groupId);
		if(groupBuyListDAO.isInGroup(map)==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	//顾客加入团
	public void insertGroup(int groupId,int addressId,String user_email) {
		//先查出要加入的团和团购的信息
		GroupBuyList group = groupBuyListDAO.selectGroupById(groupId);
		GroupBuyInfo gbi = groupBuyInfoDAO.selectGroupBuyInfoById(group.getGroup_buy_info_id());

		groupBuyListDAO.insertGroup(group.getGroup_id());
		generateGroupBuyOrder(gbi.getGoods_detail_id(),user_email,addressId,group.getGroup_id(),gbi.getGroup_buy_price());
		
		//获取有人加入团之后的团的信息
		group = groupBuyListDAO.selectGroupById(groupId);
		
		//如果团满了进行该团的订单结算
		if(group.getCurrent_num() == gbi.getGroup_num()) {
			settleGroupBuyOrder(groupId);
			Message m = new Message();
			m.setMessage_text("您加入的团，团ID为"+groupId+"已经人满，订单已结算！");
			m.setSend_date(new Date());
			m.setMessage_title("团购提醒！");
			m.setMessage_type(0);
			m.setRead_flag(0);
			m.setUser_email(user_email);
			groupBuyInfoDAO.insertMessage(m);
		}
	}
	
	//顾客发起团
	public void insertNewGroup(int groupBuyInfoId,String user_email,int addressId) {
		GroupBuyList gbl = new GroupBuyList();
		gbl.setCurrent_num(0);
		gbl.setGroup_begin_time(new Date());
		gbl.setGroup_buy_info_id(groupBuyInfoId);
		gbl.setGroup_buy_list_status(1);
		groupBuyListDAO.initiateNewGroup(gbl);
		
		insertGroup(gbl.getGroup_id(),addressId,user_email);
		
		GroupBuyInfo gbi = groupBuyInfoDAO.selectGroupBuyInfoById(groupBuyInfoId);
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("goodsDetailId", gbi.getGoods_detail_id());
		map.put("num", gbi.getGroup_num());
		groupBuyOrderDAO.decreaseStock(map);
	}
	
	//生成团购订单
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
	//团满时，结算团购订单
	public void settleGroupBuyOrder(int groupId) {
		groupBuyOrderDAO.settleGroupBuyOrder(groupId);
		groupBuyListDAO.settleGroup(groupId);
	}

	public int getStock(int goodsDetailId) {
		
		return groupBuyInfoDAO.getStock(goodsDetailId);
	}
}
