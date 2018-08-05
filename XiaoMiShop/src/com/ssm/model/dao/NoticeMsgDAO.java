package com.ssm.model.dao;

import java.util.List;
import java.util.Map;

import com.ssm.model.bean.*;

public interface NoticeMsgDAO {
	public List<Message> selectByTypeFlag(Map<String, Object> etfmap);
	public int getNoReadNum(String email);
	public void updateRead(int message_id);
	public void deleteMsg(int message_id);
	
	
	
	
}
