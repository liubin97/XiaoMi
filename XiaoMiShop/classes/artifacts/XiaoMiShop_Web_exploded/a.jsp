<%--
  Created by IntelliJ IDEA.
  User: xiedong
  Date: 2018/8/3
  Time: 上午9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>秒杀结果</title>
</head>
<body>
<h1> 我从seckillController来</h1>
<p>${user_email}</p>
<p>${addressID}</p>
<br>
<br>
<br>
<%--秒杀成功--%>
<c:if   test="${result.success}">
    <p>状态:${result.data.state}</p>
    </br>
    <p>状态的标识:${result.data.stateInfo}</p>
    </br>
    <br>
    <br>
    <h4>秒杀信息</h4>
    </br>
    <p>秒杀号：${result.data.successKilled.seckill_id}</p>
    </br>
    <p>用户邮箱账号：${result.data.successKilled.email}</p>
    </br>
    <p>创建时间：${result.data.successKilled.create_time}</p>
    </br>
    </br>
    </br>
    </br>
    <h4>秒杀商品详情</h4>
    <br>
    <p>商品名：${result.data.successKilled.seckillDetail.goods_name}</p>
    <br>
    <p>价格：${result.data.successKilled.seckillDetail.seckill_money}</p>
    <br>

</c:if>
<%--秒杀不成功--%>
<c:if   test="${!result.success}">
    <p>状态:${result.data.state}</p>
    </br>
    <p>状态的标识:${result.data.stateInfo}</p>
    </br>
</c:if>
</body>
</html>
