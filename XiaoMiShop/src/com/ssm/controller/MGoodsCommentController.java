package com.ssm.controller;

import com.ssm.model.bean.GoodsComment;
import com.ssm.model.service.MGoodsCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MGoodsCommentController {
    @Autowired
    private MGoodsCommentService mGoodsCommentService;

    @RequestMapping("selectMGoodsComment")
    public ModelAndView selectMGoodsComment(Integer goods_id,Integer pageNum,String starttime,String endtime,HttpSession session){
        int pageSize = 5;
        int pagenum = 1;
        Date start_time = null;
        Date end_time = null;
        int goodsId = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if(pageNum!=null){
            pagenum=pageNum.intValue();
            goodsId= (Integer)session.getAttribute("MG_goodsId");
            start_time = (Date) session.getAttribute("MG_commentstarttime");
            end_time = (Date)session.getAttribute("MG_commentsendtime");
        }else {
            if(goods_id!=null){
                goodsId=goods_id.intValue();
            }

                try {
                    if(starttime!=null&&!"".equals(starttime)){
                        start_time=sdf.parse(starttime);
                    }
                    if(starttime!=null&&!"".equals(starttime)){
                        end_time=sdf.parse(endtime);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
        }
        Map<String,Object> map = new HashMap<>();
        map.put("start_time",start_time);
        map.put("end_time",end_time);
        map.put("goodsId",goodsId);
        Map<String,Object> resultMap = mGoodsCommentService.selectMGoodsComment(map,pagenum,pageSize);
        List<GoodsComment> result = (List<GoodsComment>) resultMap.get("list");
        int maxPageNum = (int) resultMap.get("maxPageNum");
        ModelAndView mav = new ModelAndView();
        mav.addObject("resultList",result);
        mav.addObject("maxPageNum",maxPageNum);
        mav.addObject("MG_PageNum",pagenum);
        mav.setViewName("manageGoodsComment");
        session.setAttribute("MG_goodsId",goodsId);
        session.setAttribute("MG_commentstarttime",start_time);
        session.setAttribute("MG_commentendtime",end_time);
        return mav;
    }

    @RequestMapping("selectMGoodsCommentDetail")
    public ModelAndView selectMGoodsCommentDetail(int goods_comment_id,int pageNum){
        GoodsComment goodsComment = mGoodsCommentService.selectMGoodsCommentDetail(goods_comment_id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("goodsComment",goodsComment);
        mav.addObject("pageNum",pageNum);
        mav.setViewName("GoodsCommentDetail");
        return mav;
    }
    @RequestMapping("deleteMGoodsComment")
    public String deleteMGoodsComment(int goods_comment_id,int pageNum){
        mGoodsCommentService.deleteMGoodsComment(goods_comment_id);
        return "redirect:selectMGoodsComment.action?pageNum="+pageNum;
    }
    @RequestMapping("addMCommentReply")
    public String addMCommentReply(String reply,int goods_comment_id,int pageNum){
        mGoodsCommentService.addMCommentReply(reply,goods_comment_id);
        return "redirect:selectMGoodsCommentDetail.action?goods_comment_id="+goods_comment_id+"&pageNum="+pageNum;
    }
}
