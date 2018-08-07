<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="assets/js/jquery-1.12.3.min.js"></script>
<script src="assets/js/header.js"></script>
<style>
.redpoint{
  display:inline-block;
  height:16px;
  width:16px;
  line-height:16px;
  text-align:center;
  font-size:0.1em;
  border-radius:16px;
  color:#fff;
  background:red;
    position: relative;
    top: -3px;
    right: 8px;
}
</style>
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
                        <li><a href="signin.html"><i class="fa fa-user"></i>登陆</a>
                        </li>
                        <li><a href="signup.html"><i class="fa fa-edit"></i>注册</a>
                        </li>
                           <li><a href="selectByTypeFlag.action?read_flag=0"><i class="fa fa-comments"></i>消息中心</a>
                          
                        </li>
                         <span class="redpoint" id="redpoint">0</span>
                        <li>
                            <a href="user.jsp"><i class="fa fa-user"></i>个人中心<i class="fa fa-caret-down"></i></a>
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
                                <a href="searchCart.action">
                                    <span class="icon lnr lnr-cart"></span>
                                    <div><span class="cart-number" id="cartnum">0</span>
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
                            <ul id="allCategoryList">

                            </ul>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="#">小米手机</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="goods/小米8/4.png">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="#">电视</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="goods/小米8/4.png">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="#">笔记本</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="goods/小米8/4.png">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-mega-menu">
                            <a href="#">盒子</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="goods/小米8/4.png">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
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
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="goods/小米8/4.png">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
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
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="goods/小米8/4.png">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
                                                </h6>
                                            </div>
                                        </figure>
                                    </div>
                                    <div class="col-md-2">
                                        <figure class="deal-thumbnail embed-responsive embed-responsive-4by3" data-bg-img="assets/images/deals/deal_03.jpg">
                                            <div class="deal-about p-10 pos-a bottom-0 left-0">
                                                <h6 class="deal-title mb-10">
                                                    <a href="deal_single.html" class="color-lighter">小米</a>
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

