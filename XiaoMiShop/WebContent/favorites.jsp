<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch-ZN" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我喜欢的商品</title>
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">
    <link href="assets/dzrcss/base.min.css" rel="stylesheet">
    <link href="assets/dzrcss/main.min.css" rel="stylesheet">
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


	
<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    
    <div class="page-container ptb-30">
        <div class="container">
<div class="row row-rl-10 row-tb-20">
   <div class="page-sidebar col-md-3 col-sm-5 col-xs-12">
                <div class="uc-box uc-sub-box">
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">账户管理</h3>
                        </div>
                        
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="">修改信息</a></li>
								<li><a href="">修改密码</a></li>                                                    
							</ul>
                        </div>
                        
                    </div>
  					
  					<div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">个人中心</h3>
                        </div>
                        
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li class="active"><a href="searchFavorite.action?searchkey=">我喜欢</a></li>
								<li><a href="">我的订单</a></li> 
								<li><a href="">团购订单</a></li>  
								<li><a href="">评价晒单</a></li>  
								<li><a href="">消息中心</a></li> 
								<li><a href="">地址管理</a></li>                                                  
							</ul>
                        </div>
                        
                    </div>
  					
                </div>
            </div>
            
            
            <div class="page-content col-xs-12 col-sm-7 col-md-9">
    <div class="uc-box uc-main-box">
        <div class="uc-content-box">
            <div class="box-hd">
                <h1 class="title">喜欢的商品</h1>
                <div class="more clearfix hide">
                    <ul class="filter-list J_addrType">
                        
                    </ul>
                </div>
            </div>
            <div class="box-bd">
                      <div class="xm-goods-list-wrap">
                        <ul class="xm-goods-list clearfix">
                        
                        <c:forEach items="${favoriteslist}" var="fl" >
                              <li class="xm-goods-item">
                                <div class="figure figure-img">
                                    <a href="displayGoodsPurchaseInfo.action?goods_id=${fl.goods_id}" target="_blank"  onclick="">
                                        <img src="${fl.goods.goods_pic_url}">
                                    </a>
                                </div>
                                <h3 class="title">
                                    <a href="displayGoodsPurchaseInfo.action?goods_id=${fl.goods_id}" target="_blank"  onclick="">${fl.goods.goods_name}</a>
                                </h3>
                               <p class="price">${fl.goods.lowestprice}元起</p> 
                                <p class="rank">  </p>
                                <div class="actions">
                                    <a id="" class="btn1 btn-small" href="deleteFavorite.action?favorites_id=${fl.favorites_id}">删除</a>
                                    <a class="btn1 btn-small btn-primary" target="_blank"  href="displayGoodsPurchaseInfo.action?goods_id=${fl.goods_id}"  onclick="">查看详情</a>
                                  </div>
                            </li>
                            
                           	</c:forEach>
                            
                            
                            
                        </ul>
                    </div>
                 <div class="xm-pagenavi"></div>
                
            </div>
        </div>
    </div>
</div>
        </div>    
            </div>
            </div>
            
            


    <c:import url="footer.jsp"/>
</div>



<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script src="assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/vendors/countdown/jquery.countdown.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>

<script type="text/javascript">

</script>


</body>

</html>
