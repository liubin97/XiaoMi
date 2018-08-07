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
    <title>秒杀结果</title>

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
    <style type="text/css">
        .icon {
            width: 1em; height: 1em;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
        }
    </style>
</head>

<body>

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>

    <div class="page-container ptb-60">
        <div class="container">

            <!-- Contact Us Area -->
            <section class="terms-area panel">
                <div class="ptb-30 prl-30">
                    <c:if   test="${result.success}">
                        <c:choose>
                            <c:when test="${result.data.state == 1}">
                                <h3 class="t-uppercase h-title mb-40">${result.data.stateInfo}</h3>
                                <img class="img-responsive"  style="margin-left: 11%" src="${pageContext.request.contextPath}/assets/images/mi/timg2.jpeg">
                            </c:when>

                            <c:when test="${result.data.state == 0}">
                                <h3 class="t-uppercase h-title mb-40">${result.data.stateInfo}</h3>
                                <img class="img-responsive"  style="margin-left: 11%" src="${pageContext.request.contextPath}/assets/images/mi/sorry.jpg">

                                <%--<svg class="icon text-center" aria-hidden="true" font-size="500px">--%>
                                    <%--<use xlink:href="#icon-daku"></use>--%>
                                <%--</svg>--%>
                            </c:when>


                            <c:when test="${result.data.state == -1}">
                                <h3 class="t-uppercase h-title mb-40">${result.data.stateInfo}</h3>
                                <img class="img-responsive"  style="margin-left: 11%" src="${pageContext.request.contextPath}/assets/images/mi/1.jpg">
                                <%--<svg style="font-size: 500px" class="icon" aria-hidden="true">--%>
                                    <%--<use xlink:href="#icon-ganga"></use>--%>
                                <%--</svg>--%>

                            </c:when>

                            <c:when test="${result.data.state == -2}">
                                <h3 class="t-uppercase h-title mb-40">${result.data.stateInfo}</h3>
                                <img class="img-responsive"  style="margin-left: 11%" src="${pageContext.request.contextPath}/assets/images/mi/sorry.jpg">

                            </c:when>

                            <c:when test="${result.data.state == -3}">
                                <h3 class="t-uppercase h-title mb-40">${result.data.stateInfo}</h3>
                                <img class="img-responsive"  style="margin-left: 11%" src="${pageContext.request.contextPath}/assets/images/mi/rewrite.jpeg">
                                <h4 class="mb-20">请重试</h4>

                            </c:when>

                        </c:choose>

                    <%--<h3 class="t-uppercase h-title mb-40">TERMS AND CONDITIONS</h3>--%>
                    <%--<h4 class="mb-20">1 - Donec bibendum libero id arcu tincidunt ornare.</h4>--%>
                    <%--<p class="mb-20">Nam at condimentum diam, vitae suscipit leo. Aliquam vel erat a turpis faucibus dapibus. Donec rutrum congue metus, fringilla eleifend quam luctus vitae. Morbi mi mauris, ullamcorper quis erat id, rutrum tempor leo. Nunc sit amet erat nibh. Sed vel mauris felis. Nulla nulla magna, porta sit amet semper ut, molestie at mi. Sed venenatis volutpat lobortis. Donec mattis fringilla arcu, id rhoncus est pharetra a. Etiam ut euismod tellus. Proin sagittis mauris tortor, sit amet vulputate turpis tincidunt sed. Etiam a consectetur enim, tristique malesuada ipsum. Maecenas vel placerat sapien. Nam et ultricies orci. Ut bibendum accumsan laoree.</p>--%>
                    <%--<p class="mb-20">Maecenas in mattis justo. Nulla aliquam dictum erat, vitae maximus sem interdum ut. Sed sollicitudin tempus accumsan. Vivamus eget dui at ligula semper aliquam eu vel erat. Sed sed mi molestie, eleifend nunc eu, finibus lorem. Morbi ulputate interdum finibus. Vestibulum bibendum iaculis dui sed ornare. Proin nec finibus mi. Sed odio diam, pharetra at dapibus nec, commodo quis risus. Cras et dui vitae lacus luctus maximus id sed erat. Maecenas dignissim malesuada elit, sit amet efficitur est suscipit nec. Sed quis rutrum libero. Nullam a lacus hendrerit, vestibulum nisi a, dictum quam.</p>--%>
                    <%--<h4 class="mb-20">2 - Maecenas in mattis justo. Nulla aliquam dictum erat.</h4>--%>
                    <%--<p class="mb-20">Aliquam et mattis nulla, vel molestie nulla. Suspendisse leo dui, sagittis auctor turpis ut, egestas non maximus enim. Aenean rutrum a magna eget scelerisque. Nulla magna diam, venenatis sit amet orci sed, dapibus imperdiet leo.Donec condimentum neque non efficitur rhoncus. Maecenas facilisis magna at tempor pulvinar.Sed sit amet nunc egestas, blandit arcu quis.</p>--%>
                    <%--<ul class="list-styled mb-20">--%>
                        <%--<li>Nulla aliquam dictum erat, vitae maximus sem interdum ut.</li>--%>
                        <%--<li> Proin nec finibus mi. Sed odio diam.</li>--%>
                        <%--<li>Maecenas dignissim malesuada elit, sit amet efficitur est suscipit nec</li>--%>
                        <%--<li>Maecenas in mattis justo.</li>--%>
                        <%--<li> Proin nec finibus mi. Sed odio diam.</li>--%>
                    <%--</ul>--%>
                    <%--<h4 class="mb-20">3 - Aenean placerat condimentum enim.</h4>--%>
                    <%--<p class="mb-20">Aenean blandit congue libero, sed consectetur nisl gravida et. Vestibulum eget velit diam. Cras id nunc bibendum, condimentum purus id, quam. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel elementum odio, eu congue velit Fusce dapibus diam at nunc auctor pharetra. In tempus orci id volutpat fermentum.</p>--%>
                    </c:if>
                </div>
            </section>
            <!-- End Contact Us Area -->

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

<!-- Modernizer JS -->
<script src="${pageContext.request.contextPath}/assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>


<!-- Owl Carousel -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/vendors/owl-carousel/owl.carousel.min.js"></script>

<!-- FlexSlider -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/vendors/flexslider/jquery.flexslider-min.js"></script>
<!-- Coutdown插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/vendors/countdown/jquery.countdown.js"></script>

<!-- Custom Template JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>


<script src="${pageContext.request.contextPath}/Myfont/iconfont.js"></script>


</body>
</html>
