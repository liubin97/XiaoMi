package com.ssm.model.enums;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-05 14:55
 **/
public enum CloseSeckillStateEnum {

    SUCCESS(1,"关闭成功"),
    UPDATE_SECKILLTABLE_ERRO(-1,"更新seckill异常"),
    UPDATE_STOCK_ERRO(-2,"更新库存异常"),
    INNER_ERRO(-3,"系统异常");

    private int state;

    private String stateInfo;

    CloseSeckillStateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
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

    //    更加id判断类型
    public static CloseSeckillStateEnum stateOf(int index){

        //迭代所有类型 values()拿到所有类型
        for(CloseSeckillStateEnum state : values()){

            if(state.getState() == index){
                return state;
            }
        }
        return null;
    }
}
