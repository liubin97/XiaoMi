<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="selectAllGroupBuyInfo.action" method="post">
        <button type="submit">提交</button>
        </form>
        <div>
            <table border="1px">
                <tr>
                    <th>group_buy_info_id</th>
                    <th>goods_id</th>
                    <th>goods_detail_id</th>
                    <th>goods_name</th>
                    <th>group_buy_endtime</th>
                    <th>group_buy_price</th>
                    <th>image_url</th>
                    <th></th>
                </tr>

                <c:forEach items="${allGroupBuyInfo}" var="u">
                    <tr>
                        
                        <td>${u.group_buy_info_id}</td>
                        <td>${u.goodsdetail.goods_id}</td>
                        <td>${u.goodsdetail.goods_detail_id}</td>
                        <td>${u.goodsdetail.goods.goods_name}</td>
                        <td>
                        <fmt:formatDate value="${u.group_endtime}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </td>
                        <td>${u.group_buy_price}</td>
                        
                        <td>
                        	<table border="">
                        		<c:forEach items="${u.goodsdetail.goodsPictureList}" var="a">
                        			<tr><td>${a.picture_set_url}</td></tr>
                        		</c:forEach>
                        	</table>
                        </td>
                        
                        <td>
                        	<form method="post" action="selectGroupBuyInfoById.action">
                    			<input name="groupBuyInfoId" type="hidden" value="${u.group_buy_info_id}">
                    			<button type="submit">submit</button>
                    		</form>
                        </td>
                    </tr>
                    
                </c:forEach>
            </table>
        </div>
    
    	
    
</body>
</html>
