package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.Admin;

public interface AdminDAO {
	public List<Admin> selectAdmin(Admin admin);
	
}
