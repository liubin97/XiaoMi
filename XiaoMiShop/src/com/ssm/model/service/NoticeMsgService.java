package com.ssm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.Message;
import com.ssm.model.dao.NoticeMsgDAO;

@Service
public class NoticeMsgService {
	 @Autowired
	 private NoticeMsgDAO noticeMsgDAO;
	 
	 public List<Message> selectByTypeFlag(Map<String, Object> etfmap){
		 return noticeMsgDAO.selectByTypeFlag(etfmap);
	 }
	 
	 public int getNoReadNum(String email){
		 return noticeMsgDAO.getNoReadNum(email);
	 }
	 
	 public void updateRead(int message_id){
		 noticeMsgDAO.updateRead(message_id);
	 }
	 
	 public void deleteMsg(int message_id){
		 noticeMsgDAO.deleteMsg(message_id);
	 }
	 
}
