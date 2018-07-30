package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.GroupBuyInfo;

public interface GroupBuyInfoDAO {
	public List<GroupBuyInfo> selectAllGroupBuyInfo();
	public GroupBuyInfo selectGroupBuyInfoById(int groupBuyInfoId);
	public List<Address> selectUserAddress(String user_email);
}
