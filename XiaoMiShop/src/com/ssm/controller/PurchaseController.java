package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {

    @RequestMapping("goodsPurchase")
    public ModelAndView disPlayGoods(int goods_id){
        ModelAndView mav = new ModelAndView();
        System.out.println(goods_id);
        mav.setViewName("purchase");
        return mav;
    }
}
