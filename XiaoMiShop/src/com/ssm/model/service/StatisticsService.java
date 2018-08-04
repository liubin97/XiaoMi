package com.ssm.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.CategoryStatistics;
import com.ssm.model.bean.Statistics;
import com.ssm.model.dao.StatisticsDAO;
import com.ssm.utils.DateUtil;
@Service
public class StatisticsService {
	@Autowired
	private StatisticsDAO statisticsDAO;
	
	public List<CategoryStatistics> getStatistics(){
		//最近7天
		int size = 7;
		String[] weekDate = new String[size];
		for(int i = 0;i<size;i++){
			weekDate[i] = DateUtil.getPastDate(size-i-1);
		}
		
		List<Statistics> statisticsList = statisticsDAO.getStatistics();
		String[] categoryNameList =  statisticsDAO.getCategoryName();
		List<CategoryStatistics> categoryStatisticList = new ArrayList<CategoryStatistics>();
		for(int i = 0 ;i < categoryNameList.length;i++){
			CategoryStatistics categoryStatistic = new CategoryStatistics();
			categoryStatistic.setCategory_name(categoryNameList[i]);
			List<Statistics> categoryStatisticsList = new ArrayList<Statistics>();
			for(int j = 0;j < size;j++){
				Statistics statistics = new Statistics();
				statistics.setDate(weekDate[j]);
				int number = 0;
				for(int k = 0;k < statisticsList.size();k++){
					if(statisticsList.get(k).getDate()==null||"".equals(statisticsList.get(k).getDate())){
						continue;
					}
					if(statisticsList.get(k).getCategory_name().equals(categoryStatistic.getCategory_name())
							&&statisticsList.get(k).getDate().equals(statistics.getDate())){
						number = statisticsList.get(k).getNumber();
						statisticsList.remove(k);
						break;
					}
				}
				statistics.setNumber(number);
				categoryStatisticsList.add(statistics);
			}
			categoryStatistic.setStatisticsList(categoryStatisticsList);
			categoryStatisticList.add(categoryStatistic);
		}
		
		
 		return categoryStatisticList;
	}
	public List<Statistics> getAllNum(){
		List<Statistics> statisticsList = statisticsDAO.getAllNum();
		return statisticsList;
	}
	
}
