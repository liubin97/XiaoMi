<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch-ZN" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">
    <link rel="apple-touch-icon" href="assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="assets/images/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/vendors/linearicons/css/linearicons.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.theme.min.css" rel="stylesheet">
    <link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>

<body class="wide-layout">


	<%String status=(String)request.getSession().getAttribute("status");
	request.getSession().removeAttribute("status");
	%>
<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>

      <main id="mainContent" class="main-content">
            <div class="page-container ptb-60">
                <div class="container">
                    <section class="sign-area panel p-40">
                        <h3 class="sign-title">登录<small>Or <a href="register.jsp" class="color-green">注册</a></small></h3>
                        <div class="row row-rl-0">
                            <div class="col-sm-6 col-md-7 col-left">
                                <form class="p-40" action="findUser.action?redirectURL=${param.redirectURL}" method="post">
                                    <div class="form-group">
                                        <label><h3>账号</h3></label>
                                        <input type="text" class="form-control input-lg" placeholder="user_email" name="user_email">
                                    </div>
                                    <div class="form-group">
                                        <label><h3>密码</h3></label>
                                        <input type="password" class="form-control input-lg" placeholder="password" name="password">
                                    </div>
                                   <!--  <div class="form-group">
                                        <a href="#" class="forgot-pass-link color-green">Forget Youe Password ?</a>
                                    </div>
                                    <div class="custom-checkbox mb-20">
                                        <input type="checkbox" id="remember_account" checked>
                                        <label class="color-mid" for="remember_account">Keep me signed in on this computer.</label>
                                    </div>  -->
                                    <button type="submit" class="btn btn-block btn-lg">登录</button>
                                </form>
                                <span class="or">Or</span>
                            </div>
                            <div class="col-sm-6 col-md-5 col-right">
                                <div class="social-login p-40">
                                 <div class="mb-20">
                                        <button class="btn btn-lg btn-block btn-social btn-facebook"><i class="fa fa-facebook-square"></i>Sign In with Facebook</button>
                                    </div>
                                    <div class="mb-20">
                                        <button class="btn btn-lg btn-block btn-social btn-twitter"><i class="fa fa-twitter"></i>Sign In with Twitter</button>
                                    </div>
                                    <div class="mb-20">
                                        <button class="btn btn-lg btn-block btn-social btn-google-plus"><i class="fa fa-google-plus"></i>Sign In with Google</button>
                                    </div>
                                  
                                    <div class="text-center color-mid">
                                      		  没有账号 ? <a href="register.jsp" class="color-green">注册一个</a>
                                    </div>
                                   
                                   
                                </div>
                            </div> 
                        </div>
                    </section>
                </div>
            </div>


        </main>



    <c:import url="footer.jsp"/>
</div>



<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script src="assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/vendors/countdown/jquery.countdown.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>

<script type="text/javascript">
window.onload=function(){
	var status="<%=status%>";
	if(status!="null"){
		alert(status);
	}
}
</script>


</body>

</html>
