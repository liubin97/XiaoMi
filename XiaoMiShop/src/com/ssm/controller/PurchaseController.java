package com.ssm.controller;

import com.ssm.model.bean.CommentPicture;
import com.ssm.model.bean.CommentReply;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsComment;
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
        Goods goods = purchaseService.getGoodsInfo(goods_id);
        System.out.println("goods name:"+goods.getGoods_name());
        /*for(int i = 0;i<goods.getGoodsAttributeList().size();i++){
            System.out.println("attribute name:"+goods.getGoodsAttributeList().get(i).getAttribute_name());
            System.out.println("attribute value:"+goods.getGoodsAttributeList().get(i).getAttribute_value());
        }
        for(int i = 0;i<goods.getGoodsDetailList().size();i++){
            System.out.println("goods price"+goods.getGoodsDetailList().get(i).getDiscount_price());
            for(int j=0;j<goods.getGoodsDetailList().get(i).getGoodsPictureList().size();j++){
                System.out.println("picture url:"+goods.getGoodsDetailList().get(i).getGoodsPictureList().get(j).getPicture_set_url());
            }
        }*/
        List<GoodsComment> goodsCommentList = purchaseService.getGoodsComment(goods_id);
        for(GoodsComment comment : goodsCommentList){
            System.out.println("comment:"+comment.getComment());
            System.out.println(comment.getCommentPictureList().size());
            System.out.println(comment.getComment_date());
            for(CommentPicture cp : comment.getCommentPictureList()){
                System.out.println("picture_url:"+cp.getPicture_url());
            }
            System.out.println(comment.getCommentReplyList().size());
            for(CommentReply cr: comment.getCommentReplyList()){
                System.out.println(cr.getReply_date());
                System.out.println("reply:"+cr.getReply());
            }
        }
        mav.setViewName("purchase");
        return mav;
    }
}
