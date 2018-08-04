package com.ssm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.SimpleFormatter;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.model.bean.Admin;
import com.ssm.model.service.AdminService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("validateLogin.action")
	public String validateLogin(String admin_name, String admin_password, HttpSession session){
		int result = adminService.validateLogin(admin_name,admin_password);
		if(result == 0){
			session.setAttribute("admin_name",admin_name);
			return "forward:manageSecKill.jsp";
		}else {
			session.setAttribute("loginmsg","false");
			return "redirect:adminLogin.jsp";
		}

	}
	@RequestMapping("selectMonthInterest")
	@ResponseBody
	public float selectMonthInterest(String YearMonth){
		//int month_ref = sysmonth.intValue();
		float monthInterest = adminService.selectMonthInterest(YearMonth);
		return monthInterest;
	}
	@RequestMapping("selectTermInterest")
	@ResponseBody
	public float selectTermInterest(String YearMonth,String starttime){
		//int month_ref = sysmonth.intValue();
		float termInterest = adminService.selectTermInterest(YearMonth,starttime);
		return termInterest;
	}
	@RequestMapping("selectChartInterest")
	@ResponseBody
	public Map<String,List> selectChartInterest(String sysdate){
		/*List<Map<String,Object>> normal = adminService.selectNormalChartInterest(sysdate);
		List<Map<String,Object>> group = adminService.selectGroupChartInterest(sysdate);*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sysnow = null;
		try {
			sysnow = sdf.parse(sysdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<String> normalDate = new ArrayList<>();
		List<Float> normalValue = new ArrayList<>();
		List<String> groupDate = new ArrayList<>();
		List<Float> groupValue = new ArrayList<>();
		for(int i=1;i<8;i++){
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(sysnow);
			rightNow.add(Calendar.DAY_OF_MONTH,-i);//日期减i天
			Date dt1=rightNow.getTime();
			String reStr = sdf.format(dt1);
			Float normal = adminService.selectNormalChartInterest(reStr);
			Float group = adminService.selectGroupChartInterest(reStr);
			normalDate.add(reStr);
			normalValue.add(normal);
			groupDate.add(reStr);
			groupValue.add(group);
		}

		Map<String,List> map = new HashMap<>();
		map.put("normalDate",normalDate);
		map.put("normalValue",normalValue);
		map.put("groupDate",groupDate);
		map.put("groupValue",groupValue);
		return map;
	}
}
