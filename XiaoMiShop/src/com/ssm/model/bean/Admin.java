package com.ssm.model.bean;

public class Admin {
	private int admin_id;
	private String admin_name;
	private String admin_password;
	private int admin_type;
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public int getAdmin_type() {
		return admin_type;
	}
	public void setAdmin_type(int admin_type) {
		this.admin_type = admin_type;
	}
	

}
