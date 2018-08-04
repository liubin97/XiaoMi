package com.ssm.controller;

import com.ssm.model.bean.GoodsComment;
import com.ssm.model.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("getGoodsComment")
    public @ResponseBody List<GoodsComment> getGoodsComment(int goods_id){
        return  commentService.getGoodsComment(goods_id);
    }

}
