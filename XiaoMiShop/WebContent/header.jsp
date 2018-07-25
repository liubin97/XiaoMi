<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="assets/js/header.js" rel="stylesheet">
<!-- Preloader -->
<div id="preloader" class="preloader">
    <div class="loader-cube">
        <div class="loader-cube__item1 loader-cube__item"></div>
        <div class="loader-cube__item2 loader-cube__item"></div>
        <div class="loader-cube__item4 loader-cube__item"></div>
        <div class="loader-cube__item3 loader-cube__item"></div>
    </div>
</div>
<!-- End Preloader -->

<!-- –––––––––––––––[ HEADER ]––––––––––––––– -->
<header id="mainHeader" class="main-header">

    <!-- Top Bar -->
    <div class="top-bar bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-4 is-hidden-sm-down">
                    <ul class="nav-top nav-top-left list-inline t-left">
                        <li><a href="index.html"><i class="fa fa-home"></i>小米商城</a>
                        </li>

                    </ul>
                </div>
                <div class="col-sm-12 col-md-8">
                    <ul class="nav-top nav-top-right list-inline t-xs-center t-md-right">
                        <!--<li>
                            <a href="#"><i class="fa fa-flag-usa"></i>English <i class="fa fa-caret-down"></i></a>
                            <ul>
                                <li><a href="#"><i class="fa fa-flag-usa"></i>English</a>
                                </li>
                                <li><a href="#"><i class="fa fa-flag-fra"></i>France</a>
                                </li>
                                <li><a href="#"><i class="fa fa-flag-ger"></i>Germany</a>
                                </li>
                                <li><a href="#"><i class="fa fa-flag-rus"></i>Russia</a>
                                </li>
                            </ul>
                        </li>-->
                        <!--<li>
                            <a href="#"><i class="fa fa-usd"></i>USD <i class="fa fa-caret-down"></i></a>
                            <ul>
                                <li><a href="#">USD - US Dollar</a>
                                </li>
                                <li><a href="#">EUR - Euro</a>
                                </li>
                                <li><a href="#">CNY - Chinese Yuan</a>
                                </li>
                                <li><a href="#">RUB - Russian Ruble</a>
                                </li>
                            </ul>
                        </li>-->
                        <li><a href="signin.html"><i class="fa fa-user"></i>登陆</a>
                        </li>
                        <li><a href="signup.html"><i class="fa fa-edit"></i>注册</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-user"></i>个人中心<i class="fa fa-caret-down"></i></a>
                            <ul>
                                <li><a href="#">个人中心</a>
                                </li>
                                <li><a href="#">评价晒单</a>
                                </li>
                                <li><a href="#">我的喜欢</a>
                                </li>
                                <li><a href="#">退出登陆</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Top Bar -->

    <!-- Header Header -->
    <div class="header-header bg-white">
        <div class="container">
            <div class="row row-rl-0 row-tb-20 row-md-cell">
                <div class="brand col-md-3 t-xs-center t-md-left valign-middle">
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="" width="50">
                    </a>
                </div>
                <div class="header-search col-md-9">
                    <div class="row row-tb-10 ">
                        <div class="col-sm-8">
                            <form class="search-form">
                                <div class="input-group">
                                    <input type="text" class="form-control input-lg search-input" placeholder="请输入关键字..." required="required">
                                    <div class="input-group-btn">
                                        <div class="input-group">

                                            <div class="input-group-btn">
                                                <button type="submit" class="btn btn-lg btn-search btn-block">
                                                    <i class="fa fa-search font-16"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-4 t-xs-center t-md-right">
                            <div class="header-cart">
                                <a href="cart.html">
                                    <span class="icon lnr lnr-cart"></span>
                                    <div><span class="cart-number">0</span>
                                    </div>
                                    <span class="title">Cart</span>
                                </a>
                            </div>
                            <!--<div class="header-wishlist ml-20">
                                <a href="wishlist.html">
                                    <span class="icon lnr lnr-heart font-30"></span>
                                    <span class="title">我的收藏</span>
                                </a>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Header -->

    <!-- Header Menu -->
    <div class="header-menu bg-blue">
        <div class="container">
            <nav class="nav-bar">
                <div class="nav-header">
                            <span class="nav-toggle" data-toggle="#header-navbar">
		                        <i></i>
		                        <i></i>
		                        <i></i>
		                    </span>
                </div>
                <div id="header-navbar" class="nav-collapse">
                    <ul class="nav-menu">
                        <li>
                            <a href="category.jsp">全部商品分类</a>
                            <%--<ul>
                                <li class="list-item">
                                    <a href="checkout_method.html">手机</a>
                                    <div class="category-item">
                                        <ul class="col-md-3">
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                        </ul>
                                        <ul class="col-md-3">
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                        </ul>
                                        <ul class="col-md-3">
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                        </ul>
                                    </div>


                                </li>
                            </ul>--%>
                            <ul>
                                <li class="list-item">
                                    <a href="#">小米手机</a>
                                    <div class="category-item">
                                        <ul class="col-md-3">
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                        </ul>
                                        <ul class="col-md-3">
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                        </ul>
                                        <ul class="col-md-3">
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                            <li><a>1</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a class="font-14" href="#">电脑</a>
                                </li>
                                <li>
                                    <a class="font-14" href="#">电视</a>
                                </li>
                                <li>
                                    <a class="font-14" href="#">生活配件</a>
                                </li>
                                <li>
                                    <a class="font-14" href="#">生活配件</a>
                                </li>
                                <li>
                                    <a class="font-14" href="#">生活配件</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="deals_grid.html">小米手机</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_04.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="3">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_05.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="5">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="coupons_grid.html">电视</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_04.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="3">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_05.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="5">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="stores_01.html">笔记本</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_04.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="3">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_05.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="5">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="contact_us_01.html">盒子</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_04.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="3">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_05.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="5">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="#">路由器</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_04.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="3">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_05.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="5">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="#">智能硬件</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="label-discount top-10 right-10">-15%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="2">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_04.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="3">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-3">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_05.jpg">
                                            <div class="label-discount top-10 right-10">-60%</div>
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <div class="rating mb-10">
                                                            <span class="rating-stars rate-allow" data-rating="5">
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                        <i class="fa fa-star-o"></i>
										                    </span>
                                                </div>
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">Aenean ut orci vel massa</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <!-- End Header Menu -->

</header>
<!-- –––––––––––––––[ HEADER ]––––––––––––––– -->

