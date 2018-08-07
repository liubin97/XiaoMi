package com.ssm.Task;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ssm.model.service.ScheduledTaskService;

@Component
public class ScheduleTask {
	@Autowired
	ScheduledTaskService scheduledTaskService;
	
	@Scheduled(cron = "0 0 0/1 * * ? ") // 间隔5秒执行
    public void taskCycle() {
        System.out.println("开始执行结算到时间的团购，执行时间为:"+new Date());
        
        scheduledTaskService.autoRun();
    }
}