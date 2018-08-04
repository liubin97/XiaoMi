package com.ssm.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public float selectMonthInterest(String YearMonth) {
    	float monthInterest = adminDao.selectMonthInterest(YearMonth);
    	return monthInterest;
    }

	public float selectTermInterest(String yearMonth, String starttime) {
		Map<String,Object> map =new HashMap<>();
		map.put("yearMonth",yearMonth);
		map.put("starttime",starttime);
    	float termInterest = adminDao.selectTermInterest(map);
    	return termInterest;
	}

	public Float selectNormalChartInterest(String sysdate) {
		Float normal = adminDao.selectNormalChartInterest(sysdate);
    	return normal;
	}

	public Float selectGroupChartInterest(String sysdate) {
		Float group = adminDao.selectGroupChartInterest(sysdate);
    	return group;
	}
}
