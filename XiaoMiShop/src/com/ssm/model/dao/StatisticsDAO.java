package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.Statistics;

public interface StatisticsDAO {
	public List<Statistics> getStatistics();
	public List<Statistics> getAllNum();
	public String[] getCategoryName();
}
