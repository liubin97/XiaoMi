package com.ssm.utils;


import org.apache.log4j.Logger;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.util.Properties;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 21:34
 **/
public class SendMail {

    private static final Logger LOG = Logger.getLogger(SendMail.class);
    private String host = ""; // smtp服务器
    private String from = ""; // 发件人地址
    private String[] to; // 收件人地址是一个数组
    private String user = ""; // 用户名
    private String pwd = ""; // 密码
    private String subject = ""; // 邮件标题
    private int status = 0; // 发送结果：0-成功，1-失败
    private String Content = ""; //若果发送的是html格式的邮件，这是html内容

    private static final Logger logger = Logger.getLogger(SendMail.class);

    public void setAddress(String from, String[] to, String subject) {
        this.from = from;
        this.to = to;
        this.subject = subject;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }
    public int sendMail(String user, String pwd, String host) {
        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port","25");
        prop.put("mail.transport.protocol", "smtp");

        // 2. 根据配置创建会话对象, 用于和邮件服务器交互

        Session session = Session.getInstance(prop);
        session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
        try {
            //设置发件人地址
            message.setFrom(new InternetAddress(from));
            //设置收件人地址
            int len=to.length;//设置收件人的个数
            InternetAddress address[]=new InternetAddress[len];
            for (int i = 0; i < to.length; i++) {
                address[i]=new InternetAddress(to[i]);
            }
            message.addRecipients(Message.RecipientType.TO, address); //设置邮件接收方

            //设置邮件标题
            message.setSubject(subject);
//            Multipart mp = new MimeMultipart();
//            // 设置邮件的文本内容
//            BodyPart bodyPart = new MimeBodyPart();
//            //邮件正文（html形式
//            bodyPart.setContent(htmlContent, "text/html; charset=utf-8");
//            mp.addBodyPart(bodyPart);
            message.setContent(Content,"text/html;charset=UTF-8");
            message.saveChanges();
            //创建Transport对象
            Transport transport = session.getTransport("smtp");
            //连接服务器
            transport.connect(host, user, pwd);

            //发送邮件
            transport.sendMessage(message, message.getAllRecipients());
            System.out.println("Sent message successfully....from xd");
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
//            logger.error("发送失败！");
            status=1;
            System.out.println("在sendMail里面!!发送失败!!");
        }
        return status;
    }


}
