<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.7.25
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>确认订单</title>

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
    <link href="assets/css/mi.base.css" rel="stylesheet">
    <link href="assets/css/mi.checkout.css" rel="stylesheet">
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body class="wide-layout">

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    <div class="cart-area ptb-60">
        <div class="container">
            <div class="cart-wrapper">
                <h3 class="h-title mb-30 t-uppercase">确认订单</h3>
                <div class="panel ptb-30">
                    <div class="section section-address">
                        <div class="section-header clearfix">
                            <h3 class="title">收货地址</h3>

                            <div class="more">
                            </div>
                            <div class="mitv-tips hide" style="margin-left: 0;border: none;" id="J_bigproPostTip"></div>
                        </div>
                        <div class="section-body clearfix" id="J_addressList">
                            <!-- addresslist begin -->
                            <c:forEach items="${addressList}" var="address">
                                <c:if test="${address.isdefault == 1}">
                                    <div class="address-item J_addressItem  selected" data-address_id="${address.address_id}" >
                                        <dl>
                                            <dt>
                                                <span class="tag"></span>
                                                <em class="uname">${address.recv_people}</em>
                                            </dt>
                                            <dd class="utel">
                                                ${address.telephone}
                                            </dd>
                                            <dd class="uaddress">
                                                    ${fn:replace(address.areaPath, "_", " ")}<br>
                                                    ${address.detail_address}
                                            </dd>
                                        </dl>
                                        <div class="actions">
                                            <a href="javascript:void(0);" class="modify J_addressModify"  onclick="javascript:void(0);">修改</a>
                                        </div>
                                    </div>

                                </c:if>
                                <c:if test="${address.isdefault == 0}">
                                    <div class="address-item J_addressItem " data-address_id="${address.address_id}" >
                                        <dl>
                                            <dt>
                                                <span class="tag"></span>
                                                <em class="uname">${address.recv_people}</em>
                                            </dt>
                                            <dd class="utel">
                                                    ${address.telephone}
                                            </dd>
                                            <%--<c:set var="areaPath" value="${address.areaPath}"/>--%>
                                            <dd class="uaddress">
                                                    ${fn:replace(address.areaPath, "_", " ")}<br>
                                                    ${address.detail_address}
                                            </dd>
                                        </dl>
                                        <div class="actions">
                                            <a href="javascript:void(0);" class="modify J_addressModify" >修改</a>
                                        </div>
                                    </div>
                                </c:if>

                            </c:forEach>
                            <!-- addresslist end -->
                            <div class="address-item address-item-new" id="J_newAddress">
                                <i class="iconfont"></i>
                                添加新地址
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <table id="cart_list" class="cart-list mb-30">
                    <thead class="panel t-uppercase">
                    <tr>
                        <th>商品名称</th>
                        <th>商品单价</th>
                        <th>商品数量</th>
                        <th>商品总价</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="sum_money" value="0"/>
                    <c:forEach items="${goodsItems}" var="item">
                        <c:set var="sum_money" value="${sum_money+item.sumMoney}"/>
                        <tr class="panel alert">
                            <td>
                                <div class="media-left is-hidden-sm-down">
                                    <figure class="product-thumb">
                                        <img src="${item.goodsItem.goods.goods_pic_url}" alt="product">
                                    </figure>
                                </div>
                                <div class="media-body valign-middle">
                                    <h6 class="title mb-15 t-uppercase"><a href="#">${item.goodsItem.goods.goods_name}</a></h6>
                                    <div class="type font-12"><span class="t-uppercase">规格 : </span>${item.goodsItem.kind}&nbsp;${item.goodsItem.color}</div>
                                </div>
                            </td>
                            <td><fmt:formatNumber value="${item.goodsItem.discount_price}" type="currency" pattern="￥.00"/></td>
                            <td>
                                <input class="quantity-label" type="number" readonly value="${item.goodsNum}">
                            </td>
                            <td>
                                <div class="sub-total"><fmt:formatNumber value="${item.sumMoney}" type="currency" pattern="￥.00"/></div>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
                <div class="cart-price">
                    <h5 class="t-uppercase mb-20">订单信息</h5>
                    <ul class="panel mb-20">
                        <li>
                            <div class="item-name">
                                商品总数
                            </div>
                            <div class="price">
                                ${fn:length(goodsItems)}
                            </div>
                        </li>
                        <li>
                            <div class="item-name">
                                <strong class="t-uppercase">订单总价</strong>
                            </div>
                            <div class="price">
                                <span><fmt:formatNumber value="${sum_money}" type="currency" pattern="￥.00"/></span>
                            </div>
                        </li>
                    </ul>
                    <div class="t-right">
                        <a href="javascript:void(0);" class="btn btn-rounded btn-lg">确认订单</a>
                    </div>
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
<script type="text/javascript" src="assets/js/confirm_order.js"></script>
</body>
</html>
