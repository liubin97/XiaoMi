package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.service.MGroupBuyService;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MGroupBuyController {
	@Autowired
	private MGroupBuyService mGroupBuyService;	

	@RequestMapping("addGroupBuy")
	public String addGroupBuy(GroupBuyInfo groupBuyInfo) {
		mGroupBuyService.addGroupBuy(groupBuyInfo);
		return "manageGroupBuying";
	}
	@RequestMapping("getAllGoods")
	public 
}
