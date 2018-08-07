package com.ssm.model.dao;

import com.ssm.model.bean.CommentReply;
import com.ssm.model.bean.GoodsComment;

import java.util.List;
import java.util.Map;

public interface MGoodsCommentDAO {
    List<GoodsComment> selectMGoodsComment(Map<String,Object> map);

    GoodsComment selectMGoodsCommentDetail(int goods_comment_id);

    void deleteMGoodsComment(int goods_comment_id);

    void insertMCommentReply(CommentReply commentReply);
}
