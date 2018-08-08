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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <meta name="description"
          content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
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
    <!--倒计时样式-->
    <link rel="stylesheet" href="assets/css/killtime.css">
</head>
<body class="wide-layout">

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    <!-- 主页开始 -->

    <div class="page-container ptb-10">
        <div class="container">
            <div class="section deals-header-area ptb-30">
                <div class="row row-tb-20">
                    <div class="col-xs-12 col-md-4 col-lg-3">
                        <aside>
                            <ul class="nav-coupon-category panel">
                                <c:forEach items="${categoryList}" var="category">
                                    <li class="all-cat">
                                        <a class="font-14"
                                           href="getCategoryGoods.action?category_id=${category.goods_category_id}">
                                            <i class="fa fa-cutlery"></i>${category.category_name}<span>${category.goodsList.size()}</span></a>
                                    </li>
                                </c:forEach>
                                <li class="all-cat">
                                    <a class="font-14" href="category.jsp">全部分类</a>
                                </li>
                            </ul>
                        </aside>
                    </div>
                    <div class="col-xs-12 col-md-8 col-lg-9">
                        <div class="header-deals-slider owl-slider" data-loop="true" data-autoplay="true"
                             data-autoplay-timeout="10000" data-smart-speed="1000" data-nav-speed="false"
                             data-nav="true" data-xxs-items="1" data-xxs-nav="true" data-xs-items="1" data-xs-nav="true"
                             data-sm-items="1" data-sm-nav="true" data-md-items="1" data-md-nav="true" data-lg-items="1"
                             data-lg-nav="true">
                            <div class="deal-single panel item">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9"
                                        data-bg-img="assets/images/deals/deal_01.jpg">
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
                                            <a href="deal_single.html" class="color-light color-h-lighter">The Crash Bad
                                                Instant Folding Twin Bed</a>
                                        </h3>
                                    </div>
                                </figure>
                            </div>
                            <div class="deal-single panel item">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9"
                                        data-bg-img="assets/images/deals/deal_02.jpg">
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
                                            <a href="deal_single.html" class="color-light color-h-lighter">Western
                                                Digital USB 3.0 Hard Drives</a>
                                        </h3>
                                    </div>
                                </figure>
                            </div>
                            <div class="deal-single panel item">
                                <figure class="deal-thumbnail embed-responsive embed-responsive-16by9"
                                        data-bg-img="assets/images/deals/deal_03.jpg">
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
                                            <a href="deal_single.html" class="color-light color-h-lighter">Hampton Bay
                                                LED Light Ceiling Exhaust Fan</a>
                                        </h3>
                                    </div>
                                </figure>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- 秒杀 -->
            <section class="section latest-coupons-area ptb-30">
                <header class="panel ptb-15 prl-20 pos-r mb-30">

                    <h3 class="section-title font-18">
                        <span class="iconfont icon-miaosha" style="font-size:24px;color: darkred"></span>&nbsp;&nbsp;
                        小米闪购 &nbsp;&nbsp; &nbsp;距离&nbsp;&nbsp;<span style="color: red"><fmt:formatDate
                            value="${seckillList[0].seckill_starttime}" pattern="HH:mm"/> </span>&nbsp;场 &nbsp;还有
                        <span id="killTime">
                                <span class="box">00</span>
                                <span class="dosh">:</span>
                                <span class="box">00</span>
                                <span class="dosh">:</span>
                                <span class="box">00</span>
                        </span>
                    </h3>
                    <a class="btn btn-o btn-xs pos-a right-10 pos-tb-center" href="seckill/list">查看更多</a>
                </header>

                <div class="latest-coupons-slider owl-slider" data-autoplay-hover-pause="true" data-loop="true"
                     data-autoplay="true" data-smart-speed="1000" data-autoplay-timeout="10000" data-margin="30"
                     data-nav-speed="false" data-items="1" data-xxs-items="1" data-xs-items="2" data-sm-items="2"
                     data-md-items="3" data-lg-items="4">

                    <c:forEach items="${seckillList}" var="sd">
                        <div class="coupon-item">
                            <a href="seckill/list">
                                <div class="coupon-single panel t-center">

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="text-center p-20">
                                                <img class="store-logo"
                                                     src="${pageContext.request.contextPath}/assets/images/coupons/coupon_01.jpg"
                                                     alt="">
                                            </div>
                                            <!-- end media -->
                                        </div>
                                        <!-- end col -->

                                        <div class="col-xs-12">
                                            <div class="panel-body">

                                                <h4 class=" mb-10 t-uppercase">${sd.goods_name}</h4>
                                                <h1 class="ptb-5 text-center"><span
                                                        class="now-price">￥${sd.seckill_money}</span> <span
                                                        class="org-price">￥${sd.prime_price }</span></h1>
                                                <br>
                                                <p class="mb-15 color-muted mb-20 font-12"><i
                                                        class="lnr lnr-clock mr-10"></i>开始：<fmt:formatDate
                                                        value="${sd.seckill_starttime}" pattern="yyyy/MM/dd HH:mm:ss"
                                                        type="date"/>

                                                </p>

                                            </div>
                                        </div>
                                        <!-- end col -->
                                    </div>
                                    <!-- end row -->
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </section>

            <section class="section latest-coupons-area ptb-30">
                <header class="panel ptb-15 prl-20 pos-r mb-30">

                    <h3 class="section-title font-18">小米团购</h3>
                    <a class="btn btn-o btn-xs pos-a right-10 pos-tb-center"
                       href="selectAllGroupBuyInfo.action">查看更多</a>
                </header>

                <div class="latest-coupons-slider owl-slider"
                     data-autoplay-hover-pause="true" data-loop="true"
                     data-autoplay="true" data-smart-speed="1000"
                     data-autoplay-timeout="10000" data-margin="30"
                     data-nav-speed="false" data-items="1" data-xxs-items="1"
                     data-xs-items="2" data-sm-items="2" data-md-items="3"
                     data-lg-items="4">

                    <c:forEach items="${allGroupBuyInfo}" var="u">
                        <div class="coupon-item">
                            <div class="coupon-single panel t-center">

                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="text-center p-20">
                                            <img class="store-logo"
                                                 src="${u.goodsdetail.goods.goods_pic_url}" alt="">
                                        </div>
                                        <!-- end media -->
                                    </div>
                                    <!-- end col -->

                                    <div class="col-xs-12">
                                        <div class="panel-body">

                                            <h4 class=" mb-10 t-uppercase">${u.goodsdetail.goods.goods_name}</h4>
                                            <h1 class="ptb-5 text-center">
                                                <div class="price mb-20">
                                                    <h2 class="price" id="price">
															<span class="price-sale"> <fmt:formatNumber
                                                                    value="${u.goodsdetail.prime_price}"
                                                                    type="currency" pattern="￥.00"/>
															</span>
                                                        <fmt:formatNumber
                                                                value="${u.group_buy_price}"
                                                                type="currency" pattern="￥.00"/>
                                                    </h2>
                                                </div>
                                            </h1>
                                            <br>

                                            <div class="showcode" data-toggle-class="coupon-showen">
                                                <form method="post" action="selectGroupBuyInfoById.action">
                                                    <input name="groupBuyInfoId" type="hidden"
                                                           value="${u.group_buy_info_id}">
                                                    <button class="btn btn-green text-center" type="submit">查看详情
                                                    </button>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </section>


<<<<<<< HEAD
=======
            </div>
>>>>>>> 3ede2b0cb70081aeca84ff43fa10f967c7faf6e5
        </div>
    </div>
    <c:import url="footer.jsp"/>
</div>


<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- SCRIPTS                                   -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->

<!-- (!) Placed at the end of the document so the pages load faster -->

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- Initialize jQuery library                 -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<script src="assets/js/jquery-2.0.0.js"></script>

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
<script type="text/javascript" src="assets/js/index-count.js"></script>
<script>

    $(function () {
        index_count.init({
            start_time:${seckillList[0].seckill_starttime.time},
            end_time:${seckillList[0].seckill_endtime.time}
        });
    });


</script>

</body>
</html>
