package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.model.bean.CategoryStatistics;
import com.ssm.model.bean.Statistics;
import com.ssm.model.service.StatisticsService;
@Controller
public class StatisticsController {
	@Autowired
	private StatisticsService statisticsService;
	@RequestMapping("getStatustics")
	public @ResponseBody List<CategoryStatistics> getStatistics(){
		
		return statisticsService.getStatistics();
	}
	@RequestMapping("getAllNum")
	public @ResponseBody List<Statistics> getAllNum(){
		return statisticsService.getAllNum();
	}
}
