package com.ssm.model.dao;

import com.ssm.model.bean.*;

import java.util.List;

public interface OrderDAO {
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
}
