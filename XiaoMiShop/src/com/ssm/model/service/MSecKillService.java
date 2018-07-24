package com.ssm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.SecKillInfo;
import com.ssm.model.dao.MSecKillDAO;

@Service
public class MSecKillService {
	@Autowired
	private MSecKillDAO mSecKillDAO;
	
	public void addSecKill(SecKillInfo secKillInfo) {
		mSecKillDAO.addSecKill();
	}
}
