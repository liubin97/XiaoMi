package com.ssm.model.dao;

import com.ssm.model.bean.SeckillReminder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 11:10
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-dao.xml"})
public class SeckillReminderDaoTest {

    //注入Dao实现类依赖
    @Resource
    private SeckillReminderDao reminderDao;

//    @Test
//    public void addReminder() {
//
//        int secId = 2;
//        String email = "xdmango@qq.com";
////        "2018-08-06 10:00:00"
//
//        Date now = new Date();
//        SeckillReminder seckillReminder = new com.ssm.model.bean.SeckillReminder();
//        seckillReminder.setSeckill_id(secId);
//        seckillReminder.setUser_email(email);
//        seckillReminder.setGoods_name("小米10");
//        seckillReminder.setReminder_starttime(now);
//        System.out.println(seckillReminder.toString());
//        int result = reminderDao.addReminderbyhand(seckillReminder);
//        System.out.println("----------------------------------------");
//        System.out.println("插入结果:"+result);
//    }

    @Test
    public void getReminderByTime() {

        Date now = new Date();
        System.out.println("now:"+now);
        List<SeckillReminder> seckillReminders = reminderDao.getReminderByTime(now);
        for(SeckillReminder s:seckillReminders){
            System.out.println(s.toString());
        }

    }
}