package com.ssm.model.dao;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;

import java.util.List;

public interface CategoryDAO {
    public List<GoodsCategory> getAllCategory();
    public List<Goods> getCategoryGoods(int goods_category_id);
}
