<%--
  Created by IntelliJ IDEA.
  User: xiedong
  Date: 2018/7/31
  Time: 上午9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">

    <!-- Always force latest IE rendering engine -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile specific meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>秒杀列表</title>

    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <!-- PAGE FAVICON                              -->
    <!-- ––––––––––––––––––––––––––––––––––––––––– -->
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/logo.png">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/favicon.ico">

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

    <!-- seckill css -->
    <link href="${pageContext.request.contextPath}/assets/css/seckill.css" rel="stylesheet">
    <style type="text/css">
        .icon {
            /* 通过设置 font-size 来改变图标大小 */
            width: 1em; height: 1em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
        }

    </style>
</head>
<body>

        <div id="pageWrapper" class="page-wrapper">
            <c:import url="header.jsp"/>

            <div class="container">

                <div class="seckill">
                    <div class="seckill-head"></div>
                    <div class="seckill-banner">

                        <ul>
                        <c:set var="index" value="1"/>
                        <c:set var="currentTime" value="<%=new java.util.Date()%>"/>
                        <c:forEach items="${timeList}" var="tl">
                            <c:if test="${index==1}">
                                <li class="active">
                            </c:if>
                            <c:if test="${index>1}">
                                <li>
                            </c:if>

                            <c:set var="endDate">
                                <fmt:formatDate value="${tl.end_time}" pattern="yyyy/MM/dd HH:mm:ss" type="date"/>
                            </c:set>

                            <a href="#seckill${index}" data-toggle="tab">
                                    <em><fmt:formatDate value="${tl.start_time}" pattern="HH:mm" /></em>
                                        <c:choose>

                                            <%--已经开始--%>
                                            <c:when test="${currentTime.time >= tl.start_time.time}">
                                               <span id="KillOver">抢购中<br>离结束<em class="t-uppercase" data-countdown="${endDate}"></em></span>
                                                <%--<span>抢购中<br>离结束<em>01 Day 03 : 22 : 51</em></span>--%>
                                            </c:when>

                                            <%--未开始--%>
                                            <c:when test="${currentTime.time < tl.start_time.time}">
                                              <span > 即将开始</span>
                                            </c:when>

                                            <%--已经结束--%>
                                            <c:when test="${currentTime.time > tl.end_time.time}">
                                                <span > 已结束</span>
                                            </c:when>

                                        </c:choose>

                                </a>
                            </li>
                            <c:set var="index" value="${index+1}" />
                        </c:forEach>
                        </ul>

                    </div>

                    <div class="seckill_list">
                        <div id="myTabContent" class="tab-content">
                            <c:set var="index1" value="1"/>
                            <%--外层循环控制在那个时间段里打印--%>
                            <c:forEach items="${timeList}" var="tl">
                                <c:if test="${index1==1}">
                                    <div class="tab-pane fade in active " id="seckill${index1}">
                                        <div class="row row-masnory row-tb-20">
                                </c:if>
                                <c:if test="${index1>1}">
                                    <div class="tab-pane fade " id="seckill${index1}">
                                        <div class="row row-masnory row-tb-20">
                                </c:if>

                                  <%-- 每个时间段有几个秒杀活动 --%>
                                <c:forEach items="${list}" var="l">
                                        <%--仅打印同一时间段的秒杀活动--%>
                                        <c:if test="${tl.start_time.time == l.seckill_starttime.time}">
                                            <div class="col-sm-6 col-lg-4">
                                                    <div class="deal-single panel">
                                                        <figure class="deal-thumbnail embed-responsive embed-responsive-16by9" data-bg-img="${pageContext.request.contextPath}/assets/images/1532667656863.jpg" style="background-image: url(${pageContext.request.contextPath}/assets/images/1532667656863.jpg);">
                                                            <!-- 计时 -->
                                                            <div class="time-left bottom-15 right-20 font-md-14">
                                                                <span>
                                                                     <i class="ico fa fa-clock-o mr-10"></i>
                                                                     <span class="t-uppercase" data-endcountdown="2018/08/02 00:30:00"></span>
                                                                </span>
                                                            </div>
                                                        </figure>
                                                        <div class="bg-white pt-20 pl-20 pr-15">
                                                            <div class="pr-md-6 text-center">

                                                                <h1 class="deal-title mb-10 text-center">
                                                                    ${l.goods_name}
                                                                </h1>
                                                                <p > ${l.seckill_name}</p>
                                                                <div class="deal-price pos-r mb-15 text-center">
                                                                    <h1 class="ptb-5 text-center"><span class="now-price">￥${l.seckill_money}</span> <span class="org-price">￥${l.prime_price}</span ></h1>
                                                                    <%--还没有开始了--%>
                                                                    <c:if test="${currentTime.time <l.seckill_starttime.time}">
                                                                        <button class="btn btn-green text-center"  onclick="sec_reminder.remind(${l.seckill_id},'<fmt:formatDate value="${l.seckill_starttime}" pattern="yyyy/MM/dd HH:mm:ss" />')"  >
                                                                            提醒我
                                                                        </button>

                                                                        <a href="${pageContext.request.contextPath}/seckill/${l.seckill_id}/detail">
                                                                            <button class="btn btn-blue text-center">
                                                                                详情
                                                                            </button>
                                                                        </a>
                                                                    </c:if>
                                                                        <%--已经开始了--%>
                                                                    <c:if test="${currentTime.time  >= l.seckill_starttime.time}">
                                                                        <button class="btn btn-red text-center disabled"  >
                                                                            已开始
                                                                        </button>

                                                                        <a href="${pageContext.request.contextPath}/seckill/${l.seckill_id}/detail">
                                                                            <button class="btn btn-org text-center">
                                                                                马上抢购
                                                                            </button>
                                                                        </a>
                                                                    </c:if>



                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                        </c:if>

                                </c:forEach>

                                        </div>
                                    </div>
                                        <c:set var="index1" value="${index1+1}" />
                             </c:forEach>
                        </div>
                    </div>

                </div>
            </div>

            <c:import url="footer.jsp"/>
        </div>
</div>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <%--模态框（Modal）标题--%>
                        </h4>
                    </div>
                    <div class="modal-body" id="myModalbody">
                        <%--我们会在开团前提醒您--%>

                    </div>
                    <div class="modal-footer text-center" >
                        <div class="col-lg-7 ">
                            <button type="button" class="btn btn-orange" data-dismiss="modal">确定</button>
                            <!--<button type="button" class="btn btn-orange">提交更改</button>-->
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        <!-- (!) Placed at the end of the document so the pages load faster -->
        </div>

        <!-- ––––––––––––––––––––––––––––––––––––––––– -->
        <!-- Initialize jQuery library                 -->
        <!-- ––––––––––––––––––––––––––––––––––––––––– -->
                <script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.3.min.js"></script>
        <!-- ––––––––––––––––––––––––––––––––––––––––– -->
        <!-- Latest compiled and minified Bootstrap    -->
        <!-- ––––––––––––––––––––––––––––––––––––––––– -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

        <!-- ––––––––––––––––––––––––––––––––––––––––– -->
        <!-- JavaScript插件                  -->
        <!-- ––––––––––––––––––––––––––––––––––––––––– -->

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

        <script type="text/javascript " src="${pageContext.request.contextPath}/Myfont/iconfont.js"  ></script>

        <!-- 提醒的js -->
       <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/remind.js"></script>


                <script>
                    var path = '${pageContext.request.contextPath}'+'/';
                </script>



</body>

</html>
