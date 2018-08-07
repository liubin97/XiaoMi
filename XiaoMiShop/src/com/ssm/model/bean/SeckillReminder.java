package com.ssm.model.bean;

import java.util.Date;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 15:45
 **/
public class SeckillReminder {

    private int seckill_id;
    private  String goods_name;
    private String user_email;
    private Date reminder_starttime;
    private int reminder_status;
    private String nickname;


    public int getSeckill_id() {
        return seckill_id;
    }

    public void setSeckill_id(int seckill_id) {
        this.seckill_id = seckill_id;
    }


    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public Date getReminder_starttime() {
        return reminder_starttime;
    }

    public void setReminder_starttime(Date reminder_starttime) {
        this.reminder_starttime = reminder_starttime;
    }

    public int getReminder_status() {
        return reminder_status;
    }

    public void setReminder_status(int reminder_status) {
        this.reminder_status = reminder_status;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "SeckillReminder{" +
                "seckill_id=" + seckill_id +
                ", goods_name='" + goods_name + '\'' +
                ", user_email='" + user_email + '\'' +
                ", reminder_starttime=" + reminder_starttime +
                ", reminder_status=" + reminder_status +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
