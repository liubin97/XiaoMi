package com.ssm.model.bean;

public class CommentPicture {
    private int comment_picture_id;
    private int goods_comment_id;
    private int comment_id;
    private String picture_url;

    public int getComment_picture_id() {
        return comment_picture_id;
    }

    public void setComment_picture_id(int comment_picture_id) {
        this.comment_picture_id = comment_picture_id;
    }

    public int getGoods_comment_id() {
        return goods_comment_id;
    }

    public void setGoods_comment_id(int goods_comment_id) {
        this.goods_comment_id = goods_comment_id;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getPicture_url() {
        return picture_url;
    }

    public void setPicture_url(String picture_url) {
        this.picture_url = picture_url;
    }
}
