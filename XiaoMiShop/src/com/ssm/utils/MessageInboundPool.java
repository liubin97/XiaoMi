package com.ssm.utils;

import java.io.IOException;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import org.apache.catalina.websocket.MessageInbound;

public class MessageInboundPool {

	//�������ӵ�MAP����
	private static final Map<String,MessageInbound > connections = new HashMap<String,MessageInbound>();
	private static final Map<String,MessageInbound > adminConnections = new HashMap<String,MessageInbound>();
	private static Vector<String> adminlist=new Vector<String>();
	private static Vector<ConnectionMap> cm=new Vector<ConnectionMap>();
	//�����ӳ����������
	public static String getUserTarget(String admin){
		for(int i=0,len=cm.size();i<len;i++){
			ConnectionMap c=cm.get(i);
			if(c.getAdminname().equals(admin)){
				
				return c.getClientname();
			}
		}
		return null;
	}
	public static String getAdminTarget(String user){
		for(int i=0,len=cm.size();i<len;i++){
			ConnectionMap c=cm.get(i);
			if(c.getClientname().equals(user)){
				return c.getAdminname();
			}
		}
		return null;
	}
	public static String getAdminStatus(){
		for(int i=0,len=adminlist.size();i<len;i++){
			String tmp=adminlist.get(i);
			if(getUserTarget(tmp)==null){
				return "有空闲";
			}else{
				
			}
		}
		return "忙碌";
	}
	public static String getUsefulAdmin(){
		for(int i=0,len=adminlist.size();i<len;i++){
			String tmp=adminlist.get(i);
			if(getUserTarget(tmp)==null){
				return tmp;
			}else{
				
			}
		}
		return null;
	}
	public static void addClietnMessageInbound(ClientMessageInbound inbound){
		//�������
		System.out.println("user : " + inbound.getUser() + " 尝试连接..");
		
		connections.put(inbound.getUser(), inbound);
		String usefuladmin=getUsefulAdmin();
		if(usefuladmin==null){
			System.out.println("客服都很忙");
		}else{
			ConnectionMap c=new ConnectionMap();
			c.setAdminname(usefuladmin);
			c.setClientname(inbound.getUser());
			cm.add(c);
			System.out.println(inbound.getUser()+"连接了"+usefuladmin);
		}
		
		
	}
	
	//�����ӳ����������
	public static void addAdminMessageInbound(AdminMessageInbound inbound){
		//�������
		System.out.println("admin : " + inbound.getAdmin() + " join..");
		adminlist.add(inbound.getAdmin());
		adminConnections.put(inbound.getAdmin(), inbound);
	}
	
	//��ȡ���е������û�
	public static Set<String> getOnlineUser(){
		System.out.println("online user size: " + connections.size());
		System.out.println("online user Set: " + connections.keySet());
		return connections.keySet();
	}
	
	public static void removeMessageInbound(ClientMessageInbound inbound){
		//�Ƴ�����
		System.out.println("user : " + inbound.getUser() + " exit..");
		
		for(int i=0,len=cm.size();i<len;i++){
			ConnectionMap c=cm.get(i);
			if(c.getClientname().equals(inbound.getUser())){
				cm.remove(i);
				--len;
				--i;
			}
		}
		connections.remove(inbound.getUser());
	}
	
	public static void removeMessageInbound(AdminMessageInbound inbound){
		//�Ƴ�����
		System.out.println("admin : " + inbound.getAdmin() + " exit..");
		for(int i=0,len=adminlist.size();i<len;i++){
			String tmp=adminlist.get(i);
			if(tmp.equals(inbound.getAdmin())){
				System.out.println("客户主动断开连接，移除");
				adminlist.remove(i);
				--len;
				--i;
			}
		}
		for(int i=0,len=cm.size();i<len;i++){
			ConnectionMap c=cm.get(i);
			if(c.getAdminname().equals(inbound.getAdmin())){
				System.out.println("因为admin断开连接");
				cm.remove(i);
				--len;
				--i;
			}
		}
		adminConnections.remove(inbound.getAdmin());
	}
	
//	public static void sendMessageToUser(String user,String message){
//		try {
//			//���ض����û���������
//			System.out.println("send message to user : " + user + " ,message content : " + message);
//			WebSocketMessageInbound inbound = connections.get(user);
//			if(inbound != null){
//				inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	
	public static void sendMessageToAdmin(String user,String message){
		try {
			/*
			System.out.println("send message to admin ,message content : " + message);
			Set<String> keySet = adminConnections.keySet();
			for (String key : keySet) {
				AdminMessageInbound inbound = (AdminMessageInbound)adminConnections.get(key);
				if(inbound != null){
					System.out.println("send message to admin : " + key + " ,message content : " + message);
					inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
				}
			}
			*/
			AdminMessageInbound inbound=(AdminMessageInbound)adminConnections.get(getAdminTarget(user));
			if(inbound != null){
				System.out.println("send message to admin : " + getAdminTarget(user) + " ,message content : " + message);
				inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//�����е��û�������Ϣ
	public static void sendMessageToUser(String admin,String message){
		try {
			/*Set<String> keySet = connections.keySet();
			for (String key : keySet) {
				ClientMessageInbound inbound = (ClientMessageInbound)connections.get(key);
				if(inbound != null){
					System.out.println("send message to user : " + key + " ,message content : " + message);
					inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
				}
			}*/
			ClientMessageInbound inbound = (ClientMessageInbound)connections.get(getUserTarget(admin));
			if(inbound != null){
				System.out.println("send message to user : " + getUserTarget(admin) + " ,message content : " + message);
				inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
