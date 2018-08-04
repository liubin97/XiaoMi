package com.ssm.model.service;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.Order;
import com.ssm.model.bean.OrderItem;
import com.ssm.model.dao.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderDAO orderDAO;
    //通过ID获取商品详情
    public GoodsDetail getGoodsDetailById(int goods_detail_id){
        GoodsDetail goodsDetail  = orderDAO.getGoodsDetailById(goods_detail_id);
        goodsDetail.setGoods(orderDAO.getGoodsById(goodsDetail.getGoods_id()));
        return goodsDetail;
    }
    //通过用户email获取用户收货地址
    public List<Address> getUserAddress(String user_email){

        return orderDAO.getUserAddress(user_email);
    }
    //插入订单信息
    public void insertOrder(Order order){
        order.setOrder_date(new Date());
        order.setOrder_type(1);
        order.setOrder_status(0);
        orderDAO.insertOrder(order);
        System.out.println(order.getOrder_id());
        orderDAO.insertOrderItem(order);
    }
}