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

    public Goods getGoodsInfo(int goods_id){
        return purchaseDAO.getGoodsInfo(goods_id);
    }

    public List<GoodsComment> getGoodsComment(int goods_id){
        return purchaseDAO.getGoodsComment(goods_id);
    }

    public void insertFavorites(Favorites f){
        purchaseDAO.insertFavorites(f);
    }
}
