package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.UserAddress;

public interface GroupBuyInfoDAO {
	public List<GroupBuyInfo> selectAllGroupBuyInfo();
	public GroupBuyInfo selectGroupBuyInfoById(int groupBuyInfoId);
	public List<UserAddress> selectUserAddress(String user_email);
}
