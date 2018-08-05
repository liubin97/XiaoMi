<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.8.5
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>商品评价</title>

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- SEO METAS                                 -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <meta name="description" content="make comment">

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- PAGE FAVICON                              -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="apple-touch-icon" href="assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="assets/images/logo.png">


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
    <link href="assets/liubin/css/photo.css" rel="stylesheet">
    <link href="assets/liubin/css/common.css" rel="stylesheet">

</head>

<body class="wide-layout">

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    <div class="page-container ptb-40">
        <div class="container">
            <div class="row row-rl-10 row-tb-20">
                <div class="col-xs-12">
                    <div class="post-review panel p-20">
                        <h3 class="h-title">商品评价</h3>
                        <table id="cart_list" class="cart-list">
                            <tbody id="items-body">

                            <tr class="panel alert">
                                <td>
                                    <div class="media-left is-hidden-sm-down">
                                        <figure class="product-thumb">
                                            <img src="goods/小米8/1.png" alt="product">
                                        </figure>
                                    </div>
                                    <div class="media-body valign-middle">
                                        <h6 class="title mb-15 t-uppercase"><a href="#">小米8</a></h6>
                                        <div class="type font-12"><span class="t-uppercase">规格 : </span>4+32G&nbsp;红</div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <form class="horizontal-form pt-30" action="makeComment.action" method="post" enctype="multipart/form-data">
                            <div class="row row-v-10">
                                <div class="col-xs-12">
                                    <ul class="select-rate list-inline ptb-20">
                                        <li>
                                            <span>评价等级 : </span>
                                        </li>
                                        <li>
                                            <div class="rating">
                                                <span class="rating-stars rate-allow" data-rating="5">
                                                    <i class="fa fa-star-o star-active"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-xs-12">
                                    <div class="comment-form-comment form-group">
                                        <label for="comment">评价内容：</label>
                                        <textarea id="comment" class="form-control" placeholder="你对该商品有什么看法" name="comment"  rows="6" ></textarea>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <p>评价晒图(最多上传5张图片)</p>
                                    <div class="img-box full">
                                        <section class=" img-section">
                                            <div class="z_photo upimg-div clear">
                                                <section class="z_file fl">
                                                    <img src="assets/liubin/img/a11.png" class="add-img">
                                                    <input type="file" name="file" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple="">
                                                </section>
                                            </div>
                                        </section>
                                    </div>
                                    <aside class="mask works-mask">
                                        <div class="mask-content">
                                            <p class="del-p ">您确定要删除图片吗？</p>
                                            <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
                                        </div>
                                    </aside>
                                </div>

                                <div class="col-xs-12 text-right">
                                    <button type="submit" class="btn mt-20">提交评价</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Store Tabs Area -->

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
<script type="text/javascript" src="assets/liubin/js/imgUp.js"></script>
</body>

</html>
