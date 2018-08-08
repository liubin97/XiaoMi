<%--
  Created by IntelliJ IDEA.
  User: xiedong
  Date: 2018/8/2
  Time: 下午1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- PAGE FAVICON                              -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo.png">

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- GOOGLE FONTS                              -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- Include CSS Filess                        -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Linearicons -->
    <link href="${pageContext.request.contextPath}/assets/vendors/linearicons/css/linearicons.css" rel="stylesheet">

    <!-- Owl Carousel -->
    <link href="${pageContext.request.contextPath}/assets/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendors/owl-carousel/owl.theme.min.css" rel="stylesheet">

    <!-- Flex Slider -->
    <link href="${pageContext.request.contextPath}/assets/vendors/flexslider/flexslider.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/seckillDetail.css" rel="stylesheet">

    <!--自定义图标-->
    <link href="${pageContext.request.contextPath}/Myfont/iconfont.css" rel="stylesheet">
</head>

<body>

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>

    <!-- 秒杀详情页面 -->
    <div class="page-container ptb-30">
        <div class="container">
            <div class="row row-rl-10 row-tb-20">
                <div class="page-content col-sm-12 col-md-12">

                    <!-- Store Tabs Area -->
                    <div class="section store-tabs-area">
                        <div class="tabs tabs-v1">

                            <!-- Tab panes -->
                            <div class="tab-content">

                                <div role="tabpanel" class="tab-pane ptb-20 active" >
                                    <div class="row row-rl-10 row-tb-20">
                                        <div class="page-content col-xs-12 col-sm-6 col-md-7">
                                            <div class="row row-tb-20">
                                                <div class="col-xs-12">
                                                    <div class="deal-deatails panel">
                                                        <div class="deal-slider">
                                                            <div id="product_slider" class="flexslider">
                                                                <ul class="slides">
                                                                    <%--打印图片--%>

                                                                    <c:forEach items="${seckillDetail.goodsPictureList}" var="p">
                                                                        <li>
                                                                            <img src="${pageContext.request.contextPath}/${p.picture_set_url}">
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                            <div id="product_slider_nav" class="flexslider flexslider-nav">
                                                                <ul class="slides">
                                                                    <%--打印图片--%>
                                                                    <c:forEach items="${seckillDetail.goodsPictureList}" var="p">
                                                                        <li>
                                                                            <img src="${pageContext.request.contextPath}/${p.picture_set_url}">
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>

                                        <div class="page-sidebar col-md-5 col-sm-6 col-xs-12">
                                            <!-- Blog Sidebar -->
                                            <aside class="sidebar blog-sidebar">
                                                <div class="row row-tb-10">
                                                    <div class="col-xs-12">
                                                        <div class="widget single-deal-widget panel ptb-30 prl-20">
                                                            <div class="widget-body">
                                                                <h2 class="text-danger">
                                                                    <!--显示time图标-->
                                                                    <span class="fa fa-clock-o"></span>
                                                                    <!--展示倒计时-->
                                                                    <span class="glyphicon" style="font-size: 25px;" id="seckill-box"></span>
                                                                </h2>
                                                                <br>
                                                                <h2 class="mb-20 h2">
                                                                    ${seckillDetail.goods_name} <span id="goods-id" style="display: none">我的</span>
                                                                </h2>
                                                                <p class="color-muted">
                                                                    ${seckillDetail.seckill_name}
                                                                </p>
                                                                <div class="price mb-20">
                                                                    <h2 class="seckill-price" id="price">
                                                                        <fmt:formatNumber value="${seckillDetail.seckill_money}" type="currency" pattern="￥.00"/>
                                                                        <span class="seckill-price-sale">
                                                                            <fmt:formatNumber value="${seckillDetail.prime_price}" type="currency" pattern="￥.00"/>
                                                                        </span>
                                                                    </h2>
                                                                </div>

                                                                <h3 class="mb-10 h5">选择版本</h3>
                                                                <div class=" col-md-12 mb-40">
                                                                    <div  class="col-md-8 filter-center">
                                                                        <a class="active" id="111" >
                                                                            ${seckillDetail.kind} &nbsp;${seckillDetail.color}
                                                                            <span style="float: right;color: #525e62">
                                                                                <fmt:formatNumber value="${seckillDetail.seckill_money}" type="currency" pattern="￥.00"/>
                                                                            </span>

                                                                        </a>
                                                                    </div>
                                                                    <div  class="col-md-4 filter-center ">
                                                                        <a class="active" id="11" >
                                                                            数量：1
                                                                        </a>

                                                                    </div>
                                                                </div>



                                                                <!-- 秒杀按钮 -->
                                                                <div class="buy-now mb-40" id="seckill-area" >
                                                                    <%--<button type="button" class="btn btn-block btn-lg disabled" onclick=alert("你点了我一下！！1")><i class="fa fa-shopping-cart font-16 mr-10"></i>立即购买</button>--%>
                                                                        <!--显示time图标-->
                                                                        <form id="order-form">
                                                                        </form>

                                                                    <%--<span class="fa fa-clock-o"></span>--%>
                                                                        <%--<span class="glyphicon" id="seckill-box"></span>--%>
                                                                </div>

                                                                <ul class="list-inline social-icons social-icons--colored t-center">
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="iconfont icon-xiaomi" style="font-size:30px;color: #df5000"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="iconfont icon-zhifubao" style="font-size:30px;color: #1da1f2"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="iconfont icon-weixin" style="font-size:30px;color: #2ed87b"></i></a>
                                                                    </li>
                                                                    <li class="social-icons__item">
                                                                        <a href="#"><i class="iconfont icon-weibo" style="font-size:30px;color: gold"></i></a>
                                                                    </li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12">
                                                        <!-- Recent Posts -->
                                                        <div class="widget about-seller-widget panel ptb-20 prl-20">
                                                            <h3 class="widget-title h-title">关于小米</h3>
                                                            <div class="widget-body t-center">
                                                                <figure class="mt-20 pb-10">
                                                                    <img  style="width: 100px" src="${pageContext.request.contextPath}/assets/images/brands/mi.jpeg" alt="">
                                                                </figure>
                                                                <div class="store-about mb-20">
                                                                    <p class="mb-15">小米的LOGO是一个“MI”形，是Mobile Internet的缩写，代表小米是一家移动互联网公司。 另外，小米的LOGO倒过来是一个心字，少一个点，意味着小米要让我们的用户省一点心。</p>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End Recent Posts -->
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

    <c:import url="footer.jsp"/>
