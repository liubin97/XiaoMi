package com.ssm.model.service;

import com.ssm.model.bean.*;
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
    //获取购物车信息
    public List<Cart> getCartInfoByIds(int cartIds[]){
        return orderDAO.getCartInfoByIds(cartIds);
    }


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
        //System.out.println(order.getOrder_id());
        orderDAO.insertOrderItem(order);
        //更新库存
        for(OrderItem orderItem:order.getOrder_items()){
            orderDAO.updateStock(orderItem);
        }
        //插入提醒消息
        Message msg = new Message();
        msg.setUser_email(order.getUser_email());
        msg.setMessage_title("订单提醒");
        msg.setMessage_text("您的单号为："+ order.getOrder_id() +" 的订单已下单成功，请查收");
        msg.setMessage_type(0);
        msg.setSend_date(new Date());
        orderDAO.insertMessage(msg);
    }

    //插入购物车结算订单信息
    public void insertCartOrder(Order order,int[] cart_ids){
        insertOrder(order);
        orderDAO.deleteCartByIds(cart_ids);
    }
}