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


		<main id="mainContent" class="main-content">
		<div class="page-container">
			<div class="container">
				<div class="cart-area ptb-60">
					<div class="container">
						<div class="cart-wrapper">
							<h3 class="h-title mb-30 t-uppercase">团信息列表</h3>

							<table id="cart_list" class="cart-list mb-30 text-center">

								<tbody>
									<c:forEach items="${resultGroupBuyInfo.groupList}"
										var="grouplist">
										<tr class="panel alert">
											<td>团id:${grouplist.group_id}</td>

											<td>
												<table cart-list mb-30>
													<c:forEach items="${grouplist.groupers}" var="grouper">

														<tr>
															<td>
																<table cart-list mb-30>
																	<tr>
																		<td>
																			<figure class="product-thumb">
																				<img src="${grouper.imgurl}">
																			</figure>
																		</td>
																	</tr>
																	<tr>
																		<td>${grouper.nickname}</td>
																	</tr>
																</table>

															</td>
														</tr>
													</c:forEach>
												</table>
											</td>
											<td class="addGroup"><a href="javascript:void(0);"
												id="${grouplist.group_id}"> 加入团 <span class="groupId"
													style="display: none">${grouplist.group_id}</span> <span
													class="groupBuyInfoId" style="display: none">${resultGroupBuyInfo.group_buy_info_id}</span>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div class="cart-price">
								<div class="t-right">
									<a id="stockEnough" href="javascript:void(0);"
										class="btn btn-rounded btn-lg">发起团 <span id="group_num"
										style="display: none">${resultGroupBuyInfo.group_num}</span> <span
										id="goods_detail_id" style="display: none">${resultGroupBuyInfo.goods_detail_id}</span>
										<span id="groupBuyInfoId" style="display: none">${resultGroupBuyInfo.group_buy_info_id}</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		</main>

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
	<script type="text/javascript" src="assets/lms/selectAllGroup.js"></script>

	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<!-- Custom Template JavaScript                   -->
	<!-- ––––––––––––––––––––––––––––––––––––––––– -->
	<script type="text/javascript" src="assets/js/main.js"></script>
	

</body>
</html>
