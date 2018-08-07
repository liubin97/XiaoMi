package com.ssm.model.dto;

import com.ssm.model.enums.RemindStateEnum;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 09:57
 **/
public class Remind {

    //是否成功
    private boolean success;

    //状态信息
    private String stateInfo;

    public Remind(boolean success, RemindStateEnum remindStateEnum) {
        this.success = success;
        this.stateInfo = remindStateEnum.getStateInfo();
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    @Override
    public String toString() {
        return "Remind{" +
                "success=" + success +
                ", stateInfo='" + stateInfo + '\'' +
                '}';
    }
}
