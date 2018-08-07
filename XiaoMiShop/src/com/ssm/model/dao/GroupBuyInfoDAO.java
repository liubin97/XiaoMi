package com.ssm.model.dao;

import java.util.List;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.GroupBuyInfo;
import com.ssm.model.bean.Message;

public interface GroupBuyInfoDAO {
	public List<GroupBuyInfo> selectAllGroupBuyInfo();
	public GroupBuyInfo selectGroupBuyInfoById(int groupBuyInfoId);
	public List<Address> selectUserAddress(String user_email);
	public int getStock(int goodsDetailId);
	public void insertMessage(Message message);
}
