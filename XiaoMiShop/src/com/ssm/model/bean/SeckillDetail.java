package com.ssm.model.bean;

import java.util.Date;
import java.util.List;

/**
 * 对应seckill_detail
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 20:29
 **/
public class SeckillDetail {

    private int seckill_id;
    private String seckill_name;
    private int seckill_num;
    private Date seckill_starttime;
    private Date seckill_endtime;
    private Date create_time;
    private float seckill_money;
    private int seckill_status;
    private int goods_detail_id;
    private String kind; //产品类型
    private String color;
    private float prime_price;//原价
    private String goods_name;
    private String goods_desc_pic_url;//产品图片url
    private List<GoodsPicture> goodsPictureList;


    public int getGoods_detail_id() {
        return goods_detail_id;
    }

    public void setGoods_detail_id(int goods_detail_id) {
        this.goods_detail_id = goods_detail_id;
    }

    public List<GoodsPicture> getGoodsPictureList() {
        return goodsPictureList;
    }

    public void setGoodsPictureList(List<GoodsPicture> goodsPictureList) {
        this.goodsPictureList = goodsPictureList;
    }

    public int getSeckill_id() {
        return seckill_id;
    }

    public void setSeckill_id(int seckill_id) {
        this.seckill_id = seckill_id;
    }

    public String getSeckill_name() {
        return seckill_name;
    }

    public void setSeckill_name(String seckill_name) {
        this.seckill_name = seckill_name;
    }

    public int getSeckill_num() {
        return seckill_num;
    }

    public void setSeckill_num(int seckill_num) {
        this.seckill_num = seckill_num;
    }

    public Date getSeckill_starttime() {
        return seckill_starttime;
    }

    public void setSeckill_starttime(Date seckill_starttime) {
        this.seckill_starttime = seckill_starttime;
    }

    public Date getSeckill_endtime() {
        return seckill_endtime;
    }

    public void setSeckill_endtime(Date seckill_endtime) {
        this.seckill_endtime = seckill_endtime;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public float getSeckill_money() {
        return seckill_money;
    }

    public void setSeckill_money(float seckill_money) {
        this.seckill_money = seckill_money;
    }

    public int getSeckill_status() {
        return seckill_status;
    }

    public void setSeckill_status(int seckill_status) {
        this.seckill_status = seckill_status;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getPrime_price() {
        return prime_price;
    }

    public void setPrime_price(float prime_price) {
        this.prime_price = prime_price;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }


    public String getGoods_desc_pic_url() {
        return goods_desc_pic_url;
    }

    public void setGoods_desc_pic_url(String goods_desc_pic_url) {
        this.goods_desc_pic_url = goods_desc_pic_url;
    }

    @Override
    public String toString() {
        return "SeckillDetail{" +
                "seckill_id=" + seckill_id +
                ", seckill_name='" + seckill_name + '\'' +
                ", seckill_num=" + seckill_num +
                ", seckill_starttime=" + seckill_starttime +
                ", seckill_endtime=" + seckill_endtime +
                ", create_time=" + create_time +
                ", seckill_money=" + seckill_money +
                ", seckill_status=" + seckill_status +
                ", goods_detail_id=" + goods_detail_id +
                ", kind='" + kind + '\'' +
                ", color='" + color + '\'' +
                ", prime_price=" + prime_price +
                ", goods_name='" + goods_name + '\'' +
                ", goods_desc_pic_url='" + goods_desc_pic_url + '\'' +
                ", goodsPictureList=" + goodsPictureList +
                '}';
    }
}
