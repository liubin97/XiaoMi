<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.7.25
  Time: 19:44
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
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo.png">

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
    <link href="${pageContext.request.contextPath}/assets/css/mi.base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/mi.checkout.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
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
                         <c:set var="addrcount" value="1"/>
                         <c:set var="defaultaddrId" />
                        <c:forEach items="${addresses}" var="addr">

                                <c:if test="${addr.isdefault == 1}">
                                     <div class="address-item J_addressItem  selected" id="address${addrcount}">
                                         <c:set var="defaultaddrId" value="${addr.address_id}" />
                                </c:if>
                                <c:if test="${addr.isdefault == 0}">
                                    <div class="address-item J_addressItem " id="address${addrcount}">
                                </c:if>
                                    <dl>
                                        <dt>
                                            <span class="tag" style="display: none" >${addr.address_id}</span>
                                            <em class="uname">${addr.recv_people}</em>
                                        </dt>
                                        <dd class="utel">
                                            ${addr.telephone}
                                        </dd>
                                        <dd class="uaddress">
                                           ${addr.areaPath}<br>
                                           ${addr.detail_address}
                                        </dd>
                                    </dl>
                                    <div class="actions">
                                        <a href="javascript:void(0);" class="modify J_addressModify">修改</a>
                                    </div>
                                </div>
                                <c:set var="addrcount" value="${addrcount+1}"/>
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
                    <tr class="panel alert">
                        <td>
                            <div class="media-left is-hidden-sm-down">
                                <figure class="product-thumb">
                                    <img src="${pageContext.request.contextPath}/${seckillDetail.goodsPictureList[0].picture_set_url}" alt="product">
                                </figure>
                            </div>
                            <div class="media-body valign-middle">
                                <h6 class="title mb-15 t-uppercase"><a href="#">${seckillDetail.goods_name}</a></h6>
                                <div class="type font-12"><span class="t-uppercase">类型 : </span>${seckillDetail.kind}&nbsp;&nbsp;${seckillDetail.color}</div>
                            </div>
                        </td>
                        <td>
                            <fmt:formatNumber value="${seckillDetail.prime_price}" type="currency" pattern="￥.00"/>
                        </td>
                        <td>
                            <input class="quantity-label" type="number" value="1" readonly>
                        </td>
                        <td>
                            <div class="sub-total">
                                <fmt:formatNumber value="${seckillDetail.seckill_money}" type="currency" pattern="￥.00"/>
                            </div>
                        </td>
                        <td>
                        </td>
                    </tr>

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
                                1
                            </div>
                        </li>
                        <li>
                            <div class="item-name">
                                <strong class="t-uppercase">订单总价</strong>
                            </div>
                            <div class="price">
                                <span>
                                    <fmt:formatNumber value="${seckillDetail.seckill_money}" type="currency" pattern="￥.00"/>
                                </span>
                            </div>
                        </li>
                    </ul>
                    <form id="oder-form" action="${pageContext.request.contextPath}/seckill/${seckillDetail.seckill_id}/${md5}/execution" method="post">

                        <input type="hidden" value="${defaultaddrId}" name="addressId" id="addressId">
                        <div class="t-right">
                                <button type="button" id="order-btn" class="btn btn-rounded btn-lg"  >确认订单</button>
                            </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <c:import url="footer.jsp"/>
</div>





<!-- (!) 在document最后加载js以让page最快加载-->

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


<!-- Modernizer JS -->
<script src="${pageContext.request.contextPath}/assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>

<!-- Owl Carousel -->
<script type="${pageContext.request.contextPath}/text/javascript" src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>

<!-- FlexSlider -->
<script type="${pageContext.request.contextPath}/text/javascript" src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>

<!-- Coutdown -->
<script type="${pageContext.request.contextPath}/text/javascript" src="assets/vendors/countdown/jquery.countdown.js"></script>

<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<!-- Custom Template JavaScript                   -->
<!-- ––––––––––––––––––––––––––––––––––––––––– -->
<script type="text/javascript"  src="${pageContext.request.contextPath}/assets/js/main2.js" ></script>

<!-- 秒杀逻辑js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/seckill.js"></script>

<script type="text/javascript">
            $(function () {
                seckill.handlerSeckill();
                $('.tag').hide();
            });
</script>
<script type="text/javascript">
    $("div[id^='address']").click(function() {
        clear();
        $(this).addClass("selected");
        console.log(this);
        var addressID = $(this).find('span:eq(0)').text();
        $("#addressId").val(addressID);
        console.log("addressID:",addressID);
    });

    function clear() {
        $("div[id^='address']").each(function() {
            if ($(this).hasClass("selected")) {
                $(this).removeClass("selected");
            }
        });
    }
</script>
</body>
</html>
