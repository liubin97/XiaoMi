package com.ssm.model.bean;

public class Favorites {
    private int favorites_id;
    private String user_email;
    private int goods_id;
    private int favorites_status;

    public int getFavorites_id() {
        return favorites_id;
    }

    public void setFavorites_id(int favorites_id) {
        this.favorites_id = favorites_id;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public int getFavorites_status() {
        return favorites_status;
    }

    public void setFavorites_status(int favorites_status) {
        this.favorites_status = favorites_status;
    }
}
