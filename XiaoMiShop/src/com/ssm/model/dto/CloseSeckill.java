package com.ssm.model.dto;

import com.ssm.model.enums.CloseSeckillStateEnum;
import com.ssm.model.enums.SeckillStateEnum;

/**
 * 封装更新是否成功
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-05 15:01
 **/
public class CloseSeckill {

    //是否成功
    private boolean success;

    //状态信息
    private String stateInfo;

    public CloseSeckill(boolean success, CloseSeckillStateEnum closeSeckillStateEnum) {
        this.success = success;
        this.stateInfo = closeSeckillStateEnum.getStateInfo();
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
        return "CloseSeckill{" +
                "success=" + success +
                ", stateInfo='" + stateInfo + '\'' +
                '}';
    }
}
