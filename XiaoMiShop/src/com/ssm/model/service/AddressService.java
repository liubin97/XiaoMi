package com.ssm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Address;
import com.ssm.model.dao.*;

@Service
public class AddressService {
	 @Autowired
	 private AddressDAO addressDAO;
	 
	 public void insertAddress(Address address){
		 addressDAO.insertAddress(address);
	 }
	 
	 public void deleteAddress(int address_id){
		 addressDAO.deleteAddress(address_id);
	 }
	 
	 public void updateDefault(String email,int address_id){
		 addressDAO.deleteDefault(email);
		 System.out.println("删除默认");
		 addressDAO.updateDefault(address_id);
		 System.out.println("设置默认");
	 }
	 public List<Address> getAllAddress(String email){
		 return addressDAO.getAllAddress(email);
	 }
}
