<%--
  Created by IntelliJ IDEA.
  User: liubin
  Date: 2018.8.3
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <title>商品评论</title>


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
</head>
<body class="wide-layout">

<div id="pageWrapper" class="page-wrapper">
    <c:import url="header.jsp"/>
    <div class="page-container ptb-40">
        <div class="container">
            <div class="row row-rl-10 row-tb-20">
                <div class="m-comment-box J_commentList">
                    <ul class="m-comment-list J_listBody" id="comment-list">

                        <li class="com-item J_resetImgCon J_canZoomBox"><img class="user-img" src="${goodsComment.user.imgurl}">
                            <div class="comment-info">
                                <a class="user-name" href="javascript:void(0);">${goodsComment.user.nickname}</a>
                                <p class="time"><fmt:formatDate value="${goodsComment.comment_date}" type="both"/></p>
                            </div>
                            <div class="comment-eval">
                                <div class="rating">
                                    <span class="rating-stars" data-rating="${goodsComment.comment_level}">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="comment-txt">
                                <a href="javascript:void(0);">${goodsComment.comment}</a>
                            </div>
                            <div class="m-img-list clearfix h-img-list">
                                <c:forEach items="${goodsComment.commentPictureList}" var="pictureList">
                                    <div class="img-item showimg">
                                        <img class="J_resetImgItem J_canZoom" src="${pictureList.picture_url}">
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="comment-handler">
                                <a href="javascript:void(0);" data-commentid="${goodsComment.goods_comment_id}" class="J_hasHelp"> <i class="iconfont"></i>&nbsp;
                                    <span class="amount"> ${goodsComment.like_num} </span> </a>
                            </div>
                            <div class="comment-input">
                                <input type="text" placeholder="回复楼主" class="J_commentAnswerInput">
                                <a href="javascript:void(0);"
                                   class="comment-reply-link btn btn-md btn-gray btn-rounded " data-commentid="${goodsComment.goods_comment_id}">回复</a>
                            </div>
                            <div class="comment-answer">
                                <c:forEach items="${goodsComment.commentReplyList}" var="replyList">
                                    <c:if test="${replyList.reply_type == 1}">
                                        <div class="answer-item">
                                            <img class="answer-img" src="assets/images/logo.png">
                                            <div class="answer-content">
                                                <h3 class="official-name">官方回复</h3>
                                                <p> ${replyList.reply} <a href="javascript:void(0);" class="J_csLike " data-commentid="${replyList.comment_reply_id}">
                                                    <i class="iconfont"></i>&nbsp; <span class="amount"> ${replyList.reply_like_num} </span> </a></p>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${goodsComment.commentReplyList}" var="replyList">
                                    <c:if test="${replyList.reply_type == 0}">
                                        <div class="answer-item">
                                            <img class="answer-img" src="${replyList.user.imgurl}">
                                            <div class="answer-content" data-txt="">
                                                <h3 class="">${replyList.user.nickname}</h3>
                                                <p>${replyList.reply}</p>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </li>

                    </ul>
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
<script type="text/javascript" src="assets/liubin/js/comment.js"></script>
<script type="text/javascript">
    var user_emial = "${sessionScope.user_email}";
    var user_nickname = "${sessionScope.nickname}";
    var user_imgurl = "${sessionScope.user_imgurl}";
</script>
</body>
</html>

