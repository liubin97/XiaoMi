package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.model.bean.SecKillInfo;
import com.ssm.model.service.MSecKillService;

@Controller
public class MSecKillController {
	@Autowired
	private MSecKillService mSecKillService;
	
	
	@RequestMapping("selectSecKill")
	public ModelAndView selectSecKill(Integer goods_id,Integer pageNum) {
		int goodsId = 0;
		int pagenum = 0;
		if(goods_id!=null) {
			goodsId=goods_id.intValue();
		}
		if(pageNum!=null) {
			pagenum=pageNum.intValue();
		}
		return null;
	}
	@RequestMapping("addSecKill")
	public String addSecKill(SecKillInfo secKillInfo) {
		mSecKillService.addSecKill(secKillInfo);
		return "manageSecKill";
	}
}
