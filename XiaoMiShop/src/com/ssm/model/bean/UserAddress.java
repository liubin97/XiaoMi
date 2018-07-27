package com.ssm.model.bean;

public class UserAddress {
	private int address_id;
	private String recv_people;
	private String telephone;
	private String areaPath;
	private int zip_code;
	private String detail_address;
	private int isdefault;
	
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public String getRecv_people() {
		return recv_people;
	}
	public void setRecv_people(String recv_people) {
		this.recv_people = recv_people;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAreaPath() {
		return areaPath;
	}
	public void setAreaPath(String areaPath) {
		this.areaPath = areaPath;
	}
	public int getZip_code() {
		return zip_code;
	}
	public void setZip_code(int zip_code) {
		this.zip_code = zip_code;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public int getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(int isdefault) {
		this.isdefault = isdefault;
	}
}
