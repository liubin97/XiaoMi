package com.ssm.model.dto;

/**
 * @program: sec_kill_demo
 * @author: Xie Dong
 * @create: 2018-07-24 19:58
 **/
//为什么是泛型-----答：需要一个VO来封装数据结果(Json)
//所有ajax返回结果的返回类型
public class SeckillResult<T> {

    private boolean success; //秒杀状态

    private T data;

    private String error;



    public SeckillResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    public SeckillResult(boolean success, String error) {
        this.success = success;
        this.error = error;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
