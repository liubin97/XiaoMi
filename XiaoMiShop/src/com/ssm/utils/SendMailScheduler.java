package com.ssm.utils;

import com.ssm.model.bean.SeckillReminder;
import com.ssm.model.dao.SeckillDao;
import com.ssm.model.dao.SeckillReminderDao;
import com.ssm.model.vo.DateList;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**Quartz发送邮件类
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 21:31
 **/
public class SendMailScheduler {

    private static final Logger LOG = Logger.getLogger(SendMailScheduler.class);

    @Autowired
    private SeckillReminderDao seckillReminderDao;

    public void work() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        LOG.debug(sdf.format(new Date()));
        SendMail sendmail = new SendMail();
        String[] to=null;
        //业务开始

        // 从数据那该发送的用户的邮箱
        Date now = new Date();
        //查询数据
        List<SeckillReminder> seckillReminders = seckillReminderDao.getReminderByTime(now);
        //打印以方便检查
        System.out.println(seckillReminders.toString());
        if(seckillReminders.size()==0){
            System.out.println("没有要发送的客户");
        }else {
            to = new String[seckillReminders.size()];
            for(int i =0;i<seckillReminders.size();i++){
                to[i] = seckillReminders.get(i).getUser_email();
            }
            System.out.println(to);
        }


        //设置发件地址和收件地址及主题
        sendmail.setAddress("xiaomimall@sohu.com",to, "童鞋，秒杀要开始了！");
        //进行业务逻辑


        //设置Context内容
        StringBuffer content = new StringBuffer();

        content.append("<!doctype html><html ><head ><meta content='text/html';charset='utf-8'>");
        content.append("</head><body>");
        content.append(" <h1 >亲爱的童鞋，你的订阅秒杀要开始了</h1>");
        content.append(" <p>你想要的商品的秒杀活动快开始了，ps：记得提前登陆哦</p>");
        content.append("<a href='http://10.25.49.13:8080/seckill/list'> <button>点击快速进入</button></a>");
        content.append("</body>");
        content.append("</html>");
        sendmail.setContent(content.toString());
        //调用发送邮件方法
        int status = sendmail.sendMail("xiaomimall@sohu.com", "taka10969", "smtp.sohu.com");
        if (status == 1) {
            System.out.println("在Scheduler里面!!发送失败!!");
//            LOG.error("发送失败");
        } else {
//            LOG.info("发送成功");
            System.out.println("在Scheduler里面!!发送成功!!");

        }
    }


}
