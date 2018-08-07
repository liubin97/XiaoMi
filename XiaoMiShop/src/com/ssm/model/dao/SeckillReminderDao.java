package com.ssm.model.dao;

import com.ssm.model.bean.SeckillReminder;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 11:09
 **/
public interface SeckillReminderDao {

    /**
     * 增加提醒
     * @param paramMap
     * @return
     */
    public void addReminder(Map<String,Object> paramMap);

    /**
     * 根据时间批量获取用户
     * @param nowdate
     * @return
     */
    public List<SeckillReminder> getReminderByTime(Date nowdate);


//    public int  addReminderbyhand(SeckillReminder seckillReminder);

}