</div>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- SCRIPTS                                   -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->

<!-- (!) Placed at the end of the document so the pages load faster -->

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- Initialize jQuery library                 -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.0.js"></script>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- Latest compiled and minified Bootstrap    -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- JavaScript Plugins                        -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- (!) Include all compiled plugins (below), or include individual files as needed -->

<!-- Modernizer JS -->
<script src="${pageContext.request.contextPath}/assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>

<!-- Owl Carousel -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/vendors/owl-carousel/owl.carousel.min.js"></script>

<!-- FlexSlider -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/vendors/flexslider/jquery.flexslider-min.js"></script>

<!-- Custom Template JavaScript                   -->

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<!-- Cookie必备js                  -->

<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.min.js" type="text/javascript"></script>

<!-- Coutdown -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/vendors/countdown/jquery.countdown.js"></script>

<!-- 秒杀逻辑js -->

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/seckill.js"></script>

<!-- 秒杀逻辑js初始化 -->

<script type="text/javascript">
    var path = '${pageContext.request.contextPath}'+'/';
    $(function () {
        seckill.detail.init({
            seckill_id:${seckillDetail.seckill_id},
            start_time:${seckillDetail.seckill_starttime.time},//毫秒
            end_time:${seckillDetail.seckill_endtime.time}
           /* serverPath:'<%--${pageContext.request.contextPath}--%>'*/

        });
    });
</script>

</body>
</html>
