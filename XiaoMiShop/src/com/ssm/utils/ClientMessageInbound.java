package com.ssm.utils;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;

import net.sf.json.JSONObject;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;

public class ClientMessageInbound extends MessageInbound {

	//��ǰ���ӵ��û�����
	private final String user;

	public ClientMessageInbound(String user) {
		this.user = user;
	}

	public String getUser() {
		return this.user;
	}

	//�������ӵĴ������¼�
	@Override
	protected void onOpen(WsOutbound outbound) {
		// ���������¼��������ӳ����������
		MessageInboundPool.addClietnMessageInbound(this);
		JSONObject result = new JSONObject();
		
		result = new JSONObject();
		result.element("type", "user_join");
		result.element("user", user);
		result.element("list", user);
		//�����ӳ���ӵ�ǰ�����Ӷ���
		//��ǰ���ӷ��͵�ǰ�����û����б�
		MessageInboundPool.sendMessageToAdmin(user,result.toString());
	}

	@Override
	protected void onClose(int status) {
		// �����ر��¼��������ӳ����Ƴ�����
		JSONObject result = new JSONObject();
		result = new JSONObject();
		result.element("type", "user_leave");
		result.element("user", user);
		result.element("list", user);
		//�����ӳ���ӵ�ǰ�����Ӷ���
		//��ǰ���ӷ��͵�ǰ�����û����б�
		MessageInboundPool.sendMessageToAdmin(user,result.toString());
		MessageInboundPool.removeMessageInbound(this);

	}

	@Override
	protected void onBinaryMessage(ByteBuffer message) throws IOException {
		throw new UnsupportedOperationException("Binary message not supported.");
	}

	//�ͻ��˷�����Ϣ��������ʱ�����¼�
	@Override
	protected void onTextMessage(CharBuffer message) throws IOException {
//		//�����������û�������Ϣ
//		JSONObject result = new JSONObject();
//		result = new JSONObject();
//		result.element("type", "message");
//		result.element("from", this.getUser());
//		result.element("content", message.toString());
		MessageInboundPool.sendMessageToAdmin(user,message.toString());
	}
}
