package com.ssm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Admin;
import com.ssm.model.dao.AdminDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDao;
	
	public List<Admin> selectAdmin(){
		return adminDao.selectAdmin();
		
	}
	
}
