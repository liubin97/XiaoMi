package com.ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	//获取过去第几天的日期
	public static String getPastDate(int past){
		 	Calendar calendar = Calendar.getInstance();  
	       calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);  
	       Date today = calendar.getTime();  
	       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	       String result = format.format(today);  
	       return result;  
	}
}
