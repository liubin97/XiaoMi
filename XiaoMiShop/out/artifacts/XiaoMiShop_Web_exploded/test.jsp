<%--
  Created by IntelliJ IDEA.
  User: 10334
  Date: 2018/7/24
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>使用 layDate 独立版</title>
</head>
<body>
<input type="text" id="test1">
<script src="laydate/laydate.js"></script> <!-- 改成你的路径 -->
<script>
    //执行一个laydate实例
    laydate.render({
        elem: '#test1' //指定元素
    });
</script>
</body>
</html>
