package com.ssm.controller;


import java.util.List;

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
		
		goodsCategoryService.updateCategory(goodsCategory);
		return "sss";
	}
	@RequestMapping("deleteCategory")
	public @ResponseBody String deleteCategory(Integer categoryId){
		goodsCategoryService.deleteCategory(categoryId);
		return "sss";
	}
	@RequestMapping("getAllGoodsByCategoryId")
	public @ResponseBody List<Goods> getAllGoodsByCategoryId(Integer categoryId){
		return goodsCategoryService.getAllGoodsByCategoryId(categoryId);	
		
	}
	@RequestMapping("deleteGoodsInCategory")
	public @ResponseBody String deleteGoodsInCategory(Integer goodsId,String categoryName){
		return goodsCategoryService.deleteGoodsInCategory(goodsId,categoryName);
	}
}
