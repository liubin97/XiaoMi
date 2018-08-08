package com.ssm.utils;

import java.util.regex.Pattern;

public class CheckUtil {
	public static boolean TestPrice(String amount) {
		boolean flag = false;
		Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$");
		if(pattern.matcher(amount).matches()){
			flag = true;
		}
		return flag;
	}
}
