package com.ssm.model.dao;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;

import java.util.List;

public interface OrderDAO {
    //通过ID获取商品详情
    public GoodsDetail getGoodsDetailById(int goods_detail_id);
    //通过ID获取商品
    public Goods getGoodsById(int goods_id);
    //通过用户Email获取用户收货地址
    public List<Address> getUserAddress(String user_email);
}
