package com.ssm.model.bean;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-03 13:58
 **/
public class Address {

    private int address_id;
    private String user_email;
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

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
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

    public void setZip_code(int zip_codde) {
        this.zip_code = zip_codde;
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

    @Override
    public String toString() {
        return "Address{" +
                "address_id=" + address_id +
                ", user_email='" + user_email + '\'' +
                ", recv_people='" + recv_people + '\'' +
                ", telephone='" + telephone + '\'' +
                ", areaPath='" + areaPath + '\'' +
                ", zip_codde=" + zip_code +
                ", detail_address='" + detail_address + '\'' +
                ", isdefault=" + isdefault +
                '}';
    }
}
