package com.ssm.controller;

import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    //结算购物车
    @RequestMapping("settlementCart")
    public ModelAndView settlementCart(){
        ModelAndView mav = new ModelAndView();

        return mav;
    }

    //立即购买
    @RequestMapping("purchaseImmediately")
    public ModelAndView purchaseImmediately(int goods_detail_id){
        ModelAndView mav = new ModelAndView();
        List<GoodsDetail> goodsDetailList = new ArrayList<>();
        mav.addObject("goodsDetailList",goodsDetailList);
        mav.setViewName("confirm_order");
        return mav;
    }

}
