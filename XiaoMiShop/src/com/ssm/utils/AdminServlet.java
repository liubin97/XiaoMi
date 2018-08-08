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
@WebServlet("/AdminServlet")
public class AdminServlet extends org.apache.catalina.websocket.WebSocketServlet  {
private static final long serialVersionUID = 1L;
	
	public static int ONLINE_USER_COUNT	= 0;
	
	public String getAdmin(HttpServletRequest request){
		System.out.println((String) request.getSession().getAttribute("admin"));
		return (String) request.getSession().getAttribute("admin");
	}

	//��ƽ��Servlet��ͬ���ǣ���Ҫʵ��createWebSocketInbound���������ʼ���Զ����WebSocket���Ӷ���
    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,HttpServletRequest request) {
        System.out.println("jianli");
    	return new AdminMessageInbound(this.getAdmin(request));
    }

}
