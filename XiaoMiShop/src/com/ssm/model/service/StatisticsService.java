package com.ssm.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.CategoryStatistics;
import com.ssm.model.bean.DataStatement;
import com.ssm.model.bean.Statistics;
import com.ssm.model.dao.StatisticsDAO;
import com.ssm.utils.DateUtil;
@Service
public class StatisticsService {
	@Autowired
	private StatisticsDAO statisticsDAO;
	//处理从数据库获取到的数据
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
	public List<Statistics> getAllNum(String date){
		List<Statistics> statisticsList = statisticsDAO.getAllNum(date);
		return statisticsList;
	}
	public String[] getAllMouth() {
		/*List<Date> dateList= statisticsDAO.getAllMouth();
		String[] date = new String[dateList.size()];
		for(int i = 0;i<date.length;i++){
			date[i] = dateList.get(i).toString();
		}*/
		return statisticsDAO.getAllMouth();
	}
	public List<Statistics> getGoodsDataByCategoryId(Integer categoryId,
			String date) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goods_category_id", categoryId);
		map.put("date", date);
		List<Statistics> statisticsList = statisticsDAO.getGoodsDataByCategoryId(map);
		return statisticsList;
	}
	public List<Statistics> getKindDataByGoodsId(Integer goodsId, String date) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goods_id", goodsId);
		map.put("date", date);
		return statisticsDAO.getKindDataByGoodsId(map);
	}
	public List<Statistics> getColorDataByKind(DataStatement statement) {
		
		return statisticsDAO.getColorDataByKind(statement);
	}
	
	
}
