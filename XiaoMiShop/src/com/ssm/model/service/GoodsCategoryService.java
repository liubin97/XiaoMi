package com.ssm.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.dao.GoodsCategoryDAO;

@Service
public class GoodsCategoryService {
	final String TRASH_NAME = "其他";
	final String TRASH_DESCRIPTION = "未定分类";
	final int PAGESIZE = 10;
	@Autowired
	private GoodsCategoryDAO goodsCategoryDAO;
	
	public void insertCategory(GoodsCategory goodsCategory){
		
		goodsCategoryDAO.insertCategory(goodsCategory);
	}
	public String updateCategory(GoodsCategory goodsCategory){
		String flag = "false";
		GoodsCategory oldGoodsCategory = goodsCategoryDAO.getCategoryByName(goodsCategory.getCategory_name());
		if(oldGoodsCategory==null||oldGoodsCategory.getGoods_category_id()==goodsCategory.getGoods_category_id()){
			flag = "true";
			goodsCategoryDAO.updateCategory(goodsCategory);
		}
		
		return flag;
	}
	public String deleteCategory(int categoryId){
		String flag = "false";
		int number = goodsCategoryDAO.getGoodsNumByCategoryId(categoryId);
		if(number==0){
			flag = "true";
			goodsCategoryDAO.deleteCategory(categoryId);
		}
		return flag;
	}
	public List<GoodsCategory> getALLCategory(){
		return goodsCategoryDAO.getAllCategory();
	}
	public List<Goods> getAllGoodsByCategoryId(Integer categoryId){
		return goodsCategoryDAO.getAllGoodsByCategoryId(categoryId);
	}
	public Map<String,Object> getAllGoodsInfoByCategoryId(Integer categoryId, Integer pageNum) {
		Page<Goods> page = PageHelper.startPage(pageNum, PAGESIZE);
		goodsCategoryDAO.getAllGoodsByCategoryId(categoryId);
		List<Goods> goodsInfo = page.getResult();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodsInfo", goodsInfo);
		map.put("pageCount",page.getPages());
		return map;
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
	//校验商品类别名（不能重复）
	public String validateCategoryName(String categoryName) {
		String flag = "false";
		GoodsCategory goodsCategory = goodsCategoryDAO.getCategoryByName(categoryName);
		if(goodsCategory==null){
			flag = "true";
		}
		return flag;
	}
}