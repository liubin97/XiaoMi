package com.ssm.model.enums;

/**
 * 使用枚举类型标识常量字段
 * @program: sec_kill_demo
 * @author: Xie Dong
 * @create: 2018-07-23 21:36
 **/
public enum  SeckillStateEnum {
    SUCCESS(1,"秒杀成功"),
    END(0,"秒杀结束"),
    REPEAT_KILL(-1,"重复秒杀"),
    INNER_ERRO(-2,"系统异常"),
    DATA_REWRITE(-3,"数据篡改");

    private int state;

    private String stateInfo;

    SeckillStateEnum(int state, String stateInfo) {
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
    public static SeckillStateEnum stateOf(int index){

        //迭代所有类型 values()拿到所有类型
        for(SeckillStateEnum state : values()){

            if(state.getState() == index){
                return state;
            }
        }
        return null;
    }
}
