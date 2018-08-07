<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="assets/js/jquery-1.12.3.min.js"></script>
<script src="assets/js/selectGroupBuyInfo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="" width="600">
		<tr>
			<td>商品名称</td>
			<td>${resultGroupBuyInfo.goodsdetail.goods.goods_name}</td>
		</tr>
		<tr>
			<td>商品图片url</td>
			<td>${resultGroupBuyInfo.goodsdetail.goodsPictureList[0].picture_set_url}</td>
		</tr>
		<tr>
			<td>商品规格</td>
			<td>${resultGroupBuyInfo.goodsdetail.kind}</td>
		</tr>
		<tr>
			<td>商品颜色</td>
			<td>${resultGroupBuyInfo.goodsdetail.color}</td>
		</tr>
		<tr>
			<td>团信息列表</td>
			<td>
				<table border="" width="400">
					<c:forEach items="${resultGroupBuyInfo.groupList}" var="grouplist">
							<tr>
								<td>团id</td>
								<td>${grouplist.group_id}</td>
								<td>
									<table border="" width="400">
										
											<c:forEach items="${grouplist.groupers}" var="grouper">
												<tr>
													<td>用户昵称</td>
													<td>${grouper.nickname}</td>
												</tr>
											</c:forEach>
									</table>
								</td>
								<td class="addGroup" >
								<a href="javascript:void(0);" id="${grouplist.group_id}">
								加入团	
								<span class="groupId" style="display:none">${grouplist.group_id}</span>
								<span class="groupBuyInfoId" style="display:none">${resultGroupBuyInfo.group_buy_info_id}</span>
								</a>
								</td>
								
							</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<a id="stockEnough" href="javascript:void(0);">发起团购
		<span id="group_num" style="display:none">${resultGroupBuyInfo.group_num}</span>
		<span id="goods_detail_id" style="display:none">${resultGroupBuyInfo.goods_detail_id}</span>
		<span id="groupBuyInfoId" style="display:none">${resultGroupBuyInfo.group_buy_info_id}</span>
	</a>
</body>
</html>