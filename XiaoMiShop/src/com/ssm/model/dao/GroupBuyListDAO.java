package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.GroupBuyList;

public interface GroupBuyListDAO {
	public List<GroupBuyList> selectGroupBuyListById(int groupBuyInfoId);
	public int isInGroup(Map<String,Object> map);
	public GroupBuyList selectGroupById(int groupId);
	public void insertGroup(int groupId);
	public void settleGroup(int groupId);
	public void initiateNewGroup(GroupBuyList gbl);
}
