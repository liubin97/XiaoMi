package com.ssm.model.bean;

import java.util.Date;

public class CommentReply {
    private int comment_reply_id;
    private int goods_comment_id;
    private  String user_email;
    private String reply;
    private Date reply_date;
    private int reply_type;

    public int getComment_reply_id() {
        return comment_reply_id;
    }

    public void setComment_reply_id(int comment_reply_id) {
        this.comment_reply_id = comment_reply_id;
    }

    public int getGoods_comment_id() {
        return goods_comment_id;
    }

    public void setGoods_comment_id(int goods_comment_id) {
        this.goods_comment_id = goods_comment_id;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getReply_date() {
        return reply_date;
    }

    public void setReply_date(Date reply_date) {
        this.reply_date = reply_date;
    }

    public int getReply_type() {
        return reply_type;
    }

    public void setReply_type(int reply_type) {
        this.reply_type = reply_type;
    }
}
