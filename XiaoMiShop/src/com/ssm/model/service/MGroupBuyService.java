package com.ssm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.dao.MGroupBuyDAO;

import java.util.List;

@Service
public class MGroupBuyService {
	
	@Autowired
	private MGroupBuyDAO mGroupBuyDAO;
	
	public void addGroupBuy(GroupBuyInfo groupBuyInfo) {
		mGroupBuyDAO.addGroupBuy(groupBuyInfo);
		
	}
	public List<Goods> getAllGoods()

}
