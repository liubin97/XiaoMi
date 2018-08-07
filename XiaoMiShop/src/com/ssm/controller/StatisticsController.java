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
	@RequestMapping("getStatistics")
	public @ResponseBody List<CategoryStatistics> getStatistics(){
		
		return statisticsService.getStatistics();
	}
	@RequestMapping("getAllNum")
	public @ResponseBody List<Statistics> getAllNum(String date){
		return statisticsService.getAllNum(date);
	}
	@RequestMapping("getAllMouth")
	public @ResponseBody String[] getAllMouth(){
		return statisticsService.getAllMouth();
	} 
	@RequestMapping("getGoodsDataByCategoryId")
	public @ResponseBody List<Statistics> getGoodsDataByCategoryId(Integer categoryId,String date){
		if(categoryId==0){
			return statisticsService.getAllNum(date);
		}
		List<Statistics> statisticsList = statisticsService.getGoodsDataByCategoryId(categoryId,date);
		return statisticsList;
	}
	@RequestMapping("getKindDataByGoodsId")
	public @ResponseBody List<Statistics> getKindDataByGoodsId(Integer goodsId,String date){
		List<Statistics> statisticsList = statisticsService.getKindDataByGoodsId(goodsId,date);
		return statisticsList;
	}
	@RequestMapping("getColorDataByKind")
	public @ResponseBody List<Statistics> getColorDataByKind(Integer goodsId,String date,String kind){
		List<Statistics> statisticsList = statisticsService.getColorDataByKind(goodsId,date,kind);
		return statisticsList;
	}
}
