package com.ssm.model.dao;

import com.ssm.model.bean.Favorites;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsComment;

import java.util.List;

public interface PurchaseDAO {
    public Goods getGoodsInfo(int goods_id);
    public List<GoodsComment> getGoodsComment(int goods_id);
    public void insertFavorites(Favorites favorites);
    public int getStock(int goods_detail_id);
}
