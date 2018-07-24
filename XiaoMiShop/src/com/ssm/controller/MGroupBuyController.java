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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


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
	public ModelAndView selectGroupBuyInfo(Integer goods_detail_id, String starttime, String endtime){//根据开始时间结束时间商品ID
		Date systemTime = new Date();
		Date goods_starttime = null;
		Date goods_endtime = null;
		int goodsDetailId = 0 ;//依次判断传入的参数是否为空，若不为空为其赋值
		if(goods_detail_id!=null){
			goodsDetailId = goods_detail_id.intValue();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
		GroupBuyInfo groupBuyInfo = new GroupBuyInfo();//封装到实体类
		groupBuyInfo.setGroup_starttime(goods_starttime);
		groupBuyInfo.setGroup_endtime(goods_endtime);
		groupBuyInfo.setGoods_detail_id(goodsDetailId);
		List<GroupBuyInfo> list = mGroupBuyService.selectGroupBuyInfo(groupBuyInfo);
		List isEdit = new ArrayList();
		for(GroupBuyInfo u : list){
			if(u.getGroup_starttime().before(systemTime)){
				if(u.getGroup_endtime().before(systemTime)){
					isEdit.add(0);
				}else{
					isEdit.add(1);
				}
			}else {
				isEdit.add(2);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("resultList",list);
		mav.addObject("isEdit",isEdit);
		mav.setViewName("manageGroupBuying");
		return mav;
	}
	@RequestMapping("editGroupBuyInfo")
	public String editGroupBuyInfo(GroupBuyInfo groupBuyInfo){


		return "manageGroupBuying";
	}
}
