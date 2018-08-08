<%@ page language="java" pageEncoding="UTF-8" import="com.ssm.utils.*"%>
<%
	String user = (String)session.getAttribute("user");
	if(user == null){
		//为用户生成昵称
		user = "游客" + ClientServlet.ONLINE_USER_COUNT;
		ClientServlet.ONLINE_USER_COUNT++;
		session.setAttribute("user", user);
	}
	pageContext.setAttribute("user", user);
%>
<html>
<head>
	<title>WebSocket 客户咨询端口</title>
	<!-- 引入CSS文件 -->
	<link rel="stylesheet" type="text/css" href="ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="ext4/shared/example.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/websocket.css" />
	
	<!-- 映入Ext的JS开发包，及自己实现的webscoket. -->
	
	<script type="text/javascript" src="assets/dzrjs/jquery.min.js"></script>
	<script type="text/javascript" src="ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="assets/dzrjs/client.js"></script>
	<script type="text/javascript">
		var user = "${user}";
	</script>
</head>

<body>
	<h1>客户端</h1>
	<p>通过HTML5标准提供的API与Ext富客户端框架相结合起来，实现聊天室，有以下特点：</p>
	<ul class="feature-list" style="padding-left: 10px;">
		<li>实时获取数据，由服务器推送，实现即时通讯</li>
		<li>利用WebSocket完成数据通讯，区别于轮询，长连接等技术，节省服务器资源</li>
		<li>结合Ext进行页面展示</li>
		<li>用户上线下线通知</li>
	</ul>
	<div id="websocket_button"></div>
	<button onclick="beginclient();">艹客服</button>
</body>
</html>
