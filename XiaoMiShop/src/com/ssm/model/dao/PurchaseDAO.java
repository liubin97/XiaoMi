package com.ssm.model.dao;

import com.ssm.model.bean.Favorites;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsComment;

import java.util.List;

public interface PurchaseDAO {
    //获取商品信息
    public Goods getGoodsInfo(int goods_id);

    //查询商品是否已经收藏
    public int getFavorites(Favorites favorites);
    //插入收藏商品信息
    public void insertFavorites(Favorites favorites);
    //删除收藏商品
    public void deleteFavorites(Favorites favorites);
    //获取商品库存
    public int getStock(int goods_detail_id);
}
