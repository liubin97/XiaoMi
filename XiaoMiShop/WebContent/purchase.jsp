<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.7.25
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">

</head>
<body class="wide-layout">

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>

    <div class="page-container ptb-30">
        <div class="container">
            <div class="row row-rl-10 row-tb-20">
                <div class="page-content col-sm-12 col-md-12">

                    <!-- Store Tabs Area -->
                    <div class="section store-tabs-area">
                        <div class="tabs tabs-v1">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs panel" role="tablist">
                                <li role="presentation">
                                    <a href="#preview" aria-controls="preview" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-home mr-10"></i>概述</a>
                                </li>
                                <li role="presentation">
                                    <a href="#parameter" aria-controls="parameter" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-star mr-10"></i>参数</a>
                                </li>
                                <li role="presentation" class="active">
                                    <a href="#deals" aria-controls="deals" role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-shopping-cart mr-10"></i>立即购买</a>
                                </li>
                                <li role="presentation" class="">
                                    <a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-user mr-10"></i>用户评价</a>
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
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/product_01.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/product_02.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/product_03.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/product_04.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/product_05.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/product_06.jpg">
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div id="product_slider_nav" class="flexslider flexslider-nav">
                                                                <ul class="slides">
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/thumb_01.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/thumb_02.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/thumb_03.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/thumb_04.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/thumb_05.jpg">
                                                                    </li>
                                                                    <li>
                                                                        <img alt="" src="assets/images/products/thumb_06.jpg">
                                                                    </li>
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
                                                        <div class="widget single-deal-widget panel ptb-30 prl-20">
                                                            <div class="widget-body text-center">
                                                                <h2 class="mb-20 h3">
                                                                    Wyndham Garden at Palmas del Mar - Puerto Rico
                                                                </h2>
                                                                <ul class="deal-meta list-inline mb-10 color-mid">
                                                                    <li><i class="ico fa fa-globe mr-10"></i><a href="store_single_02.html" class="color-mid">Ebay</a>
                                                                    </li>
                                                                    <li><i class="ico fa fa-map-marker mr-10"></i>California</li>
                                                                    <li><i class="ico fa fa-shopping-basket mr-10"></i>75 Bought</li>
                                                                </ul>
                                                                <p class="color-muted">
                                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit harum quidem eaque amet pariatur aspernatur mollitia ratione maxime.
                                                                </p>
                                                                <div class="price mb-20">
                                                                    <h2 class="price"><span class="price-sale">$200.00</span> $60.00</h2>
                                                                </div>
                                                                <div class="buy-now mb-40">
                                                                    <a href="#" target="_blank" class="btn btn-block btn-lg">
                                                                        <i class="fa fa-shopping-cart font-16 mr-10"></i> Buy now
                                                                    </a>
                                                                </div>
                                                                <div class="time-left mb-30">
                                                                    <p class="t-uppercase color-muted">
                                                                        Hurry up Only a few deals left
                                                                    </p>
                                                                    <div class="color-mid font-14 font-lg-16">
                                                                        <i class="ico fa fa-clock-o mr-10"></i>
                                                                        <span data-countdown="2020/10/10 12:25:10"></span>
                                                                    </div>
                                                                </div>
                                                                <ul class="list-inline social-icons social-icons--colored t-center">
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="fa fa-linkedin"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </aside>
                                            <!-- End Blog Sidebar -->
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane ptb-20" id="reviews">
                                    <div class="posted-review panel p-30">
                                        <h3 class="h-title">16 Review</h3>
                                        <div class="review-single pt-30">
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="media-object mr-10 radius-4" src="assets/images/avatars/avatar_01.jpg" width="90" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <div class="review-wrapper clearfix">
                                                        <ul class="list-inline">
                                                            <li>
                                                                <span class="review-holder-name h5">John Doe</span>
                                                            </li>
                                                            <li>
                                                                <div class="rating">
                                                                            <span class="rating-stars" data-rating="5">
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </span>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <p class="review-date mb-5">September 9, 2016</p>
                                                        <p class="copy">Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam.</p>
                                                        <p><a><span class="fa fa-thumbs-o-up"></span></a> 12</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-single pt-30">
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="media-object mr-10 radius-4" src="assets/images/avatars/avatar_02.jpg" width="90" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <div class="review-wrapper clearfix">
                                                        <ul class="list-inline">
                                                            <li>
                                                                <span class="review-holder-name h5">John Doe</span>
                                                            </li>
                                                            <li>
                                                                <div class="rating">
                                                                            <span class="rating-stars" data-rating="2">
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </span>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <p class="review-date mb-5">September 9, 2016</p>
                                                        <p class="copy">Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-single pt-30">
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="media-object mr-10 radius-4" src="assets/images/avatars/avatar_03.jpg" width="90" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <div class="review-wrapper clearfix">
                                                        <ul class="list-inline">
                                                            <li>
                                                                <span class="review-holder-name h5">John Doe</span>
                                                            </li>
                                                            <li>
                                                                <div class="rating">
                                                                            <span class="rating-stars" data-rating="3">
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </span>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <p class="review-date mb-5">September 9, 2016</p>
                                                        <p class="copy">Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-single pt-30">
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="media-object mr-10 radius-4" src="assets/images/avatars/avatar_04.jpg" width="90" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <div class="review-wrapper clearfix">
                                                        <ul class="list-inline">
                                                            <li>
                                                                <span class="review-holder-name h5">John Doe</span>
                                                            </li>
                                                            <li>
                                                                <div class="rating">
                                                                            <span class="rating-stars" data-rating="4">
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </span>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <p class="review-date mb-5">September 9, 2016</p>
                                                        <p class="copy">Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-single pt-30">
                                            <div class="media">
                                                <div class="media-left">
                                                    <img class="media-object mr-10 radius-4" src="assets/images/avatars/avatar_05.jpg" width="90" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <div class="review-wrapper clearfix">
                                                        <ul class="list-inline">
                                                            <li>
                                                                <span class="review-holder-name h5">John Doe</span>
                                                            </li>
                                                            <li>
                                                                <div class="rating">
                                                                            <span class="rating-stars" data-rating="5">
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </span>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <p class="review-date mb-5">September 9, 2016</p>
                                                        <p class="copy">Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam.</p>
                                                    </div>
                                                </div>
                                            </div>
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

</body>
</html>
