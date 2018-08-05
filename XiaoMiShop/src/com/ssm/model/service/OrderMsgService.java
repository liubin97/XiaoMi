package com.ssm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Order;
import com.ssm.model.dao.*;

@Service
public class OrderMsgService {
	 @Autowired
	 private OrderMsgDAO orderMsgDAO;
	
	 public List<Order> selectOrdersByStatus(Map<String, Object> esmap){
		 return orderMsgDAO.selectOrdersByStatus(esmap);
	 }
	 
	 public Order getDetail(int order_id){
		 return orderMsgDAO.getDetail(order_id);
	 }
	 public void updateFinish(int order_id){
		 orderMsgDAO.updateFinish(order_id);
	 }
}
