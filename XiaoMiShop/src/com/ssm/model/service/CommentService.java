package com.ssm.model.service;

import com.ssm.model.bean.CommentReply;
import com.ssm.model.bean.GoodsComment;
import com.ssm.model.dao.CommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class CommentService {
    @Autowired
    private CommentDAO commentDAO;

    //获取商品评论信息
    public List<GoodsComment> getGoodsComment(int goods_id){
        List<GoodsComment> goodsCommentList = commentDAO.getGoodsComment(goods_id);
        //根据评论用户email获取评论
        for(GoodsComment goodsComment:goodsCommentList){
            goodsComment.setUser(commentDAO.getCommentUser(goodsComment.getUser_email()));
            for(CommentReply commentReply:goodsComment.getCommentReplyList()){
                commentReply.setUser(commentDAO.getCommentUser(commentReply.getUser_email()));
            }
        }
        return goodsCommentList;
    }

    //插入评论回复信息
    public void insetCommentReply(CommentReply commentReply){
        commentDAO.insetCommentReply(commentReply);
    }

    //更新点赞数量
    public void updateCommentLikeNum(GoodsComment goodsComment){
        commentDAO.updateCommentLikeNum(goodsComment);
    }

    //更新评论回复点赞数量
    public void updateReplyLikeNum(CommentReply commentReply){
        commentDAO.updateReplyLikeNum(commentReply);
    }

    //通过ID获取评论信息
    public GoodsComment getCommentById(int goods_comment_id){
        GoodsComment goodsComment = commentDAO.getCommentById(goods_comment_id);
        goodsComment.setUser(commentDAO.getCommentUser(goodsComment.getUser_email()));
        for(CommentReply commentReply:goodsComment.getCommentReplyList()){
            commentReply.setUser(commentDAO.getCommentUser(commentReply.getUser_email()));
        }
        return goodsComment;
    }


}
