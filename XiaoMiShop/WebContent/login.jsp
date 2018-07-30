<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.7.29
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
</head>
<body>
这是登陆拦截测试页面
<form action="login?redirectURL=${param.redirectURL}" method="post">
    <button type="submit">登陆</button>
</form>
</body>
</html>
