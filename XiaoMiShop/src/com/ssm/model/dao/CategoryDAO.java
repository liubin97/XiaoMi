package com.ssm.model.dao;
/*
* 展示商品的类别：
* 展示所有类别以及类别下的所有商品
* 展示单一类别下的所有商品
* */
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;

import java.util.List;

public interface CategoryDAO {
    //展示所有分类
    public List<GoodsCategory> getAllCategory();
    //展示单个分类下的商品
    public List<Goods> getCategoryGoods(int goods_category_id);
}
