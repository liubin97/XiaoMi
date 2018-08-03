package com.ssm.controller;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.Order;
import com.ssm.model.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    //结算购物车
    @RequestMapping("settlementCart")
    public ModelAndView settlementCart(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }

    //立即购买
    @RequestMapping("purchaseImmediately")
    public ModelAndView purchaseImmediately(int goods_detail_id,HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        List<Address> addressList = orderService.getUserAddress(user_email);
        ModelAndView mav = new ModelAndView();
        GoodsDetail goodsDetail = orderService.getGoodsDetailById(goods_detail_id);
        Map<String,Object> goodsItem = new HashMap<>();
        goodsItem.put("goodsItem",goodsDetail);
        goodsItem.put("goodsNum",1);
        goodsItem.put("sumMoney",goodsDetail.getDiscount_price());
        List<Map<String,Object>> goodsItems = new ArrayList<>();
        goodsItems.add(goodsItem);
        mav.addObject("addressList",addressList);
        mav.addObject("goodsItems",goodsItems);
        mav.setViewName("confirm_order");
        return mav;
    }

}
