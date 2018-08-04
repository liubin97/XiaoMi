package com.ssm.controller;
/*
* 购买页面的商品信息显示
* 购买商品
* 加入购物车
* 显示评论
* 加入我喜欢的商品
* */


import com.ssm.model.bean.*;
import com.ssm.model.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;

    //显示要购买商品的信息
    @RequestMapping("displayGoodsPurchaseInfo")
    public ModelAndView disPlayGoods(int goods_id){
        ModelAndView mav = new ModelAndView();
        Goods goods = purchaseService.getGoodsInfo(goods_id);

        mav.addObject("goods",goods);
        mav.setViewName("purchase");
        return mav;
    }


    //判断商品是否已经加入我喜欢
    @RequestMapping("checkFavorites")
    public @ResponseBody int checkFavorites(int goods_id,HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        if(user_email != null && !"".equals(user_email)){
            Favorites favorites = new Favorites();
            favorites.setUser_email(user_email);
            favorites.setGoods_id(goods_id);
            return purchaseService.getFavorites(favorites);
        }else {
            return 0;
        }
    }

    //加入我喜欢
    @RequestMapping("addFavorites")
    public @ResponseBody void addFavorites(int goods_id, HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        Favorites favorites = new Favorites();
        favorites.setGoods_id(goods_id);
        favorites.setUser_email(user_email);
        purchaseService.insertFavorites(favorites);
    }

    //获取库存
    @RequestMapping("getStock")
    public @ResponseBody int getStock(int goods_detail_id){
        return purchaseService.getStock(goods_detail_id);
    }



}
