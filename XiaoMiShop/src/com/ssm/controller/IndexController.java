package com.ssm.controller;

import com.ssm.model.bean.GoodsCategory;
import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.SeckillDetail;
import com.ssm.model.service.CategoryService;
import com.ssm.model.service.GroupBuyService;
import com.ssm.model.service.SeckillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SeckillService seckillService;
    @Autowired
    private GroupBuyService groupBuyService;

    @RequestMapping("index")
    public ModelAndView display(){
        ModelAndView mav = new ModelAndView();
        List<GoodsCategory> categoryList = categoryService.getAllCategory();
        System.out.println(categoryList.size());
        List<SeckillDetail> seckillDetails = seckillService.getRecentSeckill();
        List<GroupBuyInfo> list = groupBuyService.selectAllGroupBuyGoods();
        mav.addObject("allGroupBuyInfo",list);
        mav.addObject("seckillList",seckillDetails);
        mav.addObject("categoryList",categoryList);

        mav.setViewName("index");
        return mav;
    }
}
