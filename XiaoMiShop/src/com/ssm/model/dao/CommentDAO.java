package com.ssm.model.dao;

import com.ssm.model.bean.GoodsComment;

import java.util.List;

public interface CommentDAO {
    //获取商品评论
    public List<GoodsComment> getGoodsComment(int goods_id);
}
