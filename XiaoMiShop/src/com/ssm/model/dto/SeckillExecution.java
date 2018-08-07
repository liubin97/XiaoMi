package com.ssm.model.dto;

import com.ssm.model.bean.SuccessKilled;
import com.ssm.model.enums.SeckillStateEnum;

/**
 * 封装秒杀执行后的结果
 * @program: sec_kill_demo
 * @author: Xie Dong
 * @create: 2018-07-23 20:05
 **/
public class SeckillExecution {

    private int seckillId;

    //秒杀执行结果状态
    private int state;

    //状态的标识
    private String stateInfo;

    //秒杀成功对象
    private SuccessKilled successKilled;

    //成功的构造方法
    public SeckillExecution(int seckillId, SeckillStateEnum seckillStateEnum, SuccessKilled successKilled) {
        this.seckillId = seckillId;
        this.state = seckillStateEnum.getState();
        this.stateInfo = seckillStateEnum.getStateInfo();
        this.successKilled = successKilled;
    }

    //失败的构造方法
    public SeckillExecution(int seckillId, SeckillStateEnum seckillStateEnum) {
        this.seckillId = seckillId;
        this.state = seckillStateEnum.getState();
        this.stateInfo = seckillStateEnum.getStateInfo();
    }

    public int getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(int seckillId) {
        this.seckillId = seckillId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public SuccessKilled getSuccessKilled() {
        return successKilled;
    }

    public void setSuccessKilled(SuccessKilled successKilled) {
        this.successKilled = successKilled;
    }

    @Override
    public String toString() {
        return "SeckillExecution{" +
                "seckillId=" + seckillId +
                ", state=" + state +
                ", stateInfo='" + stateInfo + '\'' +
                ", successKilled=" + successKilled +
                '}';
    }
}