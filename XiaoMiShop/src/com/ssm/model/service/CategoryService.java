package com.ssm.model.service;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService{
    @Autowired
    private CategoryDAO categoryDAO;

    public List<GoodsCategory> getAllCategory(){
        return categoryDAO.getAllCategory();
    }

    public List<Goods> getCategoryGoods(int goods_category_id){
        return categoryDAO.getCategoryGoods(goods_category_id);
    }
}
