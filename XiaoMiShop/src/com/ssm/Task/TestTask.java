package com.ssm.Task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TestTask {
    @Scheduled(cron = "0/5 * * * * ? ") // 间隔5秒执行
    public void taskCycle() {
        System.out.println("使用SpringMVC框架配置定时任务");
    }
}