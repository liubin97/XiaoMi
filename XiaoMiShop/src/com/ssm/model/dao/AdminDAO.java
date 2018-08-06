package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.Admin;

public interface AdminDAO {
	public List<Admin> selectAdmin(Admin admin);

    float selectMonthInterest(String YearMonth);

    float selectTermInterest(Map<String,Object> map);

    Float selectNormalChartInterest(String sysdate);

    Float selectGroupChartInterest(String sysdate);

    Float selectGoodsSum(String yearMonth);

    int selectYearGoodsSum(Map<String,Object> map);
}
