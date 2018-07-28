package com.ssm.model.service;

import com.ssm.model.bean.Goods;
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

}
