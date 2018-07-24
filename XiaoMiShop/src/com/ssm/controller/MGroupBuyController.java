package com.ssm.controller;

import com.ssm.model.bean.GoodsDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.service.MGroupBuyService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


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
	@RequestBody
	public List<Goods> getAllGoods(){
		List<Goods> list = mGroupBuyService.getAllGoods();
		return list;
	}
}
