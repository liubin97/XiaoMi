package com.ssm.utils;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 22:17
 **/
public class JobQuartz extends QuartzJobBean {

    @Override
    protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        System.out.println(sdf.format(new Date()));

    }
}