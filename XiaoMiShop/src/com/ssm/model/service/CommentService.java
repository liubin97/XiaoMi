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

    //获取评论信息
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
}
