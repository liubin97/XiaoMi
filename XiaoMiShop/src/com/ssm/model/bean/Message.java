package com.ssm.model.bean;

import java.util.Date;

public class Message {
	private int message_id;
	private String user_email;
	private String message_title;
	private String message_text;
	private int message_type;
	private Date send_date;
	private int read_flag;
	public int getMessage_id() {
		return message_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public String getMessage_title() {
		return message_title;
	}
	public String getMessage_text() {
		return message_text;
	}
	public int getMessage_type() {
		return message_type;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public int getRead_flag() {
		return read_flag;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public void setMessage_text(String message_text) {
		this.message_text = message_text;
	}
	public void setMessage_type(int message_type) {
		this.message_type = message_type;
	}
	public void setRead_flag(int read_flag) {
		this.read_flag = read_flag;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

}
