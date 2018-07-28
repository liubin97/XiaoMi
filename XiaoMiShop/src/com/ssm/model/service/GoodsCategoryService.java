package com.ssm.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.dao.GoodsCategoryDAO;

@Service
public class GoodsCategoryService {
	final String TRASH_NAME = "其他";
	final String TRASH_DESCRIPTION = "被移除的分类";
	@Autowired
	private GoodsCategoryDAO goodsCategoryDAO;
	
	public void insertCategory(GoodsCategory goodsCategory){
		
		goodsCategoryDAO.insertCategory(goodsCategory);
	}
	public void updateCategory(GoodsCategory goodsCategory){
		goodsCategoryDAO.updateCategory(goodsCategory);
	}
	public void deleteCategory(int categoryId){
		goodsCategoryDAO.deleteCategory(categoryId);
	}
	public List<GoodsCategory> getALLCategory(){
		return goodsCategoryDAO.getAllCategory();
	}
	public List<Goods> getAllGoodsByCategoryId(Integer categoryId) {
		
		return goodsCategoryDAO.getAllGoodsByCategoryId(categoryId);
	}
	public String deleteGoodsInCategory(Integer goodsId, String categoryName) {
		if(categoryName.equals(TRASH_NAME)){
			return "false";
		}
		//判断是否有“其他”类别
		GoodsCategory goodsCategory = goodsCategoryDAO.getCategoryByName(TRASH_NAME);
		if(goodsCategory==null){
			GoodsCategory trashCategory = new GoodsCategory();
			trashCategory.setCategory_name(TRASH_NAME);
			trashCategory.setDescription(TRASH_DESCRIPTION);
			goodsCategoryDAO.insertCategory(trashCategory);
			goodsCategory = goodsCategoryDAO.getCategoryByName(TRASH_NAME);
		}
		//封装数据
		Map<String,Object> trashMap = new HashMap<String,Object>();
		trashMap.put("goodsId", goodsId);
		trashMap.put("trashCategory",goodsCategory);
		goodsCategoryDAO.deleteGoodsInCategory(trashMap);
		return "true";
	}
}
