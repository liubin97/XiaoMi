package com.ssm.controller;

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
        List<GoodsComment> goodsCommentList = purchaseService.getGoodsComment(goods_id);
        mav.addObject("goods",goods);
        mav.addObject("commentList",goodsCommentList);
        mav.setViewName("purchase");
        return mav;
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
