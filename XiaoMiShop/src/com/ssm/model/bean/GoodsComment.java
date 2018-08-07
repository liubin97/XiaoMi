package com.ssm.model.bean;

import java.util.Date;
import java.util.List;

public class GoodsComment {
    private int goods_comment_id;
    private String user_email;
    private int goods_id;
    private String comment;
    private Date comment_date;
    private int comment_level;
    private int like_num;
    private User user;
    private List<CommentPicture> commentPictureList;
    private List<CommentReply> commentReplyList;

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

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public int getComment_level() {
        return comment_level;
    }

    public void setComment_level(int comment_level) {
        this.comment_level = comment_level;
    }

    public int getLike_num() {
        return like_num;
    }

    public void setLike_num(int like_num) {
        this.like_num = like_num;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<CommentPicture> getCommentPictureList() {
        return commentPictureList;
    }

    public void setCommentPictureList(List<CommentPicture> commentPictureList) {
        this.commentPictureList = commentPictureList;
    }

    public List<CommentReply> getCommentReplyList() {
        return commentReplyList;
    }

    public void setCommentReplyList(List<CommentReply> commentReplyList) {
        this.commentReplyList = commentReplyList;
    }
}
