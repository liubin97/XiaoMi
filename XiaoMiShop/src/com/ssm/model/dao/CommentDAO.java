package com.ssm.model.dao;

import com.ssm.model.bean.CommentReply;
import com.ssm.model.bean.GoodsComment;
import com.ssm.model.bean.User;

import java.util.List;

public interface CommentDAO {
    //获取商品评论
    public List<GoodsComment> getGoodsComment(int goods_id);
    //获取评论用户
    public User getCommentUser(String user_email);
    //插入评论回复
    public void insetCommentReply(CommentReply commentReply);
    //更新点赞数量
    public void updateCommentLikeNum(GoodsComment goodsComment);
    //更新评论回复点赞数量
    public void updateReplyLikeNum(CommentReply commentReply);
    //获取评论信息
    public GoodsComment getCommentById(int goods_comment_id);
}
