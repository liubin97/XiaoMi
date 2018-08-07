package com.ssm.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ssm.model.bean.Statistics;

public interface StatisticsDAO {
	public List<Statistics> getStatistics();
	public List<Statistics> getAllNum(@Param(value="date") String date);
	public String[] getCategoryName();
	public String[] getAllMouth();
	public List<Statistics> getGoodsDataByCategoryId(Map<String, Object> map);
	public List<Statistics> getKindDataByGoodsId(Map<String, Object> map);
	public List<Statistics> getColorDataByKind(Map<String, Object> map);
}
