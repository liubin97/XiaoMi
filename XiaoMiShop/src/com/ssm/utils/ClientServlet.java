package com.ssm.utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.websocket.StreamInbound;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends org.apache.catalina.websocket.WebSocketServlet  {
private static final long serialVersionUID = 1L;
	
	public static int ONLINE_USER_COUNT	= 1;
	
	public String getUser(HttpServletRequest request){
		return (String) request.getSession().getAttribute("user");
	}

	//��ƽ��Servlet��ͬ���ǣ���Ҫʵ��createWebSocketInbound���������ʼ���Զ����WebSocket���Ӷ���
    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,HttpServletRequest request) {
        return new ClientMessageInbound(this.getUser(request));
    }

}
