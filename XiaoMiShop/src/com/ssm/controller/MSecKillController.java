package com.ssm.controller;

import com.ssm.model.bean.GoodsDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.model.bean.SecKillInfo;
import com.ssm.model.service.MSecKillService;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class MSecKillController {
	@Autowired
	private MSecKillService mSecKillService;
	
	
	@RequestMapping("selectSecKill")
	public ModelAndView selectSecKill(Integer goods_detail_id, String starttime,Integer pageNum, String endtime,HttpSession session) {
		int goodsDetailId = 0;
		int pagenum = 1;
		int pageSize = 5;
		Date goods_starttime = null;
		Date goods_endtime = null;
		Date systemTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(pageNum!=null) {
			pagenum=pageNum.intValue();
			goodsDetailId = (Integer)session.getAttribute("MG_goodsdetailid");
			goods_starttime = (Date) session.getAttribute("MG_goodsstarttime");
			goods_endtime = (Date)session.getAttribute("MG_goodsendtime");
		}else{
			if(goods_detail_id!=null) {
				goodsDetailId=goods_detail_id.intValue();
			}
			try {
				if(starttime!=null&&!"".equals(starttime)){
					goods_starttime = sdf.parse(starttime);
				}
				if(endtime!=null&&!"".equals(endtime)){
					goods_endtime = sdf.parse(endtime);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		SecKillInfo secKillInfo = new SecKillInfo();
		secKillInfo.setSeckill_starttime(goods_starttime);
		secKillInfo.setSeckill_endtime(goods_endtime);
		secKillInfo.setSeckill_status(0);
		secKillInfo.setGoods_detail_id(goodsDetailId);
		Map<String,Object> map = mSecKillService.selectSecKill(secKillInfo,pageSize,pagenum);
		List<SecKillInfo> list = (List<SecKillInfo>) map.get("list");
		int maxPageNum = (int) map.get("maxPageNum");
		List isEdit = new ArrayList();
		for(SecKillInfo u : list){
			if(u.getSeckill_starttime().before(systemTime)){
					isEdit.add(1);
			}else {
				isEdit.add(0);
			}

		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("resultList",list);
		mav.addObject("isEdit",isEdit);
		mav.addObject("maxPageNum",maxPageNum);
		mav.addObject("MG_PageNum",pagenum);

		session.setAttribute("MG_goodsdetailid",goodsDetailId);
		session.setAttribute("MG_goodsendtime",goods_endtime);
		session.setAttribute("MG_goodsstarttime",goods_starttime);
		mav.setViewName("manageSecKill");
		return mav;

	}
	@RequestMapping("addSecKill")
	public String addSecKill(SecKillInfo secKillInfo,String starttime,String endtime) {//新增秒杀

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//System.out.println(secKillInfo.getSeckill_name());
		Date seckill_starttime = new Date();
		Date seckill_endtime = new Date();
		try {
			seckill_starttime = sdf.parse(starttime);
			seckill_endtime = sdf.parse(endtime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date systemTime = new Date();
		secKillInfo.setCreate_time(systemTime);
		secKillInfo.setSeckill_status(0);
		secKillInfo.setSeckill_starttime(seckill_starttime);
		secKillInfo.setSeckill_endtime(seckill_endtime);
		mSecKillService.addSecKill(secKillInfo);
		return "manageSecKill";
	}
	@RequestMapping("selectEditMSecKill")
	public ModelAndView selectEditMSecKillById(int seckill_id){//选出要修改的秒杀的信息
		SecKillInfo secKillInfo = mSecKillService.selectEditMSecKillById(seckill_id);
		GoodsDetail goodsDetail = mSecKillService.selectGoodsDetailById(secKillInfo.getGoods_detail_id());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editMSecKill");
		mav.addObject("goods_id",goodsDetail.getGoods_id());
		mav.addObject("result",secKillInfo);
		return mav;
	}


	@RequestMapping("editMSecKill")//修改秒杀
	public String editMSecKill(SecKillInfo secKillInfo,String starttime,String endtime,int seckill_num_ref){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date seckill_starttime = new Date();
		Date seckill_endtime = new Date();
		try {
			seckill_starttime = sdf.parse(starttime);
			seckill_endtime = sdf.parse(endtime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date systemTime = new Date();
		secKillInfo.setCreate_time(systemTime);
		secKillInfo.setSeckill_status(0);
		secKillInfo.setSeckill_starttime(seckill_starttime);
		secKillInfo.setSeckill_endtime(seckill_endtime);
		mSecKillService.updateMSecKill(secKillInfo,seckill_num_ref);
		return "manageSecKill";
	}
	@RequestMapping("deleteMSecKill")//删除秒杀
	public String deleteMSecKill(int seckill_id,int pageNum){
		mSecKillService.deleteMSecKill(seckill_id);

		return "redirect:selectSecKill.action?pageNum="+pageNum;
	}
	@RequestMapping("validate_seckill_num")//校验秒杀最大数量小于库存
	@ResponseBody
	public int validateSecKillNum(int seckill_num, int goods_detail_id){
		int result = mSecKillService.validateSecKillNum(seckill_num,goods_detail_id);
		return result;
	}
	@RequestMapping("validate_seckill_money")//校验秒杀价格小于原价
	@ResponseBody
	public int validateSecKillMoney(float seckill_money,int goods_detail_id){
		int result = mSecKillService.validateSecKillMoney(seckill_money,goods_detail_id);
		return result;
	}
}
