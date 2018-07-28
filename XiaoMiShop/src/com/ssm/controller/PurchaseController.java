package com.ssm.controller;

import com.ssm.model.bean.Goods;
import com.ssm.model.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;

    @RequestMapping("displayGoodsPurchaseInfo")
    public ModelAndView disPlayGoods(int goods_id){
        ModelAndView mav = new ModelAndView();
        List<Goods> list = purchaseService.getGoodsInfo(goods_id);
        mav.setViewName("purchase");
        return mav;
    }
}
