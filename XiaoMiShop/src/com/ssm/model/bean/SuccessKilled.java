package com.ssm.model.bean;

import java.util.Date;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:13
 **/
public class SuccessKilled {

    private int seckill_id;
    private String email;
    private int state;
    private Date create_time;

    //多对一,一个秒杀对应的是多条记录
    private SeckillDetail seckillDetail;

    public int getSeckill_id() {
        return seckill_id;
    }

    public void setSeckill_id(int seckill_id) {
        this.seckill_id = seckill_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public SeckillDetail getSeckillDetail() {
        return seckillDetail;
    }

    public void setSeckillDetail(SeckillDetail seckillDetail) {
        this.seckillDetail = seckillDetail;
    }

    @Override
    public String toString() {
        return "SuccessKilled{" +
                "seckill_id=" + seckill_id +
                ", email='" + email + '\'' +
                ", state=" + state +
                ", create_time=" + create_time +
                ", seckillDetail=" + seckillDetail +
                '}';
    }

}
