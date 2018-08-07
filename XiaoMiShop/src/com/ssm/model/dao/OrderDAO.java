package com.ssm.model.dao;

import com.ssm.model.bean.*;

import java.util.List;

public interface OrderDAO {
    //获取购物车信息
    public List<Cart> getCartInfoByIds(int cartIds[]);
    //通过ID获取商品详情
    public GoodsDetail getGoodsDetailById(int goods_detail_id);
    //通过ID获取商品
    public Goods getGoodsById(int goods_id);
    //通过用户Email获取用户收货地址
    public List<Address> getUserAddress(String user_email);
    //插入订单信息
    public void insertOrder(Order order);
    //插入订单商品条目
    public void insertOrderItem(Order order);
    //更改订单
    public void updateStock(OrderItem orderItem);
    //插入消息
    public void insertMessage(Message msg);
    //删除购物车商品
    public void deleteCartByIds(int [] cart_ids);
}
