package com.ssm.model.dao;

import com.ssm.model.bean.Goods;

import java.util.List;

public interface PurchaseDAO {
    public Goods getGoodsInfo(int goods_id);
}
