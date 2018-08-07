<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="selectUserGroupBuyOrder.action" method="post">
		<button type="submit">提交</button>
	</form>
	
	<c:forEach items="${orderList}" var="o">
		<table border="1px">
			<tr>
				<td>订单号</td>
				<td>商品名</td>
				<td>版本</td>
				<td>价格</td>
				<td>图片url</td>
				<td>收货人</td>
				<td>收货地址</td>
				<td>收货电话</td>
			</tr>
			<tr>
				<td>${o.order_id}</td>
				<td>${o.order_items[0].goodsDetail.goods.goods_name}</td>
				<td>颜色:${o.order_items[0].goodsDetail.color} 种类:${o.order_items[0].goodsDetail.kind}</td>
				<td>${o.sum_money}</td>
				<td>${o.order_items[0].goodsDetail.goodsPictureList[0].picture_set_url}</td>
				<td>${o.address.recv_people}</td>
				<td>${o.address.detail_address}</td>
				<td>${o.address.telephone}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>