package com.ssm.model.service;

import com.ssm.model.bean.Favorites;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsComment;
import com.ssm.model.dao.PurchaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PurchaseService {
    @Autowired
    private PurchaseDAO purchaseDAO;
    //获取商品信息
    public Goods getGoodsInfo(int goods_id){
        return purchaseDAO.getGoodsInfo(goods_id);
    }
    //获取评论信息
    public List<GoodsComment> getGoodsComment(int goods_id){
        return purchaseDAO.getGoodsComment(goods_id);
    }
    //添加我喜欢的商品
    public void insertFavorites(Favorites f){
        purchaseDAO.insertFavorites(f);
    }
    //查询库存信息
    public int getStock(int goods_detail_id){
        return purchaseDAO.getStock(goods_detail_id);
    }

}
