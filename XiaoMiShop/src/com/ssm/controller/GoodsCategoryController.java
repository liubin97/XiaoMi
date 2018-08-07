package com.ssm.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;




import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.service.GoodsCategoryService;

@Controller
public class GoodsCategoryController {
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@RequestMapping("insertCategory")
	public String insertCategory(GoodsCategory goodsCategory){
		goodsCategoryService.insertCategory(goodsCategory);
		return "add_goods_category";
	}
	@RequestMapping("getALLCategory")
	public @ResponseBody List<GoodsCategory> getALLCategory(){
		List<GoodsCategory> list = goodsCategoryService.getALLCategory();
		return list;
	}
	@RequestMapping("updateCategory")
	public @ResponseBody String updateCategory(@RequestBody GoodsCategory goodsCategory){
		String flag = "void";
		
		String categoryName = goodsCategory.getCategory_name();
		if(categoryName!=null&&!"".equals(categoryName)){
			flag = goodsCategoryService.updateCategory(goodsCategory);
		}
		
		return flag;
	}
	@RequestMapping("deleteCategory")
	public @ResponseBody String deleteCategory(Integer categoryId){
		
		return goodsCategoryService.deleteCategory(categoryId);
	}
	@RequestMapping("getAllGoodsByCategoryId")
	public @ResponseBody List<Goods> getAllGoodsByCategoryId(Integer categoryId){
		return goodsCategoryService.getAllGoodsByCategoryId(categoryId);	
		
	}
	@RequestMapping("getAllGoodsInfoByCategoryId")
	public @ResponseBody Map<String,Object> getAllGoodsInfoByCategoryId(Integer categoryId,Integer pageNum){
		return goodsCategoryService.getAllGoodsInfoByCategoryId(categoryId,pageNum);	
		
	}
	@RequestMapping("deleteGoodsInCategory")
	public @ResponseBody String deleteGoodsInCategory(Integer goodsId,String categoryName){
		return goodsCategoryService.deleteGoodsInCategory(goodsId,categoryName);
	}
	@RequestMapping("validateCategoryName")
	public @ResponseBody String validateCategoryName(String categoryName){
		String flag = "false";
		if(categoryName!=null&&!"".equals(categoryName)){
			flag = goodsCategoryService.validateCategoryName(categoryName);
		}

		return flag;
	}
}
