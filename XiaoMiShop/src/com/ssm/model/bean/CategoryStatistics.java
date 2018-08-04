package com.ssm.model.bean;

import java.util.List;

public class CategoryStatistics {
	private String category_name;
	private List<Statistics> statisticsList;
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public List<Statistics> getStatisticsList() {
		return statisticsList;
	}
	public void setStatisticsList(List<Statistics> statisticsList) {
		this.statisticsList = statisticsList;
	}
	
}
