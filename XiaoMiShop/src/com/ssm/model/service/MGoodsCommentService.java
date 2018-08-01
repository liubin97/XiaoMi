package com.ssm.model.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ssm.model.bean.CommentReply;
import com.ssm.model.bean.GoodsComment;
import com.ssm.model.dao.MGoodsCommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MGoodsCommentService {
    @Autowired
    private MGoodsCommentDAO mGoodsCommentDAO;

    public Map<String, Object> selectMGoodsComment(Map<String,Object> map, int pagenum, int pageSize) {
        Page<GoodsComment> page = PageHelper.startPage(pagenum,pageSize);
        mGoodsCommentDAO.selectMGoodsComment(map);
        int maxPageNum = page.getPageNum();
        List<GoodsComment> list = page.getResult();
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("list",list);
        resultMap.put("maxPageNum",maxPageNum);
        return resultMap;
    }

    public GoodsComment selectMGoodsCommentDetail(int goods_comment_id) {
        GoodsComment goodsComment = mGoodsCommentDAO.selectMGoodsCommentDetail(goods_comment_id);
        return goodsComment;
    }

    public void deleteMGoodsComment(int goods_comment_id) {
        mGoodsCommentDAO.deleteMGoodsComment(goods_comment_id);
    }

    public void addMCommentReply(String reply, int goods_comment_id) {
        Date sysTime = new Date();
        CommentReply commentReply = new CommentReply();
        commentReply.setReply(reply);
        commentReply.setGoods_comment_id(goods_comment_id);
        commentReply.setReply_type(1);
        commentReply.setUser_email("小米官方");
        commentReply.setReply_date(sysTime);

        mGoodsCommentDAO.insertMCommentReply(commentReply);
    }
}
