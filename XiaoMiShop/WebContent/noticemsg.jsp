<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
								<li><a href="selectOrdersByStatus.action?order_status=0">我的订单</a></li> 
								<li><a href="selectUserGroupBuyOrder.action">团购订单</a></li>  
								<li><a href="selectXiuComment.action?comment_flag=0">评价晒单</a></li>  
								<li class="active"><a href="selectByTypeFlag.action?read_flag=0">消息中心</a></li> 
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
                            <h1 class="title">消息通知</h1>
                            <div class="more clearfix">
                                <ul class="filter-list J_orderType">
                                	<c:if test="${read_flag==1}">
                                    <li class="first"><a id="J_unpaidTab" href="selectByTypeFlag.action?read_flag=0" >未读</a></li>
                                    <li class="active"><a id="J_sendTab" href="selectByTypeFlag.action?read_flag=1" >已读</a></li>
                                    </c:if>
                                    <c:if test="${read_flag==0}">
                                    <li class="first active"><a id="J_unpaidTab" href="selectByTypeFlag.action?read_flag=0" >未读</a></li>
                                    <li><a id="J_sendTab" href="selectByTypeFlag.action?read_flag=1" >已读</a></li>
                                    </c:if>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    
                               
                            </div>
                        </div>
                        
    <table id="cart_list" class="cart-list mb-30">
                                    <thead class="panel t-uppercase">
                                        <tr>
                                            <th>消息内容</th>
                                            <th>消息类型</th>
                                            <th>日期</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${msglist}" var="ml">
                                        <tr class="panel alert">
                                            <td>	
                                              
                                                <div class="media-body valign-middle">
                                                    <h6 class="title mb-15 t-uppercase">${ml.message_title}</h6>
                                                    <div class="type font-12"><span class="t-uppercase">内容 : </span>${ml.message_text}</div>
                                                </div>
                                            </td>
                                            <td>
                                            <c:if test="${ml.message_type==0}" >
                                            	普通通知
                                            </c:if>
                                             <c:if test="${ml.message_type==1}" >
                                            	提醒通知
                                            </c:if>
                                            </td>
                                            <td>
                                                 
                                           <fmt:formatDate value="${ml.send_date}" pattern="yyyy-MM-dd" />
                                           
                                            </td>
                                            <td>
                                                <div class="sub-total">
                                            <c:if test="${read_flag==0}" >
                                            	<a href="updateRead.action?read_flag=${read_flag}&message_id=${ml.message_id}">我已查看</a>
                                            </c:if>
                                             <c:if test="${read_flag==1}" >
                                            	已读
                                            </c:if>
                                                </div>
                                            </td>
                                            <td>
                                                <button type="button" class="close" >
                                                <a href="deleteMsg.action?read_flag=${read_flag}&message_id=${ml.message_id}">
                                                    <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </button>
                                            </td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
    
    
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
