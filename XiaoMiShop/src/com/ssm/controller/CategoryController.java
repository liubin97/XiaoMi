package com.ssm.controller;

import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.service.CategoryService;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @RequestMapping("getAllCategory")
    public @ResponseBody List<GoodsCategory> getAllCategroy(){
        return categoryService.getAllCategory();
    }

}
