<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ch-ZN" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    <meta name="description" content="FRIDAY is a responsive multipurpose-ecommerce site template allows you to store coupons and promo codes from different brands and create store for deals, discounts, It can be used as coupon website such as groupon.com and also as online store">
    <meta name="	black friday, coupon, coupon codes, coupon theme, coupons, deal news, deals, discounts, ecommerce, friday deals, groupon, promo codes, responsive, shop, store coupons">
    <meta name="robots" content="index, follow">
    <meta name="author" content="CODASTROID">
    <link href="assets/dzrcss/base.min.css" rel="stylesheet">
    <link href="assets/dzrcss/main.min.css" rel="stylesheet">
    <link rel="apple-touch-icon" href="assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" href="assets/images/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/vendors/linearicons/css/linearicons.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendors/owl-carousel/owl.theme.min.css" rel="stylesheet">
    <link href="assets/vendors/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/css/base.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body class="wide-layout">
<style type="text/css">
.change-goods-num {
    width: 150px;
    margin-top: 6px;
    & .num-reduce.disabled, & .num-add.disabled {
        background: #eaeaea;
        color: #ccc;
    }
    & .num-reduce.pressed:hover, & .num-add.pressed:hover {
        background: #fff;
        color: #00b5ea;
        border: 1px solid #00b5ea;
    }
}
.num-reduce {
    width: 35px;
    height: 33px;
    line-height: 33px;
    font-weight: 700;
    color: #a1a1a1;
    text-align: center;
    text-decoration: inherit;
    border: 1px solid #dadada;
    border-radius: 3px 0 0 3px;
    float: left;
}
.input-num {
    border-top: 1px solid #dadada;
    border-right: 0;
    border-bottom: 1px solid #dadada;
    border-left: 0;
    outline: 0;
    width: 45px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    float: left;
}
.num-add {
    width: 35px;
    height: 33px;
    line-height: 33px;
    font-weight: 700;
    color: #a1a1a1;
    text-align: center;
    text-decoration: inherit;
    border: 1px solid #dadada;
    border-radius: 0 3px 3px 0;
    float: left;
}
.num-reduce i, .num-add i {
  font-weight: bold;
  font-size: 1.4em;
}
</style>

	<%String cartmsg=(String)request.getSession().getAttribute("cartmsg");
	request.getSession().removeAttribute("cartmsg");
	%>

	
