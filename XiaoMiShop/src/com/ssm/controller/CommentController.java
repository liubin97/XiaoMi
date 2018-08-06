package com.ssm.controller;

import com.ssm.model.bean.*;
import com.ssm.model.service.CommentService;
import com.ssm.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    //获取商品评论
    @RequestMapping("getGoodsComment")
    public @ResponseBody List<GoodsComment> getGoodsComment(int goods_id){
        return  commentService.getGoodsComment(goods_id);
    }
    //进行评论回复
    @RequestMapping("makeCommentReply")
    public @ResponseBody void makeCommentReply(CommentReply commentReply,  HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        commentReply.setUser_email(user_email);
        commentReply.setReply_date(new Date());
        commentService.insetCommentReply(commentReply);
    }

    //评论点赞
    @RequestMapping("commentLike")
    public @ResponseBody void updateCommentLikeNum(GoodsComment goodsComment ,HttpSession session ){
        commentService.updateCommentLikeNum(goodsComment);
    }

    //评论回复点赞
    @RequestMapping("replyLike")
    public @ResponseBody void updateReplyLikeNum(CommentReply commentReply,HttpSession session ){
        commentService.updateReplyLikeNum(commentReply);
    }

    //进入评论
    @RequestMapping("goToCommentPage")
    public ModelAndView goToCommentPage(int goods_comment_id){
        ModelAndView mav = new ModelAndView();
        GoodsComment goodsComment = commentService.getCommentById(goods_comment_id);
        mav.addObject("goodsComment",goodsComment);
        mav.setViewName("comment");
        return mav;
    }

    @RequestMapping("goToMakeCommentPage")
    public ModelAndView goToMakeCommentPage(int order_item_id){
        ModelAndView mav = new ModelAndView();
        GoodsDetail goodsDetail = commentService.getCommentGoods(order_item_id);
        mav.addObject("goodsDetail",goodsDetail);
        mav.addObject("order_item_id",order_item_id);
        mav.setViewName("make_comment");
        return mav;
    }

    //发表评论
    @RequestMapping("makeComment")
    public String makeComment(int order_item_id,GoodsComment goodsComment, @RequestParam MultipartFile[] pictures, HttpServletRequest request, HttpSession session){
        String user_email = (String) session.getAttribute("user_email");
        //获取服务器根目录
        String savePath = request.getServletContext().getRealPath("/");
        String relativePath ="commentPicture/";
        String name = "";
        List<CommentPicture> commentPictures = new ArrayList<>();
        System.out.println(pictures.length);

        for(MultipartFile picFile : pictures){
            //获取储存文件名
            name = FileUtil.updateFile(picFile,savePath+relativePath);
            //记录url
            if(name!=null&&!"".equals(name)){
                CommentPicture commentPicture = new CommentPicture();
                commentPicture.setPicture_url(relativePath+name);
                commentPictures.add(commentPicture);
            }
        }
        goodsComment.setCommentPictureList(commentPictures);
        goodsComment.setUser_email(user_email);
        goodsComment.setComment_date(new Date());
        commentService.insertGoodsComment(goodsComment,order_item_id);

        return "redirect:test.jsp";
    }


}
