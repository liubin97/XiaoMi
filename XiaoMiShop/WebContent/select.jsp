<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="select.action" method="post">
        <button type="submit">提交</button>
        <div>
            <table>
                <tr>
                    <th></th>
                    <th>id</th>
                    <th>name</th>
                    <th>pass</th>
                    <th>type</th>
                </tr>

                <c:forEach items="${resultList}" var="u">
                    <tr>
                        <td><input type="checkbox" name="userids" value="${u.admin_id}" ></td>
                        <td>${u.admin_id}</td>
                        <td>${u.admin_name}</td>
                        <td>${u.admin_password}</td>
                        <td>${u.admin_type}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </form>
</body>
</html>
