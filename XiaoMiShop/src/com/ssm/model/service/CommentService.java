package com.ssm.model.service;

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
        return commentDAO.getGoodsComment(goods_id);
    }
}
