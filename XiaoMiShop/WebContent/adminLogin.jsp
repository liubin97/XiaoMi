<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"   %>

<!DOCTYPE >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员登陆</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="asset/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="asset/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="js/adminLogin.js"></script>
</head>
<body data-type="login">
<%String loginmsg=(String)request.getSession().getAttribute("loginmsg");
    request.getSession().removeAttribute("loginmsg");%>
    <script src="asset/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-logo">

                </div>



                <form class="am-form tpl-form-line-form" id="validateAdmin" action="validateLogin.action" method="post">
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" id="admin_name" name="admin_name" placeholder="请输入账号">
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="admin_password" name="admin_password" placeholder="请输入密码">
                    </div>
                    <div class="am-form-group">
                        <button type="button" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" onclick="validateLogin()">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">登陆失败</div>
            <div class="am-modal-bd">
                请输入正确的管理员账户和密码！
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>
    <script src="asset/js/amazeui.min.js"></script>
    <script src="asset/js/app.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            var loginmsg="<%=loginmsg%>";
            if(loginmsg=='false'){
                $('#my-alert').modal('toggle');
            }
        }

    </script>
</body>
</html>