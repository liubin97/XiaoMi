package com.ssm.utils;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;

import net.sf.json.JSONObject;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;

public class AdminMessageInbound extends MessageInbound {

	//��ǰ���ӵ��û�����
	private final String admin;

	public AdminMessageInbound(String admin) {
		this.admin = admin;
		System.out.println("asd");
	}

	public String getAdmin() {
		return this.admin;
	}

	//�������ӵĴ������¼�
	@Override
	protected void onOpen(WsOutbound outbound) {
		//�����ӳ���ӵ�ǰ�����Ӷ���
		System.out.println("����");
		MessageInboundPool.addAdminMessageInbound(this);
	}

	@Override
	protected void onClose(int status) {
		// �����ر��¼��������ӳ����Ƴ�����
		MessageInboundPool.removeMessageInbound(this);
	}

	@Override
	protected void onBinaryMessage(ByteBuffer message) throws IOException {
		throw new UnsupportedOperationException("Binary message not supported.");
	}

	//�ͻ��˷�����Ϣ��������ʱ�����¼�
	@Override
	protected void onTextMessage(CharBuffer message) throws IOException {
		//�����������û�������Ϣ
		MessageInboundPool.sendMessageToUser(admin,message.toString());
	}
}
