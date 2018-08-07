package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.*;

public interface AddressDAO {
	public void insertAddress(Address address);
	public void deleteAddress(int address_id);
	public void updateDefault(int address_id);
	public void deleteDefault(String user_email);
	public List<Address> getAllAddress(String user_email);
}
