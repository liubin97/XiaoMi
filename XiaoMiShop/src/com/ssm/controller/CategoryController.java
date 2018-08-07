package com.ssm.controller;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.service.CategoryService;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @RequestMapping("getAllCategory")
    public @ResponseBody List<GoodsCategory> getAllCategroy(){
        return categoryService.getAllCategory();
    }
    @RequestMapping("getCategoryGoods")
    public ModelAndView getCategoryGoods(int category_id){
        ModelAndView mav = new ModelAndView();
        List<Goods> list = categoryService.getCategoryGoods(category_id);
        mav.addObject("goodsList",list);
        mav.setViewName("category_goods");
        return mav;
    }
}
