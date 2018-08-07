<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch-ZN" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的订单</title>
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">
    <link rel="apple-touch-icon" href="assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="assets/images/logo.png">
    <link href="assets/dzrcss/base.min.css" rel="stylesheet">
    <link href="assets/dzrcss/main.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/vendors/linearicons/css/linearicons.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.theme.min.css" rel="stylesheet">
    <link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/dzrcss/layout.css" rel="stylesheet">
    <link href="assets/dzrcss/reset.css" rel="stylesheet">
    <link href="assets/dzrcss/modacctip.css" rel="stylesheet">
    
	
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
                                <li><a href="modifyuser.jsp">修改信息</a></li>
								<li><a href="editpsw.jsp">修改密码</a></li>                                                    
							</ul>
                        </div>
                        
                    </div>
  					
  					<div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">个人中心</h3>
                        </div>
                        
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="searchFavorite.action?searchkey=">我喜欢</a></li>
								<li class="active"><a href="selectOrdersByStatus.action?order_status=0">我的订单</a></li> 
								<li><a href="selectUserGroupBuyOrder.action">团购订单</a></li>  
								<li><a href="selectXiuComment.action?comment_flag=0">评价晒单</a></li>  
								<li><a href="selectByTypeFlag.action?read_flag=0">消息中心</a></li> 
								<li><a href="getAllAddress.action">地址管理</a></li>                                                  
							</ul>
                        </div>
                        
                    </div>
  					
                </div>
            </div>
        
            
            
                  
            
        
        
         <div class="page-content col-xs-12 col-sm-7 col-md-9">
          
         
         <div class="uc-box uc-main-box">
                    <div class="uc-content-box order-list-box">
                        <div class="box-hd">
                            <h1 class="title">我的订单</h1>
                            <div class="more clearfix">
                                <ul class="filter-list J_orderType">
                                	<c:if test="${order_status==1}">
                                    <li class="first"><a id="J_unpaidTab" href="selectOrdersByStatus.action?order_status=0" >已下单</a></li>
                                    <li class="active"><a id="J_sendTab" href="selectOrdersByStatus.action?order_status=1" >交易成功</a></li>
                                    </c:if>
                                    <c:if test="${order_status==0}">
                                    <li class="first active"><a id="J_unpaidTab" href="selectOrdersByStatus.action?order_status=0" >已下单</a></li>
                                    <li><a id="J_sendTab" href="selectOrdersByStatus.action?order_status=1" >交易成功</a></li>
                                    </c:if>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    </ul>
                                    
                                <form id="J_orderSearchForm" class="search-form clearfix" action="selectOrders.action?order_status=${order_status}" method="post">
                                    <label for="search" class="hide">站内搜索</label>
                                    <input class="search-text" type="search" id="J_orderSearchKeywords" name="searchkey" autocomplete="off" placeholder="输入商品名称、订单号">
                                    <input type="submit" class="search-btn iconfont" value="">
                                </form>
                            </div>
                        </div>
                        <div class="box-bd">
                           
                           
<c:forEach items="${ordermsglist}" var="ol">
  <div id="J_orderList">
    <ul class="order-list">
      <c:if test="${order_status==0}">
        <li class="uc-order-item uc-order-item-pay"></c:if>
      <c:if test="${order_status==1}">
        <li class="uc-order-item uc-order-item-finish"></c:if>
      <div class="order-detail">
        <div class="order-summary">
          <div class="order-status">
            <c:if test="${order_status==0}">已下单</c:if>
            <c:if test="${order_status==1}">交易成功</c:if></div>
        </div>
        <table class="order-detail-table">
          <thead>
            <tr>
              <th class="col-main">
                <p class="caption-info">${ol.order_date}
                  <span class="sep">|</span>${ol.address.recv_people}
                  <span class="sep">|</span>订单号：
                  <a href="" data-stat-id="" onclick="">${ol.order_id}</a>
                  <span class="sep">|</span>在线支付</p></th>
              <th class="col-sub">
                <p class="caption-price" style="width:200px;">订单金额：${ol.sum_money}元</p></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="order-items">
                <ul class="goods-list">
                  <c:forEach items="${ol.order_items}" var="il">
                    <li style="height:80px;">
                      <div class="figure figure-thumb">
                        <a href="displayGoodsPurchaseInfo.action?goods_id=${il.goodsDetail.goods_id}" target="_blank" data-stat-id="" onclick="">
                          <img src="${il.goodsDetail.goods.goods_pic_url}" width="80" height="80" alt="" /></a>
                      </div>
                      <p class="name">
                        <a target="_blank" href="displayGoodsPurchaseInfo.action?goods_id=${il.goodsDetail.goods_id}">${il.goodsDetail.goods.goods_name} ${il.goodsDetail.kind} ${il.goodsDetail.color}</a></p>
                      <p class="price">${il.item_price}元 &times; ${il.order_item_num}</p></li>
                  </c:forEach>
                </ul>
              </td>
              <td class="order-actions">
                <a class="btn1 btn-small btn-line-gray" href="getDetail.action?order_id=${ol.order_id}" onclick="">订单详情</a></td>
            </tr>
          </tbody>
        </table>
      </div>
      </li>
    </ul>
  </div>
</c:forEach>
  
  
  <div id="J_orderListPages">
   <div class="xm-pagenavi"> 
    <span class="numbers first"><span class="iconfont"></span></span> 
    <span class="numbers current">1</span> 
    <span class="numbers last"><span class="iconfont"></span></span> 
   </div>
  </div>

                           
                           
                           
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
function show(){
	if($("#pop1").css("display")=="none"){
		$("#pop1").css("display","block");
		$("#pop2").css("display","block");
	}else{
		$("#pop1").css("display","none");
		$("#pop2").css("display","none");
	}
}
function show1(){
	if($("#pop3").css("display")=="none"){
		$("#pop3").css("display","block");
		$("#pop4").css("display","block");
		$("#pop5").css("display","block");
	}else{
		$("#pop3").css("display","none");
		$("#pop4").css("display","none");
		$("#pop5").css("display","none");
	}
}
</script>

</body>

</html>