<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    
            <main id="mainContent" class="main-content">
            <div class="page-container">
                <div class="container">
                    <div class="cart-area ptb-60">
                        <div class="container">
                            <div class="cart-wrapper">
                                <h3 class="h-title mb-30 t-uppercase">购物车</h3>
                                <table id="cart_list" class="cart-list mb-30">
                                    <thead class="panel t-uppercase">
                                        <tr>
                                        	<th style="width:100px;">选择</th>
                                            <th style="width:450px;">商品名称</th>
                                            <th>单价</th>
                                            <th>数量</th>
                                            <th style="width:100px;">小计</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="settlementCart.action" id="checkcart" method="post">
                                    <c:forEach items="${cartlist}" var="cl" varStatus="status">
                                        <tr class="panel alert">
                                        <td>
                                        <c:if test="${sessionScope.user_email==null}">
                                        <input type="checkbox" value="${cl.goodsDetail.goods_detail_id}" name="items" id="checkbox${status.count}" onclick="clicked(${status.count});">
                                        </c:if>
                                        <c:if test="${sessionScope.user_email!=null}">
                                        <input type="checkbox" value="${cl.cart_id}" name="items" id="checkbox${status.count}" onclick="clicked(${status.count});">
                                        </c:if>
                                        
                                        </td>
                                            <td>
                                                <div class="media-left is-hidden-sm-down">
                                                    <figure class="product-thumb">
                                                        <img src="${cl.goodsDetail.goods.goods_pic_url}" alt="product">
                                                    </figure>
                                                </div>
                                                <div class="media-body valign-middle">
                                                    <h6 class="title mb-15 t-uppercase"><a href="displayGoodsPurchaseInfo.action?goods_id=${cl.goodsDetail.goods.goods_id}">${cl.goodsDetail.goods.goods_name}</a></h6>
                                                    <div class="type font-12"><span class="t-uppercase">型号:${cl.goodsDetail.kind} ${cl.goodsDetail.color} </span></div>
                                                </div>
                                            </td>
                                            <td>${cl.goodsDetail.discount_price}元</td>
                                            <td>
                                            	<c:if test="${sessionScope.user_email==null}">
                                                <a href="updateSubNumCookie.action?goods_detail_id=${cl.goodsDetail.goods_detail_id}&num=${cl.goods_num}" class="num-reduce dib disabled" id="num-reduce"><i>-</i></a>
   												 <input type="text" value="${cl.goods_num}" class="input-num">
    											<a href="updateAddNumCookie.action?goods_detail_id=${cl.goodsDetail.goods_detail_id}&num=${cl.goods_num}" class="num-add dib pressed" id="num-add"><i>+</i></a>
                                            	</c:if>
                                            	
          										<c:if test="${sessionScope.user_email!=null}">
                                                <a href="updateSubNum.action?cart_id=${cl.cart_id}&goods_detail_id=${cl.goodsDetail.goods_detail_id}&num=${cl.goods_num}" class="num-reduce dib disabled" id="num-reduce"><i>-</i></a>
   												 <input type="text" value="${cl.goods_num}" class="input-num">
    											<a href="updateAddNum.action?cart_id=${cl.cart_id}&goods_detail_id=${cl.goodsDetail.goods_detail_id}&num=${cl.goods_num}" class="num-add dib pressed" id="num-add"><i>+</i></a>
                                            	</c:if>
                                            </td>
                                            <td>
                                                <div class="sub-total">${cl.goodsDetail.discount_price*cl.goods_num}元</div>
                                                <input type="hidden" id="sub${status.count}" value="${cl.goodsDetail.discount_price*cl.goods_num}">
                                            </td>
                                            <td>
                                                <button type="button" class="close" >
                                                <c:if test="${sessionScope.user_email==null}">
                                                    <a href="deleteCart.action?goods_detail_id=${cl.goodsDetail.goods_detail_id}">
                                                    </c:if>
                                                    <c:if test="${sessionScope.user_email!=null}">
                                                    <a href="deleteItem.action?cart_id=${cl.cart_id}">
                                                    </c:if>
                                                    <i class="fa fa-trash-o"></i>
                                                    </a>
                                                </button>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </form>
                                    </tbody>
                                </table>
                                <div class="cart-price">
                                    <h5 class="t-uppercase mb-20">购物车总计</h5>
                                    <ul class="panel mb-20">
                                        <li>
                                            <div class="item-name">
                                                	合计
                                            </div>
                                            <div class="price" >
                                                <span id="price1">0</span>元
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item-name">
                                            	    运费
                                            </div>
                                            <div class="price">
                                                10元
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item-name">
                                                <strong class="t-uppercase">订单总金额</strong>
                                            </div>
                                            <div class="price">
                                                <span id="price2">0</span>元
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="t-right">
                                        <a onclick="checkcart();" class="btn btn-rounded btn-lg">结算下单</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </main>
            


    <c:import url="footer.jsp"/>
</div>



<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script src="assets/vendors/modernizr/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="assets/vendors/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/vendors/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/vendors/countdown/jquery.countdown.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>

<script type="text/javascript">
window.onload=function(){
	var cartmsg="<%=cartmsg%>";
	if(cartmsg!="null"){
		alert(cartmsg);
	}
}
function clicked(i) {
	
	var checkbox = document.getElementById("checkbox" + i);
	var money = parseFloat(document.getElementById("sub" + i).value);
	var total = parseFloat(document.getElementById("price1").innerText);
	if (checkbox.checked) {
		total = total + money;
		
	} else {
		total = total - money;
		
	}
	
	document.getElementById("price1").innerText = total;
	document.getElementById("price2").innerText =total+10;
}
function checkcart(){
	$("#checkcart").submit();
}
</script>


</body>

</html>
