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
                                                                <ul class="slides" id="big-pictures">
                                                                    <c:forEach items="${goods.goodsDetailList}" var="goodsDetail">
                                                                        <c:forEach items="${goodsDetail.goodsPictureList}" var="p">
                                                                            <li>
                                                                                <img alt="" src="${p.picture_set_url}">
                                                                            </li>
                                                                        </c:forEach>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                            <div id="product_slider_nav" class="flexslider flexslider-nav">
                                                                <ul class="slides" id="small-pictures">
                                                                    <c:forEach items="${goods.goodsDetailList}" var="goodsDetail">
                                                                        <c:forEach items="${goodsDetail.goodsPictureList}" var="p">
                                                                            <li>
                                                                                <img alt="" src="${p.picture_set_url}">
                                                                            </li>
                                                                        </c:forEach>
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
                                                        <div class="widget single-deal-widget panel ptb-30 prl-20">
                                                            <div class="widget-body">
                                                                <h2 class="mb-20 h2">
                                                                    ${goods.goods_name}<span id="goods-id" style="display: none">${goods.goods_id}</span>
                                                                </h2>
                                                                <ul class="deal-meta list-inline mb-10 color-mid">
                                                                    <li><i class="ico fa fa-shopping-basket mr-10"></i>剩余
                                                                        <span id="stock">${goods.goodsDetailList[0].stock}</span>件
                                                                        <span id="goods-detail-id" data-goods_detail_id="${goods.goodsDetailList[0].goods_detail_id}" style="display: none"></span>
                                                                    </li>
                                                                </ul>
                                                                <p class="color-muted" id="choose">

                                                                </p>
                                                                <div class="price mb-20">
                                                                    <h2 class="price" >
                                                                        ￥<span id="price"><fmt:formatNumber value="${goods.goodsDetailList[0].discount_price}"  pattern="#0.00"/></span>
                                                                    </h2>
                                                                </div>

                                                                <h3 class="mb-10 h5">选择版本</h3>
                                                                <div class="filter-center col-md-12 mb-40">
                                                                    <ul id="goods-kind-list" class="text-center">

                                                                    </ul>
                                                                </div>

                                                                <h3 class="mb-10 h5">选择颜色</h3>
                                                                <div class="filter-center col-md-12 mb-40">
                                                                    <ul class="text-center" id="goods-color-list">
                                                                        <c:set var="flag" value="1"/>
                                                                        <c:set var="firstkind" value="${goods.goodsDetailList[0].kind}"/>
                                                                        <c:forEach items="${goods.goodsDetailList}" var="goodsDetail">
                                                                            <c:if test="${flag!=1 and goodsDetail.kind ==firstkind}">
                                                                                <li class="col-md-6">
                                                                                    <a class="goods-color" >${goodsDetail.color}</a>
                                                                                </li>
                                                                            </c:if>
                                                                            <c:if test="${flag==1 and goodsDetail.kind ==firstkind}">
                                                                                <li class="col-md-6">
                                                                                    <a class="goods-color active" >${goodsDetail.color}</a>
                                                                                </li>
                                                                                <c:set var="flag" value="2"/>
                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </ul>
                                                                </div>

                                                                <div class="buy-now mb-40">
                                                                    <ul class="list-inline" style="margin-left: 30px">
                                                                        <li>
                                                                            <a id="purchase" href="javascript:void(0);" target="_blank" class="btn " style="color:#E5511D;background: #f2dede;border-color: #F0CAB6;">
                                                                                立即购买
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                             <a id="add-cart" href="javascript:void(0);" class="btn">
                                                                                <i class="fa fa-shopping-cart font-16 mr-10"></i> 加入购物车
                                                                            </a>
                                                                        </li>
                                                                        <li style="float: right; margin-right: 30px;">
                                                                            <a id="favorites" href="javascript:void(0);" class="btn" style="color:red;background: #f5f5f5;border-color: #f5f5f5;">
                                                                                <span class="fa fa-heart-o font-22"></span>
                                                                            </a>
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
                                <div role="tabpanel" class="tab-pane ptb-20" id="reviews">
                                    <div class="m-comment-box J_commentList">
                                            <ul class="m-comment-list J_listBody" id="comment-list">

                                            </ul>
                                            <div class="comment-more">
                                                <a id="load-more" class="load-more J_loadMore" href="javascript:void(0);" style="display: block;">加载更多</a>
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
<script type="text/javascript" src="assets/liubin/js/purchase.js"></script>
<script type="text/javascript" src="assets/js/displayGoodsAttr.js"></script>

<script type="text/javascript">
    //获取用户信息
    var user_emial = "${sessionScope.user_email}";
    var user_nickname = "${sessionScope.nickname}";
    var user_imgurl = "${sessionScope.user_imgurl}";
    //获取商品详情数组
    var goodsDetailList =[];
    <c:forEach items="${goods.goodsDetailList}" var="goodsDetail">
        var goods_detail_id = "${goodsDetail.goods_detail_id}";
        var goods_detail_color = "${goodsDetail.color}";
        var goods_detail_kind = "${goodsDetail.kind}";
        var goods_detail_price = "${goodsDetail.discount_price}";
        var goods_detail_stock = "${goodsDetail.stock}";
        var goods_picture_urls = [];
        <c:forEach items="${goodsDetail.goodsPictureList}" var="p">
            var picture_url  = "${p.picture_set_url}";
            goods_picture_urls.push(picture_url);
        </c:forEach>
        goodsDetailList.push({
            "goods_detail_id":goods_detail_id,
            "goods_detail_kind":goods_detail_kind,
            "goods_detail_color":goods_detail_color,
            "goods_detail_price":goods_detail_price,
            "goods_detail_stock":goods_detail_stock,
            "goods_detail_pic_urls":goods_picture_urls
        });
    </c:forEach>
</script>
</body>
</html>
