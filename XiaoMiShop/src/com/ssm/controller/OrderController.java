package com.ssm.controller;

import com.ssm.model.bean.*;
import com.ssm.model.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public ModelAndView settlementCart(int [] items,HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        List<Address> addressList = orderService.getUserAddress(user_email);
        List<Map<String,Object>> goodsItems = new ArrayList<>();
        List<Cart> cartList = orderService.getCartInfoByIds(items);
        for(Cart cart:cartList){
            GoodsDetail goodsDetail = orderService.getGoodsDetailById(cart.getGoods_detail_id());
            Map<String,Object> goodsItem = new HashMap<>();
            goodsItem.put("goodsItem",goodsDetail);
            goodsItem.put("goodsNum",cart.getGoods_num());
            goodsItem.put("sumMoney",goodsDetail.getDiscount_price()*cart.getGoods_num());
            goodsItems.add(goodsItem);
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("settleFlag","settlementCart");
        mav.addObject("addressList",addressList);
        mav.addObject("goodsItems",goodsItems);
        mav.addObject("cart_ids",items);
        mav.setViewName("confirm_order");
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
        mav.addObject("settleFlag","purchaseImmediately");
        mav.addObject("addressList",addressList);
        mav.addObject("goodsItems",goodsItems);
        mav.setViewName("confirm_order");
        return mav;
    }
    //确认订单
    @RequestMapping("confirmOrder")
    public @ResponseBody void confirmOrder(@RequestBody OrderInfo orderInfo, HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        Order order = new Order();
        order.setUser_email(user_email);
        order.setAddress_id(orderInfo.getAddress_id());
        order.setGoods_num(orderInfo.getGoods_num());
        order.setSum_money(orderInfo.getSum_money());
        order.setOrder_items(orderInfo.getOrderItems());
        orderService.insertOrder(order);
    }
    //购物车结算确认订单
    @RequestMapping("cartConfirmOrder")
    public @ResponseBody void cartConfirmOrder(@RequestBody OrderInfo orderInfo, HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        Order order = new Order();
        order.setUser_email(user_email);
        order.setAddress_id(orderInfo.getAddress_id());
        order.setGoods_num(orderInfo.getGoods_num());
        order.setSum_money(orderInfo.getSum_money());
        order.setOrder_items(orderInfo.getOrderItems());
        orderService.insertCartOrder(order,orderInfo.getCart_ids());
    }

}
