package com.ssm.Task;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class TimerManager {
	private static final long PERIOD_DAY = 60 * 1000;
    public TimerManager() {
//        Calendar calendar = Calendar.getInstance();

        //定制每日12:30:30执行
//        calendar.set(Calendar.HOUR_OF_DAY, 12);
//        calendar.set(Calendar.MINUTE, 30);
//        calendar.set(Calendar.SECOND, 30);

        Date date = new Date();     //第一次执行定时任务的时间
        //如果当前时间已经过去所定时的时间点，则在第二天时间点开始执行
//        if (date.before(new Date())) {
//            date = this.addDay(date, 1);
//        }
        Timer timer = new Timer();
        TimerTaskService task = new TimerTaskService();
        //安排指定的任务在指定的时间开始进行重复的固定延迟执行。
        timer.schedule(task, date, PERIOD_DAY);
    }

    // 增加或减少天数
    private Date addDay(Date date, int num) {
        Calendar startDT = Calendar.getInstance();
        startDT.setTime(date);
        startDT.add(Calendar.DAY_OF_MONTH, num);
        return startDT.getTime();
    }
}
