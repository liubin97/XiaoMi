<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.8.7
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.7.25
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- PAGE FAVICON                              -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="apple-touch-icon" href="assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="assets/images/logo.png">

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- GOOGLE FONTS                              -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- Include CSS Filess                        -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->

    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Linearicons -->
    <link href="assets/vendors/linearicons/css/linearicons.css" rel="stylesheet">

    <!-- Owl Carousel -->
    <link href="assets/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.theme.min.css" rel="stylesheet">

    <!-- Flex Slider -->
    <link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="assets/liubin/css/mi.base.css" rel="stylesheet">
    <link href="assets/liubin/css/mi.index.css" rel="stylesheet">
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/liubin/css/purchase.css" rel="stylesheet">
</head>
<body class="wide-layout">

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    <!-- 主页开始 -->
    <main id="mainContent" class="main-content">
        <div class="page-container ptb-10">
            <div class="container">
                <div class="section deals-header-area ptb-30">
                    <div class="row row-tb-20">
                        <div class="col-xs-12 col-md-4 col-lg-3">
                            <aside>
                                <ul class="nav-coupon-category panel">
                                    <c:forEach items="categoryList" var="category">
                                        <li><a href="#">Food &amp; Drink</a>
                                        </li>
                                    </c:forEach>
                                    <li class="all-cat">
                                        <a class="font-14" href="category.jsp">全部分类</a>
                                    </li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-xs-12 col-md-8 col-lg-9">
                            <div class="header-deals-slider owl-slider" data-loop="true" data-autoplay="true" data-autoplay-timeout="10000" data-smart-speed="1000" data-nav-speed="false" data-nav="true" data-xxs-items="1" data-xxs-nav="true" data-xs-items="1" data-xs-nav="true" data-sm-items="1" data-sm-nav="true" data-md-items="1" data-md-nav="true" data-lg-items="1" data-lg-nav="true">
                                <div class="deal-single panel item">
                                    <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_01.jpg">
                                        <div class="label-discount top-10 right-10">-50%</div>
                                        <ul class="deal-actions top-10 left-10">
                                            <li class="like-deal">
                                                    <span>
			                        <i class="fa fa-heart"></i>
			                    </span>
                                            </li>
                                            <li class="share-btn">
                                                <div class="share-tooltip fade">
                                                    <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                                </div>
                                                <span><i class="fa fa-share-alt"></i></span>
                                            </li>
                                            <li>
                                                    <span>
			                        <i class="fa fa-camera"></i>
			                    </span>
                                            </li>
                                        </ul>
                                        <div class="deal-about p-20 pos-a bottom-0 left-0">
                                            <div class="rating mb-10">
                                                    <span class="rating-stars" data-rating="5">
			                        <i class="fa fa-star-o star-active"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                    </span>
                                                <span class="rating-reviews color-light">
			                    	( <span class="rating-count">241</span> Reviews )
                                                    </span>
                                            </div>
                                            <h3 class="deal-title mb-10 ">
                                                <a href="deal_single.html" class="color-light color-h-lighter">The Crash Bad Instant Folding Twin Bed</a>
                                            </h3>
                                        </div>
                                    </figure>
                                </div>
                                <div class="deal-single panel item">
                                    <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_02.jpg">
                                        <div class="label-discount top-10 right-10">-30%</div>
                                        <ul class="deal-actions top-10 left-10">
                                            <li class="like-deal">
                                                    <span>
			                        <i class="fa fa-heart"></i>
			                    </span>
                                            </li>
                                            <li class="share-btn">
                                                <div class="share-tooltip fade">
                                                    <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                                </div>
                                                <span><i class="fa fa-share-alt"></i></span>
                                            </li>
                                            <li>
                                                    <span>
			                        <i class="fa fa-camera"></i>
			                    </span>
                                            </li>
                                        </ul>
                                        <div class="deal-about p-20 pos-a bottom-0 left-0">
                                            <div class="rating mb-10">
                                                    <span class="rating-stars" data-rating="5">
			                        <i class="fa fa-star-o star-active"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                    </span>
                                                <span class="rating-reviews color-light">
			                    	( <span class="rating-count">132</span> Reviews )
                                                    </span>
                                            </div>
                                            <h3 class="deal-title mb-10 ">
                                                <a href="deal_single.html" class="color-light color-h-lighter">Western Digital USB 3.0 Hard Drives</a>
                                            </h3>
                                        </div>
                                    </figure>
                                </div>
                                <div class="deal-single panel item">
                                    <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_03.jpg">
                                        <div class="label-discount top-10 right-10">-30%</div>
                                        <ul class="deal-actions top-10 left-10">
                                            <li class="like-deal">
                                                    <span>
			                        <i class="fa fa-heart"></i>
			                    </span>
                                            </li>
                                            <li class="share-btn">
                                                <div class="share-tooltip fade">
                                                    <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                                </div>
                                                <span><i class="fa fa-share-alt"></i></span>
                                            </li>
                                            <li>
                                                    <span>
			                        <i class="fa fa-camera"></i>
			                    </span>
                                            </li>
                                        </ul>
                                        <div class="deal-about p-20 pos-a bottom-0 left-0">
                                            <div class="rating mb-10">
                                                    <span class="rating-stars" data-rating="5">
			                        <i class="fa fa-star-o star-active"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                        <i class="fa fa-star-o"></i>
			                    </span>
                                                <span class="rating-reviews color-light">
			                    	( <span class="rating-count">160</span> Reviews )
                                                    </span>
                                            </div>
                                            <h3 class="deal-title mb-10 ">
                                                <a href="deal_single.html" class="color-light color-h-lighter">Hampton Bay LED Light Ceiling Exhaust Fan</a>
                                            </h3>
                                        </div>
                                    </figure>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="section explain-process-area ptb-30">
                    <div class="row row-rl-10">
                        <div class="col-md-4">
                            <div class="item panel prl-15 ptb-20">
                                <div class="row row-rl-5 row-xs-cell">
                                    <div class="col-xs-4 valign-middle">
                                        <img class="pr-10" src="assets/images/icons/tablet.png" alt="">
                                    </div>
                                    <div class="col-xs-8">
                                        <h5 class="mb-10 pt-5">Deals & Coupons</h5>
                                        <p class="color-mid">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aspernatur.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="item panel prl-15 ptb-20">
                                <div class="row row-rl-5 row-xs-cell">
                                    <div class="col-xs-4 valign-middle">
                                        <img class="pr-10" src="assets/images/icons/online-shop-6.png" alt="">
                                    </div>
                                    <div class="col-xs-8">
                                        <h5 class="mb-10 pt-5">Find Best Offers</h5>
                                        <p class="color-mid">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aspernatur.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="item panel prl-15 ptb-20">
                                <div class="row row-rl-5 row-xs-cell">
                                    <div class="col-xs-4 valign-middle">
                                        <img class="pr-10" src="assets/images/icons/money.png" alt="">
                                    </div>
                                    <div class="col-xs-8">
                                        <h5 class="mb-10 pt-5">Save Money</h5>
                                        <p class="color-mid">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aspernatur.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <section class="section latest-deals-area ptb-30">
                    <header class="panel ptb-15 prl-20 pos-r mb-30">
                        <h3 class="section-title font-18">Latest Deals</h3>
                        <a class="btn btn-o btn-xs pos-a right-10 pos-tb-center">View All</a>
                    </header>

                    <div class="row row-masnory row-tb-20">
                        <div class="col-sm-6 col-lg-4">
                            <div class="deal-single panel">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_01.jpg">
                                    <div class="label-discount left-20 top-15">-50%</div>
                                    <ul class="deal-actions top-15 right-20">
                                        <li class="like-deal">
                                                <span>
                                <i class="fa fa-heart"></i>
                            </span>
                                        </li>
                                        <li class="share-btn">
                                            <div class="share-tooltip fade">
                                                <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                            <span><i class="fa fa-share-alt"></i></span>
                                        </li>
                                        <li>
                                                <span>
                                <i class="fa fa-camera"></i>
                            </span>
                                        </li>
                                    </ul>
                                    <div class="time-left bottom-15 right-20 font-md-14">
                                            <span>
                            <i class="ico fa fa-clock-o mr-10"></i>
                            <span class="t-uppercase" data-countdown="2019/09/01 01:30:00"></span>
                        </span>
                                    </div>
                                    <div class="deal-store-logo">
                                        <img src="assets/images/brands/brand_01.jpg" alt="">
                                    </div>
                                </figure>
                                <div class="bg-white pt-20 pl-20 pr-15">
                                    <div class="pr-md-10">
                                        <div class="rating mb-10">
                                                <span class="rating-stars rate-allow" data-rating="5">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </span>
                                            <span class="rating-reviews">
                                ( <span class="rating-count">241</span> rates )
                                                </span>
                                        </div>
                                        <h3 class="deal-title mb-10">
                                            <a href="deal_single.html">The Crash Bad Instant Folding Twin Bed</a>
                                        </h3>
                                        <ul class="deal-meta list-inline mb-10 color-mid">
                                            <li><i class="ico fa fa-map-marker mr-10"></i>United State</li>
                                            <li><i class="ico fa fa-shopping-basket mr-10"></i>120 Bought</li>
                                        </ul>
                                        <p class="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam nostrum.</p>
                                    </div>
                                    <div class="deal-price pos-r mb-15">
                                        <h3 class="price ptb-5 text-right"><span class="price-sale">$300.00</span>$150.00</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-4">
                            <div class="deal-single panel">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_02.jpg">
                                    <div class="label-discount left-20 top-15">-30%</div>
                                    <ul class="deal-actions top-15 right-20">
                                        <li class="like-deal">
                                                <span>
                                <i class="fa fa-heart"></i>
                            </span>
                                        </li>
                                        <li class="share-btn">
                                            <div class="share-tooltip fade">
                                                <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                            <span><i class="fa fa-share-alt"></i></span>
                                        </li>
                                        <li>
                                                <span>
                                <i class="fa fa-camera"></i>
                            </span>
                                        </li>
                                    </ul>
                                    <div class="time-left bottom-15 right-20 font-md-14">
                                            <span>
                            <i class="ico fa fa-clock-o mr-10"></i>
                            <span class="t-uppercase" data-countdown="2020/10/10 12:25:10"></span>
                        </span>
                                    </div>
                                    <div class="deal-store-logo">
                                        <img src="assets/images/brands/brand_02.jpg" alt="">
                                    </div>
                                </figure>
                                <div class="bg-white pt-20 pl-20 pr-15">
                                    <div class="pr-md-10">
                                        <div class="rating mb-10">
                                                <span class="rating-stars rate-allow" data-rating="3">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </span>
                                            <span class="rating-reviews">
                                ( <span class="rating-count">132</span> rates )
                                                </span>
                                        </div>
                                        <h3 class="deal-title mb-10">
                                            <a href="deal_single.html">Western Digital USB 3.0 Hard Drives</a>
                                        </h3>
                                        <ul class="deal-meta list-inline mb-10 color-mid">
                                            <li><i class="ico fa fa-map-marker mr-10"></i>United Kingdom</li>
                                            <li><i class="ico fa fa-shopping-basket mr-10"></i>42 Bought</li>
                                        </ul>
                                        <p class="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam nostrum.</p>
                                    </div>
                                    <div class="deal-price pos-r mb-15">
                                        <h3 class="price ptb-5 text-right"><span class="price-sale">$150.00</span>$100.00</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-4">
                            <div class="deal-single panel">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_03.jpg">
                                    <div class="label-discount left-20 top-15">-30%</div>
                                    <ul class="deal-actions top-15 right-20">
                                        <li class="like-deal">
                                                <span>
                                <i class="fa fa-heart"></i>
                            </span>
                                        </li>
                                        <li class="share-btn">
                                            <div class="share-tooltip fade">
                                                <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                            <span><i class="fa fa-share-alt"></i></span>
                                        </li>
                                        <li>
                                                <span>
                                <i class="fa fa-camera"></i>
                            </span>
                                        </li>
                                    </ul>
                                    <div class="time-left bottom-15 right-20 font-md-14">
                                            <span>
                            <i class="ico fa fa-clock-o mr-10"></i>
                            <span class="t-uppercase" data-countdown="2020/10/10 12:25:10"></span>
                        </span>
                                    </div>
                                    <div class="deal-store-logo">
                                        <img src="assets/images/brands/brand_03.jpg" alt="">
                                    </div>
                                </figure>
                                <div class="bg-white pt-20 pl-20 pr-15">
                                    <div class="pr-md-10">
                                        <div class="rating mb-10">
                                                <span class="rating-stars rate-allow" data-rating="4">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </span>
                                            <span class="rating-reviews">
                                ( <span class="rating-count">160</span> rates )
                                                </span>
                                        </div>
                                        <h3 class="deal-title mb-10">
                                            <a href="deal_single.html">Hampton Bay LED Light Ceiling Exhaust Fan</a>
                                        </h3>
                                        <ul class="deal-meta list-inline mb-10 color-mid">
                                            <li><i class="ico fa fa-map-marker mr-10"></i>Australia</li>
                                            <li><i class="ico fa fa-shopping-basket mr-10"></i>75 Bought</li>
                                        </ul>
                                        <p class="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam nostrum.</p>
                                    </div>
                                    <div class="deal-price pos-r mb-15">
                                        <h3 class="price ptb-5 text-right"><span class="price-sale">$300.00</span>$150.00</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-4">
                            <div class="deal-single panel">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_04.jpg">
                                    <div class="label-discount left-20 top-15">-15%</div>
                                    <ul class="deal-actions top-15 right-20">
                                        <li class="like-deal">
                                                <span>
                                <i class="fa fa-heart"></i>
                            </span>
                                        </li>
                                        <li class="share-btn">
                                            <div class="share-tooltip fade">
                                                <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                            <span><i class="fa fa-share-alt"></i></span>
                                        </li>
                                        <li>
                                                <span>
                                <i class="fa fa-camera"></i>
                            </span>
                                        </li>
                                    </ul>
                                    <div class="time-left bottom-15 right-20 font-md-14">
                                            <span>
                            <i class="ico fa fa-clock-o mr-10"></i>
                            <span class="t-uppercase" data-countdown="2018/01/02 10:35:23"></span>
                        </span>
                                    </div>
                                    <div class="deal-store-logo">
                                        <img src="assets/images/brands/brand_04.jpg" alt="">
                                    </div>
                                </figure>
                                <div class="bg-white pt-20 pl-20 pr-15">
                                    <div class="pr-md-10">
                                        <div class="rating mb-10">
                                                <span class="rating-stars rate-allow" data-rating="2">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </span>
                                            <span class="rating-reviews">
                                ( <span class="rating-count">100</span> rates )
                                                </span>
                                        </div>
                                        <h3 class="deal-title mb-10">
                                            <a href="deal_single.html">Timberland Men's Thorton Waterproof Boots</a>
                                        </h3>
                                        <ul class="deal-meta list-inline mb-10 color-mid">
                                            <li><i class="ico fa fa-map-marker mr-10"></i>Canada</li>
                                            <li><i class="ico fa fa-shopping-basket mr-10"></i>10 Bought</li>
                                        </ul>
                                        <p class="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam nostrum.</p>
                                    </div>
                                    <div class="deal-price pos-r mb-15">
                                        <h3 class="price ptb-5 text-right"><span class="price-sale">$380.00</span>$340.00</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-4">
                            <div class="deal-single panel">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_05.jpg">
                                    <div class="label-discount left-20 top-15">-60%</div>
                                    <ul class="deal-actions top-15 right-20">
                                        <li class="like-deal">
                                                <span>
                                <i class="fa fa-heart"></i>
                            </span>
                                        </li>
                                        <li class="share-btn">
                                            <div class="share-tooltip fade">
                                                <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                            <span><i class="fa fa-share-alt"></i></span>
                                        </li>
                                        <li>
                                                <span>
                                <i class="fa fa-camera"></i>
                            </span>
                                        </li>
                                    </ul>
                                    <div class="time-left bottom-15 right-20 font-md-14">
                                            <span>
                            <i class="ico fa fa-clock-o mr-10"></i>
                            <span class="t-uppercase" data-countdown="2021/12/03 03:15:00"></span>
                        </span>
                                    </div>
                                    <div class="deal-store-logo">
                                        <img src="assets/images/brands/brand_05.jpg" alt="">
                                    </div>
                                </figure>
                                <div class="bg-white pt-20 pl-20 pr-15">
                                    <div class="pr-md-10">
                                        <div class="rating mb-10">
                                                <span class="rating-stars rate-allow" data-rating="3">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </span>
                                            <span class="rating-reviews">
                                ( <span class="rating-count">32</span> rates )
                                                </span>
                                        </div>
                                        <h3 class="deal-title mb-10">
                                            <a href="deal_single.html">New and Refurbished Lenovo Laptops</a>
                                        </h3>
                                        <ul class="deal-meta list-inline mb-10 color-mid">
                                            <li><i class="ico fa fa-map-marker mr-10"></i>United State</li>
                                            <li><i class="ico fa fa-shopping-basket mr-10"></i>65 Bought</li>
                                        </ul>
                                        <p class="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam nostrum.</p>
                                    </div>
                                    <div class="deal-price pos-r mb-15">
                                        <h3 class="price ptb-5 text-right"><span class="price-sale">$700.00</span>$576.00</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-4">
                            <div class="deal-single panel">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/deals/deal_06.jpg">
                                    <div class="label-discount left-20 top-15">-60%</div>
                                    <ul class="deal-actions top-15 right-20">
                                        <li class="like-deal">
                                                <span>
                                <i class="fa fa-heart"></i>
                            </span>
                                        </li>
                                        <li class="share-btn">
                                            <div class="share-tooltip fade">
                                                <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                                                <a target="_blank" href="#"><i class="fa fa-pinterest"></i></a>
                                            </div>
                                            <span><i class="fa fa-share-alt"></i></span>
                                        </li>
                                        <li>
                                                <span>
                                <i class="fa fa-camera"></i>
                            </span>
                                        </li>
                                    </ul>
                                    <div class="time-left bottom-15 right-20 font-md-14">
                                            <span>
                            <i class="ico fa fa-clock-o mr-10"></i>
                            <span class="t-uppercase" data-countdown="2019/10/10 12:00:00"></span>
                        </span>
                                    </div>
                                    <div class="deal-store-logo">
                                        <img src="assets/images/brands/brand_06.jpg" alt="">
                                    </div>
                                </figure>
                                <div class="bg-white pt-20 pl-20 pr-15">
                                    <div class="pr-md-10">
                                        <div class="rating mb-10">
                                                <span class="rating-stars rate-allow" data-rating="5">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </span>
                                            <span class="rating-reviews">
                                ( <span class="rating-count">29</span> rates )
                                                </span>
                                        </div>
                                        <h3 class="deal-title mb-10">
                                            <a href="deal_single.html">Buying a TV Is Easy When You Know These Terms</a>
                                        </h3>
                                        <ul class="deal-meta list-inline mb-10 color-mid">
                                            <li><i class="ico fa fa-map-marker mr-10"></i>United Kingdom</li>
                                            <li><i class="ico fa fa-shopping-basket mr-10"></i>134 Bought</li>
                                        </ul>
                                        <p class="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam numquam nostrum.</p>
                                    </div>
                                    <div class="deal-price pos-r mb-15">
                                        <h3 class="price ptb-5 text-right"><span class="price-sale">$300.00</span>$250.00</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <section class="section latest-coupons-area ptb-30">
                    <header class="panel ptb-15 prl-20 pos-r mb-30">
                        <h3 class="section-title font-18">Latest Deals</h3>
                        <a class="btn btn-o btn-xs pos-a right-10 pos-tb-center">View All</a>
                    </header>

                    <div class="latest-coupons-slider owl-slider" data-autoplay-hover-pause="true" data-loop="true" data-autoplay="true" data-smart-speed="1000" data-autoplay-timeout="10000" data-margin="30" data-nav-speed="false" data-items="1" data-xxs-items="1" data-xs-items="2" data-sm-items="2" data-md-items="3" data-lg-items="4">
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">
                                <div class="ribbon-wrapper is-hidden-xs-down">
                                    <div class="ribbon">Featured</div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo" src="assets/images/coupons/coupon_01.jpg" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">
                                            <ul class="deal-meta list-inline mb-10">
                                                <li class="color-green"><i class="ico lnr lnr-smile mr-5"></i>Verifed</li>
                                                <li class="color-muted"><i class="ico lnr lnr-users mr-5"></i>125 Used</li>
                                            </ul>
                                            <h4 class="color-green mb-10 t-uppercase">10% OFF</h4>
                                            <h5 class="deal-title mb-10">
                                                <a href="#">10% off select XPS & Alienware laptops</a>
                                            </h5>
                                            <p class="mb-15 color-muted mb-20 font-12"><i class="lnr lnr-clock mr-10"></i>Expires On 01/01/2018</p>
                                            <div class="showcode" data-toggle-class="coupon-showen" data-toggle-event="click">
                                                <button class="show-code btn btn-sm btn-block" data-toggle="modal" data-target="#coupon_01">Get Coupon Code</button>
                                                <div class="coupon-hide">X455-17GT-OL58</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo" src="assets/images/coupons/coupon_02.jpg" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">
                                            <ul class="deal-meta list-inline mb-10">
                                                <li class="color-muted"><i class="ico fa fa-map-marker mr-5"></i>California</li>
                                                <li class="color-muted"><i class="ico lnr lnr-users mr-5"></i>13 Used</li>
                                            </ul>
                                            <h4 class="color-green mb-10 t-uppercase">15% OFF</h4>
                                            <h5 class="deal-title mb-10">
                                                <a href="#">15% off 2 select Amazon Fire cases</a>
                                            </h5>
                                            <p class="mb-15 color-muted mb-20 font-12"><i class="lnr lnr-clock mr-10"></i>Expires On 05/02/2018</p>
                                            <div class="showcode" data-toggle-class="coupon-showen" data-toggle-event="click">
                                                <button class="show-code btn btn-sm btn-block" data-toggle="modal" data-target="#coupon_02">Show Code</button>
                                                <div class="coupon-hide">X455-17GT-OL58</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo" src="assets/images/coupons/coupon_03.jpg" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">
                                            <ul class="deal-meta list-inline mb-10">
                                                <li class="color-muted"><i class="ico fa fa-tag mr-5"></i>Coupon</li>
                                                <li class="color-muted"><i class="ico lnr lnr-users mr-5"></i>425 Used</li>
                                            </ul>
                                            <h4 class="color-green mb-10 t-uppercase">20% OFF</h4>
                                            <h5 class="deal-title mb-10">
                                                <a href="#">Flat 40% off hotel bookings in 10 cities</a>
                                            </h5>
                                            <p class="mb-15 color-muted mb-20 font-12"><i class="lnr lnr-clock mr-10"></i>Expires On 15/01/2018</p>
                                            <div class="showcode" data-toggle-class="coupon-showen" data-toggle-event="click">
                                                <button class="show-code btn btn-sm btn-block" data-toggle="modal" data-target="#coupon_03">See Sale</button>
                                                <div class="coupon-hide">X455-17GT-OL58</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo" src="assets/images/coupons/coupon_04.jpg" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">
                                            <ul class="deal-meta list-inline mb-10">
                                                <li class="color-green"><i class="ico lnr lnr-smile mr-5"></i>Verifed</li>
                                                <li class="color-muted"><i class="ico lnr lnr-users mr-5"></i>230 Used</li>
                                            </ul>
                                            <h4 class="color-green mb-10 t-uppercase">30% OFF</h4>
                                            <h5 class="deal-title mb-10">
                                                <a href="#">There is no place like home 25% off</a>
                                            </h5>
                                            <p class="mb-15 color-muted mb-20 font-12"><i class="lnr lnr-clock mr-10"></i>Expires On 02/03/2018</p>
                                            <div class="showcode" data-toggle-class="coupon-showen" data-toggle-event="click">
                                                <button class="show-code btn btn-sm btn-block" data-toggle="modal" data-target="#coupon_04">Print Code</button>
                                                <div class="coupon-hide">X455-17GT-OL58</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">
                                <div class="ribbon-wrapper is-hidden-xs-down">
                                    <div class="ribbon">Featured</div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo" src="assets/images/coupons/coupon_05.jpg" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">
                                            <ul class="deal-meta list-inline mb-10">
                                                <li class="color-muted"><i class="ico fa fa-tag mr-5"></i>Coupon</li>
                                                <li class="color-muted"><i class="ico lnr lnr-users mr-5"></i>86 Used</li>
                                            </ul>
                                            <h4 class="color-green mb-10 t-uppercase">10% OFF</h4>
                                            <h5 class="deal-title mb-10">
                                                <a href="#">10% off $399+ refurbished laptops</a>
                                            </h5>
                                            <p class="mb-15 color-muted mb-20 font-12"><i class="lnr lnr-clock mr-10"></i>Expires On 20/02/2018</p>
                                            <div class="showcode" data-toggle-class="coupon-showen" data-toggle-event="click">
                                                <button class="show-code btn btn-sm btn-block" data-toggle="modal" data-target="#coupon_05">Show Code</button>
                                                <div class="coupon-hide">X455-17GT-OL58</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo" src="assets/images/coupons/coupon_06.jpg" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">
                                            <ul class="deal-meta list-inline mb-10">
                                                <li class="color-green"><i class="ico lnr lnr-smile mr-5"></i>Verifed</li>
                                                <li class="color-muted"><i class="ico lnr lnr-users mr-5"></i>24 Used</li>
                                            </ul>
                                            <h4 class="color-green mb-10 t-uppercase">25% OFF</h4>
                                            <h5 class="deal-title mb-10">
                                                <a href="#">There is no place like home 25% off</a>
                                            </h5>
                                            <p class="mb-15 color-muted mb-20 font-12"><i class="lnr lnr-clock mr-10"></i>Expires On 14/01/2018</p>
                                            <div class="showcode" data-toggle-class="coupon-showen" data-toggle-event="click">
                                                <button class="show-code btn btn-sm btn-block" data-toggle="modal" data-target="#coupon_06">Show Coupon</button>
                                                <div class="coupon-hide">X455-17GT-OL58</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                    </div>
                </section>
                <section class="section stores-area stores-area-v1 ptb-30">
                    <header class="panel ptb-15 prl-20 pos-r mb-30">
                        <h3 class="section-title font-18">Popular Stores</h3>
                        <a href="stores_01.html" class="btn btn-o btn-xs pos-a right-10 pos-tb-center">All Stores</a>
                    </header>
                    <div class="popular-stores-slider owl-slider" data-loop="true" data-autoplay="true" data-smart-speed="1000" data-autoplay-timeout="10000" data-margin="20" data-items="2" data-xxs-items="2" data-xs-items="2" data-sm-items="3" data-md-items="5" data-lg-items="6">
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_01.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">Amazon</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_02.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">Ashford</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_03.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">DELL</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_04.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">Card Cash</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_05.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">Finish Line</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_06.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">JC Penny</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_07.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">Callaway Golf</h6>
                            </a>
                        </div>
                        <div class="store-item t-center">
                            <a href="store_single_01.html" class="panel is-block">
                                <div class="embed-responsive embed-responsive-4by3">
                                    <div class="store-logo">
                                        <img src="assets/images/brands/brand_08.jpg" alt="">
                                    </div>
                                </div>
                                <h6 class="store-name ptb-10">Car Toys</h6>
                            </a>
                        </div>
                    </div>
                </section>


                <section class="section latest-news-area blog-area blog-grid blog-3-col ptb-30">
                    <header class="panel ptb-15 prl-20 pos-r mb-30">
                        <h3 class="section-title font-18">Latest News</h3>
                        <a href="blog_classic_right_sidebar.html" class="btn btn-o btn-xs pos-a right-10 pos-tb-center">Visit Blog</a>
                    </header>

                    <div class="row row-tb-20">

                        <!-- Blog Post -->
                        <div class="blog-post col-xs-12 col-sm-6 col-md-4">
                            <article class="entry panel">
                                <figure class="entry-media post-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="assets/images/blog/post_01.jpg">
                                    <div class="entry-date">
                                        <h4>13</h4>
                                        <h6>JUN</h6>
                                    </div>
                                </figure>
                                <div class="entry-wrapper pt-20 pb-10 prl-20">
                                    <header class="entry-header">
                                        <h4 class="entry-title mb-10 mb-md-15 font-xs-16 font-sm-18 font-md-16 font-lg-16">
                                            <a href="blog_single_standard.html">Restaurant Employer Read Clients Orders On His iPad</a>
                                        </h4>
                                        <div class="entry-meta mb-10">
                                            <ul class="tag-info list-inline">
                                                <li><i class="icon fa fa-user"></i> By : John Doe</li>
                                                <li><i class="icon fa fa-comments"></i>14 Comments </li>
                                            </ul>
                                        </div>
                                    </header>
                                    <div class="entry-content">
                                        <p class="entry-summary">Vivamus sem massa, cursus at mollis eu, euismod id risus. Vestibulum nunc ante, sagittis ut nisl at, porta porttitor justo. Nam imperdiet im...</p>
                                    </div>
                                    <footer class="entry-footer text-right">
                                        <a href="blog_single_standard.html" class="more-link btn btn-link">Continue reading <i class="icon fa fa-long-arrow-right"></i></a>
                                    </footer>
                                </div>
                            </article>
                        </div>
                        <!-- End Blog Post -->

                        <!-- Blog Post -->
                        <div class="blog-post col-xs-12 col-sm-6 col-md-4">
                            <article class="entry panel">
                                <figure class="entry-media embed-responsive embed-responsive-16by9">
                                    <iframe src="https://player.vimeo.com/video/28786762?portrait=0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                    <div class="entry-date">
                                        <h4>13</h4>
                                        <h6>JUN</h6>
                                    </div>
                                </figure>
                                <div class="entry-wrapper pt-20 pb-10 prl-20">
                                    <header class="entry-header">
                                        <h4 class="entry-title mb-10 mb-md-15 font-xs-16 font-sm-18 font-md-16 font-lg-16">
                                            <a href="blog_single_vimeo.html">Amazing Classic Interior Design With Perfect Lighting</a>
                                        </h4>
                                        <div class="entry-meta mb-10">
                                            <ul class="tag-info list-inline">
                                                <li><i class="icon fa fa-user"></i> By : John Doe</li>
                                                <li><i class="icon fa fa-comments"></i> 14 Comments </li>
                                            </ul>
                                        </div>
                                    </header>
                                    <div class="entry-content">
                                        <p class="entry-summary">Vivamus sem massa, cursus at mollis eu, euismod id risus. Vestibulum nunc ante, sagittis ut nisl at, porta porttitor justo. Nam imperdiet im...</p>
                                    </div>
                                    <footer class="entry-footer text-right">
                                        <a href="blog_single_vimeo.html" class="more-link btn btn-link">Continue reading <i class="icon fa fa-long-arrow-right"></i></a>
                                    </footer>
                                </div>
                            </article>
                        </div>
                        <!-- End Blog Post -->

                        <!-- Blog Post -->
                        <div class="blog-post col-xs-12 col-sm-6 col-md-4">
                            <article class="entry panel">
                                <figure class="entry-media embed-responsive embed-responsive-16by9">
                                    <iframe src="https://www.youtube.com/embed/mcixldqDIEQ?v=mcixldqDIEQ" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                    <div class="entry-date">
                                        <h4>13</h4>
                                        <h6>JUN</h6>
                                    </div>
                                </figure>
                                <div class="entry-wrapper pt-20 pb-10 prl-20">
                                    <header class="entry-header">
                                        <h4 class="entry-title mb-10 mb-md-15 font-xs-16 font-sm-18 font-md-16 font-lg-16">
                                            <a href="blog_single_youtube.html">English Breakfast Tea With Tasty Donut Desserts</a>
                                        </h4>
                                        <div class="entry-meta mb-10">
                                            <ul class="tag-info list-inline">
                                                <li><i class="icon fa fa-user"></i> By : John Doe</li>
                                                <li><i class="icon fa fa-comments"></i> 14 Comments </li>
                                            </ul>
                                        </div>
                                    </header>
                                    <div class="entry-content">
                                        <p class="entry-summary">Vivamus sem massa, cursus at mollis eu, euismod id risus. Vestibulum nunc ante, sagittis ut nisl at, porta porttitor justo. Nam imperdiet im...</p>
                                    </div>
                                    <footer class="entry-footer text-right">
                                        <a href="blog_single_youtube.html" class="more-link btn btn-link">Continue reading <i class="icon fa fa-long-arrow-right"></i></a>
                                    </footer>
                                </div>
                            </article>
                        </div>
                        <!-- End Blog Post -->

                    </div>
                </section>


                <section class="section subscribe-area ptb-40 t-center">
                    <div class="newsletter-form">
                        <h4 class="mb-20"><i class="fa fa-envelope-o color-green mr-10"></i>Sign up for our weekly email newsletter</h4>
                        <p class="mb-20 color-mid">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi animi magni accusantium architecto possimus.</p>
                        <form method="post" action="#">
                            <div class="input-group mb-10">
                                <input type="email" class="form-control bg-white" placeholder="Email Address" required="required">
                                <span class="input-group-btn">
                                        <button class="btn" type="submit">Subscribe</button>
                                    </span>
                            </div>
                        </form>
                        <p class="color-muted"><small>We’ll never share your email address with a third-party.</small> </p>
                    </div>
                </section>
            </div>
        </div>

    </main>
    <c:import url="footer.jsp"/>
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
<script type="text/javascript" src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>

<!-- FlexSlider -->
<script type="text/javascript" src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>

<!-- Coutdown -->
<script type="text/javascript" src="assets/vendors/countdown/jquery.countdown.js"></script>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- Custom Template JavaScript                   -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<script type="text/javascript" src="assets/js/main.js"></script>
<script type="text/javascript" src="assets/liubin/js/purchase.js"></script>

</body>
</html>

