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
<title>团购商品列表</title>

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

<!-- seckill css -->
<link href="assets/css/seckill.css" rel="stylesheet">
</head>
<body class="wide-layout">

	<div id="pageWrapper" class="page-wrapper">
		<c:import url="header.jsp" />

		<div class="container">

			<div class="seckill ptb-40">


				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active " id="ios">
						<div class="row row-masnory row-tb-20">
							
							<c:forEach items="${allGroupBuyInfo}" var="u"> 
							
							<div class="col-sm-6 col-lg-4">
								<div class="deal-single panel">
									<figure
										class="deal-thumbnail embed-responsive embed-responsive-16by9"
										data-bg-img="${u.goodsdetail.goods.goods_pic_url}"
										style="background-image: url(${u.goodsdetail.goods.goods_pic_url});">
										<!-- 计时 -->
										<div class="time-left bottom-15 right-20 font-md-14">
											<span> <i class="ico fa fa-clock-o mr-10"></i> 
											<span class="t-uppercase" data-countdown=" <fmt:formatDate value="${u.group_starttime}" pattern="yyyy-MM-dd HH:mm:ss" />"></span>
											</span>
										</div>
									</figure>
									<div class="bg-white pt-20 pl-20 pr-15">
										<div class="pr-md-6 text-center">

											<h1 class="deal-title mb-10 text-center">${u.goodsdetail.goods.goods_name}</h1>
											<p>${u.goodsdetail.goods.goods_name}</p>
											<div class="deal-price pos-r mb-15 text-center">
												<h1 class="ptb-5 text-center">
													<span class="now-price">${u.group_buy_price}</span> <span
														class="org-price">${u.goodsdetail.prime_price}</span>
												</h1>
												<form method="post" action="selectGroupBuyInfoById.action">
                    								<input name="groupBuyInfoId" type="hidden" value="${u.group_buy_info_id}">
                    								<button class="btn btn-green text-center" type="submit">查看详情</button>
                    							</form>
											</div>

										</div>

									</div>
								</div>
							</div>
							
							</c:forEach>
						
						</div>
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
	<script type="text/javascript"
		src="assets/vendors/countdown/jquery.countdown.js"></script>
	
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- Custom Template JavaScript                   -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<script type="text/javascript" src="assets/lms/main2.js"></script>

</body>
</html>
