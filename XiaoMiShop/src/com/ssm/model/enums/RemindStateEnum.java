package com.ssm.model.enums;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 10:15
 **/
public enum RemindStateEnum {

    SUCCESS(1,"设置成功"),
    REPEAT(0,"重复提醒"),
    CLOSE(-1,"开团10min无法设置提醒"),
    INNER_ERRO(-2,"系统错误");

    private int state;

    private String stateInfo;

    RemindStateEnum(int state, String stateInfo) {
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
    public static RemindStateEnum stateOf(int index){

        //迭代所有类型 values()拿到所有类型
        for(RemindStateEnum state : values()){

            if(state.getState() == index){
                return state;
            }
        }
        return null;
    }
}
