<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch-ZN">
<head>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- META TAGS                                 -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<meta charset="utf-8">
<!-- Always force latest IE rendering engine -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile specific meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- PAGE TITLE                                -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<title>商品购买</title>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- SEO METAS                                 -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<meta name="description"
	content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
<meta
	name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
<meta name="robots" content="index, follow">
<meta name="author" content="CODASTROID">

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- PAGE FAVICON                              -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<link rel="apple-touch-icon"
	href="assets/images/favicon/apple-touch-icon.png">
<link rel="icon" href="assets/images/logo.png">

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- GOOGLE FONTS                              -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600"
	rel="stylesheet">

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- Include CSS Filess                        -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->

<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="assets/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Linearicons -->
<link href="assets/vendors/linearicons/css/linearicons.css"
	rel="stylesheet">

<!-- Owl Carousel -->
<link href="assets/vendors/owl-carousel/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendors/owl-carousel/owl.theme.min.css"
	rel="stylesheet">

<!-- Flex Slider -->
<link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="assets/css/base.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/purchase.css" rel="stylesheet">
</head>
<body class="wide-layout">

	<div id="pageWrapper" class="page-wrapper">
		<c:import url="header.jsp" />

		<div class="page-container ptb-30">
			<div class="container">
				<div class="row row-rl-10 row-tb-20">
					<div class="page-content col-sm-12 col-md-12">

						<!-- Store Tabs Area -->
						<div class="section store-tabs-area">
							<div class="tabs tabs-v1">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs panel" role="tablist">
									<li role="presentation"><a href="#preview"
										aria-controls="preview" role="tab" data-toggle="tab"
										aria-expanded="false"><i class="fa fa-home mr-10"></i>概述</a></li>
									<li role="presentation"><a href="#parameter"
										aria-controls="parameter" role="tab" data-toggle="tab"
										aria-expanded="false"><i class="fa fa-star mr-10"></i>参数</a></li>
									<li role="presentation" class="active"><a href="#deals"
										aria-controls="deals" role="tab" data-toggle="tab"
										aria-expanded="true"><i class="fa fa-shopping-cart mr-10"></i>立即购买</a>
									</li>

								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane ptb-20" id="preview">

									</div>

									<div role="tabpanel" class="tab-pane ptb-20" id="parameter">

									</div>
									<div role="tabpanel" class="tab-pane ptb-20 active" id="deals">
										<div class="row row-rl-10 row-tb-20">
											<div class="page-content col-xs-12 col-sm-6 col-md-6">
												<div class="row row-tb-20">
													<div class="col-xs-12">
														<div class="deal-deatails panel">
															<div class="deal-slider">
																<div id="product_slider" class="flexslider">
																	<ul class="slides">

																		<c:forEach
																			items="${resultGroupBuyInfo.goodsdetail.goodsPictureList}"
																			var="p">
																			<li><img alt="" src="${p.picture_set_url}">
																			</li>
																		</c:forEach>
																	</ul>
																</div>

																<div id="product_slider_nav"
																	class="flexslider flexslider-nav">
																	<ul class="slides">
																		<c:forEach
																			items="${resultGroupBuyInfo.goodsdetail.goodsPictureList}"
																			var="p">
																			<li><img alt="" src="${p.picture_set_url}">
																			</li>
																		</c:forEach>
																	</ul>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
											<div class="page-sidebar col-md-6 col-sm-6 col-xs-12">
												<!-- Blog Sidebar -->
												<aside class="sidebar blog-sidebar">
													<div class="row row-tb-10">
														<div class="col-xs-12">
															<div
																class="widget single-deal-widget panel ptb-30 prl-20">
																<div class="widget-body">
																	<h2 class="mb-20 h2">
																		${resultGroupBuyInfo.goodsdetail.goods.goods_name}</h2>
																	<ul class="deal-meta list-inline mb-10 color-mid">
																		<li><i class="ico fa fa-shopping-basket mr-10"></i>剩余<span
																			id="stock">${resultGroupBuyInfo.goodsdetail.stock}</span>件</li>
																	</ul>
																	<p class="color-muted">小米</p>
																	<div class="price mb-20">
																		<h2 class="price" id="price">
																			<span class="price-sale"> <fmt:formatNumber
																					value="${resultGroupBuyInfo.goodsdetail.prime_price}"
																					type="currency" pattern="￥.00" />
																			</span>
																			<fmt:formatNumber
																				value="${resultGroupBuyInfo.group_buy_price}"
																				type="currency" pattern="￥.00" />
																		</h2>
																	</div>

																	<h3 class="mb-10 h5">选择版本</h3>
																	<div class="filter-center col-md-12 mb-40">
																		<ul>

																			<li class="col-md-6"><a class="active">
																					${resultGroupBuyInfo.goodsdetail.kind}&nbsp; 
																					<span class="stock" style="display: none">${resultGroupBuyInfo.goodsdetail.stock}</span>
																			</a></li>


																		</ul>
																	</div>
																	
																	<div id="countdown-div" class="time-left mb-30">
                                                    					<p class="t-uppercase color-muted">
                                                        					剩的时间不多了！
                                                    					</p>
                                                    					<div id="countdown-time-div" class="color-mid font-14 font-lg-16">
        																	<i id="countdown-icon" class="ico fa fa-clock-o mr-10"></i>
        																	
	      																</div>
                                               						 </div>
                                               						 
																	<div class="buy-now mb-40">
																		<ul class="list-inline" style="margin-left: 30px">
																			<li>
																			<a id="purchase" href="javascript:void(0);" class="btn" style="color: #E5511D; background: #f2dede; border-color: #F0CAB6;">
																					立即购买 </a>
																					<span id="url" style="display:none">${url}</span>
																					<span id="flag" style="display:none">${flag}</span>
																					<span id="goods_detail_id" style="display:none">${resultGroupBuyInfo.goods_detail_id}</span>
																					<span id="groupBuyInfoId" style="display:none">${resultGroupBuyInfo.group_buy_info_id}</span>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

													</div>
												</aside>
												<!-- End Blog Sidebar -->
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- End Store Tabs Area -->

					</div>

				</div>

			</div>
		</div>
		<c:import url="footer.jsp" />
	</div>



	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- SCRIPTS                                   -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->

	<!-- (!) Placed at the end of the document so the pages load faster -->

	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- Initialize jQuery library                 -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<script src="assets/js/jquery-1.12.3.min.js"></script>

	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- Latest compiled and minified Bootstrap    -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- JavaScript Plugins                        -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- (!) Include all compiled plugins (below), or include individual files as needed -->

	<!-- Modernizer JS -->
	<script src="assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>

	<!-- Owl Carousel -->
	<script type="text/javascript"
		src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>

	<!-- FlexSlider -->
	<script type="text/javascript"
		src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>

	<!-- Coutdown -->
	<script type="text/javascript"	src="assets/lms/selectGroupBuyInfo.js"></script>
	
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- Custom Template JavaScript                   -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<script type="text/javascript" src="assets/lms/main1.js"></script>
	
	<script>
    var flag ="${flag}";
    if(flag==1){
        $("#countdown-icon").after('<span id="count-time" data-countdown="'+ '<fmt:formatDate value="${resultGroupBuyInfo.group_starttime}" pattern="yyyy-MM-dd HH:mm:ss" />' +'"></span>'); 
    }else if(flag==2){
        $("#countdown-icon").after('<span id="count-time" data-countdown="'+ '<fmt:formatDate value="${resultGroupBuyInfo.group_endtime}" pattern="yyyy-MM-dd HH:mm:ss" />' +'"></span>'); 

       // $("#count-time").attr("data-countdown", '<fmt:formatDate value="${resultGroupBuyInfo.group_endtime}" pattern="yyyy-MM-dd HH:mm:ss" />');
    	var url = "${url}";
    	url += "?" + "groupBuyInfoId="+$("#groupBuyInfoId").text();
    	$("#purchase").attr("href",url);
    }else if(flag==3){
        var countdown_div = $("#countdown-div");
        countdown_div.empty();
        countdown_div.append("<p>团购已结束</p>");
    }
	</script>
<form id="hiddenform" method="post" action="selectGroupBuyInfoById.action">
		<input name="groupBuyInfoId" type="hidden" value="${resultGroupBuyInfo.group_buy_info_id}">
</form>
</body>
</html>
