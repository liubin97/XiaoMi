package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;

public interface GoodsCategoryDAO {

	public void insertCategory(GoodsCategory goodsCategory);

	public List<GoodsCategory> getAllCategory();

	public void updateCategory(GoodsCategory goodsCategory);

	public void deleteCategory(int categoryId);

	public List<Goods> getAllGoodsByCategoryId(Integer categoryId);

	public GoodsCategory getCategoryByName(String category_name);

	public void deleteGoodsInCategory(Map<String, Object> trashMap);

}
