package com.ssm.controller;

import com.ssm.model.bean.CommentReply;
import com.ssm.model.bean.GoodsComment;
import com.ssm.model.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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


}
