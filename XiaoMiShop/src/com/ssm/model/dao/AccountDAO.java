package com.ssm.model.dao;

import java.util.Map;

import com.ssm.model.bean.*;

public interface AccountDAO {
	public void insertAccount(User user);
	public String findEmail(String email);
	public User findUser(User user);
	public void editUserPic(Map<String, Object> picmap);
	public void updateUser(User user);
	public void editPsw(Map<String, Object> psdmap);
}
