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
}
