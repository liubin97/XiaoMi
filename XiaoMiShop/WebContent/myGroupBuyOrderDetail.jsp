<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch-ZN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单详情</title>
<meta name="description"
	content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
<meta
	name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
<meta name="robots" content="index, follow">
<meta name="author" content="CODASTROID">
<link href="assets/dzrcss/base.min.css" rel="stylesheet">
<link href="assets/dzrcss/main.min.css" rel="stylesheet">

<link rel="apple-touch-icon"
	href="assets/images/favicon/apple-touch-icon.png">
<link rel="icon" href="assets/images/logo.png">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600"
	rel="stylesheet">
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/vendors/linearicons/css/linearicons.css"
	rel="stylesheet">
<link href="assets/vendors/owl-carousel/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendors/owl-carousel/owl.theme.min.css"
	rel="stylesheet">
<link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">
<link href="assets/css/base.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/dzrcss/order-view.min.css" rel="stylesheet">
</head>

<body class="wide-layout">



	<div id="pageWrapper" class="page-wrapper">
		<c:import url="header.jsp" />

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
								<li><a href="selectByTypeFlag.action?read_flag=0">消息中心</a></li> 
								<li><a href="getAllAddress.action">地址管理</a></li>                                                  
							</ul>
                        </div>


							</div>

						</div>
					</div>


					<div class="page-content col-xs-12 col-sm-7 col-md-9">


						<div class="uc-box uc-main-box">
							<div class="uc-content-box order-view-box">
								<div class="box-hd">
									<h1 class="title">订单详情</h1>
									<div class="more clearfix">
										<h2 class="subtitle">
											订单号：${orderDetail.order_id} <span class="tag tag-subsidy"></span>
										</h2>
										<div class="actions">
											<c:if test="${orderDetail.order_status==2}">
												<a id="J_payOrder" class="btn1 btn-primary"
													href="deleteUserGroup.action?orderId=${orderDetail.order_id}">点击退出团</a>
											</c:if>

										</div>
									</div>
								</div>
								<div class="box-bd">
									<c:if test="${orderDetail.order_status==2}">
										<div class="uc-order-item uc-order-item-pay">
									</c:if>

									<c:if test="${orderDetail.order_status==3}">
										<div class="uc-order-item uc-order-item-finish">
									</c:if>
									<c:if test="${orderDetail.order_status==4}">
										<div class="uc-order-item uc-order-item-finish">
									</c:if>
									<div class="order-detail">

										<div class="order-summary">
											<div class="order-status">
												<c:if test="${orderDetail.order_status==2}">
                       		 					  已下单
                          						</c:if>

												<c:if test="${orderDetail.order_status==3}">
                       		   					交易成功
                          						</c:if>
												
												<c:if test="${orderDetail.order_status==4}">
                       		   					交易失败
                          						</c:if>
											</div>

										</div>

										<table class="order-items-table">
											<tbody>

												<c:forEach items="${orderDetail.order_items}" var="il">
													<tr>
														<td class="col col-thumb">
															<div class="figure figure-thumb">
																<img
																	src="${il.goodsDetail.goods.goods_pic_url}" width="80"
																	height="80" alt="">
															</div>
														</td>
														<td class="col col-name">
															<p class="name">
																${il.goodsDetail.goods.goods_name}
																	${il.goodsDetail.kind} ${il.goodsDetail.color}
															</p>
														</td>
														<td class="col col-price">
															<p class="price">${il.item_price}元×
																${il.order_item_num}</p>
														</td>
														<td class="col col-actions"></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>

									<div id="editAddr" class="order-detail-info">

										<h3>收货信息</h3>
										<table class="info-table">
											<tbody>
												<tr>
													<th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</th>
													<td>${orderDetail.address.recv_people}</td>
												</tr>
												<tr>
													<th>联系电话：</th>
													<td>${orderDetail.address.telephone}</td>
												</tr>
												<tr>
													<th>收货地址：</th>
													<td>${orderDetail.address.areaPath}
														${orderDetail.address.detail_address}</td>
												</tr>
											</tbody>
										</table>
										<div class="actions"></div>

									</div>



									<div id="editTime" class="order-detail-info">
										<h3>支付方式及送货时间</h3>
										<table class="info-table">
											<tbody>
												<tr>
													<th>支付方式：</th>
													<td>在线支付</td>
												</tr>
												<tr>
													<th>送货时间：</th>
													<td>不限送货时间</td>
												</tr>

											</tbody>
										</table>
										<div class="actions"></div>
									</div>

									<div class="order-detail-total">
										<table class="total-table">


											<tbody>
												<tr>
													<th>商品总价：</th>
													<td><span class="num">${orderDetail.sum_money}</span>元</td>
												</tr>
												<tr>
													<th>运费：</th>
													<td><span class="num">0</span>元</td>
												</tr>
												<tr>
													<th class="total">应付金额：</th>
													<td class="total"><span class="num">${orderDetail.sum_money}</span>元</td>
												</tr>


											</tbody>
										</table>
									</div>


								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>




	<c:import url="footer.jsp" />
	</div>



	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script src="assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript"
		src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>
	<script type="text/javascript"
		src="assets/vendors/countdown/jquery.countdown.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>

	<script type="text/javascript">
		
	</script>


</body>

</html>
