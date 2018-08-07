package com.ssm.model.dto;

/**
 * 暴露秒杀地址DTO
 * @program: sec_kill_demo
 * @author: Xie Dong
 * @create: 2018-07-23 19:40
 **/
public class Exposer {

    //是否开启秒杀
    private boolean exposed;

    //md5加密
    private String md5;

    //秒杀活动id
    private int seckillId;

    //系统当前时间，根据java api Date的getTime()的返回值是long类型（因为很大）
    //单位（毫秒）
    private long now;

    //开始时间
    private long start;
    //结束时间
    private long end;

    //是否开启md5 seckillID
    public Exposer(boolean exposed, String md5, int seckillId) {
        this.exposed = exposed;
        this.md5 = md5;
        this.seckillId = seckillId;
    }

    //是否开启当前系统时间，开始时间、结束时间
    public Exposer(boolean exposed, int seckillId, long now, long start, long end) {
        this.exposed = exposed;
        this.seckillId = seckillId;
        this.now = now;
        this.start = start;
        this.end = end;
    }

    //是否开启id
    public Exposer(boolean exposed, int seckillId) {
        this.exposed = exposed;
        this.seckillId = seckillId;
    }

    public boolean isExposed() {
        return exposed;
    }

    public void setExposed(boolean exposed) {
        this.exposed = exposed;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public int getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(int seckillId) {
        this.seckillId = seckillId;
    }

    public long getNow() {
        return now;
    }

    public void setNow(long now) {
        this.now = now;
    }

    public long getStart() {
        return start;
    }

    public void setStart(long start) {
        this.start = start;
    }

    public long getEnd() {
        return end;
    }

    public void setEnd(long end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "Exposer{" +
                "exposed=" + exposed +
                ", md5='" + md5 + '\'' +
                ", seckillId=" + seckillId +
                ", now=" + now +
                ", start=" + start +
                ", end=" + end +
                '}';
    }
}