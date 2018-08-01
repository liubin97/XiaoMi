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
	


    public int validateLogin(String admin_name, String admin_password) {
		Admin admin = new Admin();
		admin.setAdmin_name(admin_name);
		admin.setAdmin_password(admin_password);
		List<Admin> list = adminDao.selectAdmin(admin);
		if(list.size()!=0){
			return 0;
		}else {
			return 1;
		}
    }
}
