package com.ssm.controller;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.service.MGroupBuyService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
public class MGroupBuyController {
	@Autowired
	private MGroupBuyService mGroupBuyService;	

	@RequestMapping("addGroupBuy")
	public String addGroupBuy(GroupBuyInfo groupBuyInfo,String starttime,String endtime) {//添加团购
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date goods_starttime = new Date();
		Date goods_endtime = new Date();
		try {
			goods_starttime = sdf.parse(starttime);
			goods_endtime = sdf.parse(endtime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		groupBuyInfo.setGroup_starttime(goods_starttime);
		groupBuyInfo.setGroup_endtime(goods_endtime);
		groupBuyInfo.setGroup_buy_info_status(0);
		mGroupBuyService.addGroupBuy(groupBuyInfo);
		return "manageGroupBuying";
	}
	@RequestMapping("getAllGoods")
	@ResponseBody
	public  List<Goods> getAllGoods(){//获得商品
		System.out.print("进入获取全商品");
		List<Goods> list = mGroupBuyService.getAllGoods();
		return list;
	}
	@RequestMapping("getAllGoodsDetail")
	@ResponseBody
	public List<GoodsDetail> getAllGoodsDetail(){//获得所有商品详细
		List<GoodsDetail> list = mGroupBuyService.getAllGoodsDetail();
		return list;
	}
	@RequestMapping("selectGoodsDetailByGoodsId")
	@ResponseBody
	public List<GoodsDetail> selectGoodsDetailByGoodsId(int goods_id){//根据商品ID获得其详细商品
		List<GoodsDetail> list = mGroupBuyService.selectGoodsDetailByGoodsId(goods_id);
		return list;
	}
	@RequestMapping("selectGroupBuyInfo")
	public ModelAndView selectGroupBuyInfo(Integer goods_detail_id, String starttime, String endtime,HttpSession session){//根据开始时间结束时间商品ID
		int pagenum = 1;
		int pageSize = 5;
		Date systemTime = new Date();
		Date goods_starttime = null;
		Date goods_endtime = null;
		int goodsDetailId = 0 ;//依次判断传入的参数是否为空，若不为空为其赋值
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String pageNum = (String)session.getAttribute("MG_PageNum");
		if(pageNum!=null&&!"".equals(pageNum)){//点击页码查询
			pagenum = Integer.parseInt(pageNum);
			goodsDetailId = Integer.parseInt((String)session.getAttribute("MG_goodsdetailid"));
			goods_starttime = (Date) session.getAttribute("MG_goodsstarttime");
			goods_endtime = (Date)session.getAttribute("MG_goodsendtime");

		}else{//直接查询
			if(goods_detail_id!=null){
				goodsDetailId = goods_detail_id.intValue();
			}
			try {
				if(starttime!=null&&starttime!=""){
					goods_starttime = sdf.parse(starttime);
				}
				if(endtime!=null&&endtime!=""){
					goods_endtime = sdf.parse(endtime);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		GroupBuyInfo groupBuyInfo = new GroupBuyInfo();//封装到实体类
		groupBuyInfo.setGroup_starttime(goods_starttime);
		groupBuyInfo.setGroup_endtime(goods_endtime);
		groupBuyInfo.setGoods_detail_id(goodsDetailId);
		Map<String,Object> map = mGroupBuyService.selectGroupBuyInfo(groupBuyInfo,pagenum,pageSize);
		List<GroupBuyInfo> list = (List<GroupBuyInfo>) map.get("list");
		int maxPageNum = (int) map.get("maxPageNum");
		List isEdit = new ArrayList();
		for(GroupBuyInfo u : list){
			if(u.getGroup_starttime().before(systemTime)){
				if(u.getGroup_endtime().before(systemTime)){
					isEdit.add(2);
				}else{
					isEdit.add(1);
				}
			}else {
				isEdit.add(0);
			}

		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("resultList",list);
		mav.addObject("isEdit",isEdit);
		mav.addObject("maxPageNum",maxPageNum);

		session.setAttribute("MG_PageNum",pagenum);
		session.setAttribute("MG_goodsdetailid",goodsDetailId);
		session.setAttribute("MG_goodsendtime",goods_endtime);
		session.setAttribute("MG_goodsstarttime",goods_starttime);
		mav.setViewName("manageGroupBuying");
		return mav;
	}
	@RequestMapping("editGroupBuy")
	public String editGroupBuyInfo(GroupBuyInfo groupBuyInfo,String starttime,String endtime){//修改团购
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date goods_starttime = new Date();
        Date goods_endtime = new Date();
        try {
            goods_starttime = sdf.parse(starttime);
            goods_endtime = sdf.parse(endtime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        groupBuyInfo.setGroup_starttime(goods_starttime);
        groupBuyInfo.setGroup_endtime(goods_endtime);
        groupBuyInfo.setGroup_buy_info_status(0);
        mGroupBuyService.editGroupBuyInfo(groupBuyInfo);

		return "manageGroupBuying";
	}
	@RequestMapping("selectEditGroupBuying")
    public ModelAndView selectEditGroupBuy(int group_buy_info_id,int type){//查询要修改的团购商品信息
	    GroupBuyInfo groupBuyInfo = mGroupBuyService.selectEditGroupBuy(group_buy_info_id);
	    GoodsDetail goodsDetail = mGroupBuyService.selectGoodsDetailById(groupBuyInfo.getGoods_detail_id());
	    
	    ModelAndView mav = new ModelAndView();
	    if(type==0) {
            mav.setViewName("editGroupBuyingOne");//团购未开始
        }else{
	        mav.setViewName("editGroupBuyingTwo");//团购已开始但未结束
        }
        mav.addObject("goods_id",goodsDetail.getGoods_id());
        mav.addObject("result",groupBuyInfo);
	    return mav;
    }
    @RequestMapping("deleteGroupBuying")
	public String deleteGroupBuying(int group_buy_info_id){
		return null;
	}
}
