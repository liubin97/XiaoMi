package com.ssm.model.vo;

import java.util.Date;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-01 13:39
 **/
public class DateList {

   private Date start_time;
   private Date end_time;

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    @Override
    public String toString() {
        return "DateList{" +
                "start_time=" + start_time +
                ", end_time=" + end_time +
                '}';
    }
}
