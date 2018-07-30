package com.ssm.controller;

import com.ssm.model.bean.*;
import com.ssm.model.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;

    @RequestMapping("displayGoodsPurchaseInfo")
    public ModelAndView disPlayGoods(int goods_id){
        ModelAndView mav = new ModelAndView();
        Goods goods = purchaseService.getGoodsInfo(goods_id);
        List<GoodsComment> goodsCommentList = purchaseService.getGoodsComment(goods_id);
        /*for(GoodsComment comment : goodsCommentList){
            System.out.println("comment:"+comment.getComment());
            System.out.println(comment.getCommentPictureList().size());
            System.out.println(comment.getComment_date());
            for(CommentPicture cp : comment.getCommentPictureList()){
                System.out.println("picture_url:"+cp.getPicture_url());
                System.out.println(cp.getPicture_url() == null);
            }
            System.out.println(comment.getCommentReplyList().size());
            for(CommentReply cr: comment.getCommentReplyList()){
                System.out.println(cr.getReply_date());
                System.out.println("reply:"+cr.getReply());
            }
        }*/
        mav.addObject("goodsInfo",goods);
        mav.addObject("commentList",goodsCommentList);
        mav.setViewName("purchase");
        return mav;
    }

    @RequestMapping("addFavorites")
    public @ResponseBody void addFavorites(int goods_id, HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        Favorites f = new Favorites();
        f.setGoods_id(goods_id);
        f.setUser_email(user_email);
        purchaseService.insertFavorites(f);
    }
}
