package com.ssm.model.bean;

import java.util.List;

public class OrderInfo {
    private List<OrderItem> orderItems;
    private int address_id;
    private int goods_num;
    private float sum_money;
    private int [] cart_ids;

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(int goods_num) {
        this.goods_num = goods_num;
    }

    public float getSum_money() {
        return sum_money;
    }

    public void setSum_money(float sum_money) {
        this.sum_money = sum_money;
    }

    public int[] getCart_ids() {
        return cart_ids;
    }

    public void setCart_ids(int[] cart_ids) {
        this.cart_ids = cart_ids;
    }
}
