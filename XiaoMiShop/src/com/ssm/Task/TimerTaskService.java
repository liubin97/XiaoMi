package com.ssm.Task;

import java.util.Date;
import java.util.TimerTask;

public class TimerTaskService extends TimerTask{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		Date date = new Date();
		System.out.println(date);
	}

}
