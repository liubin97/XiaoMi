<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html lang="cn">
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="asset/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="asset/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="asset/js/echarts.min.js"></script>
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="laydate/laydate.js"></script>
    <script src="js/GoodsCommentDetail.js"></script>
</head>
<body data-type="widgets">
<div class="am-g tpl-g">
        <c:import url="xm_topleft.jsp"></c:import>
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">文章列表</div>


                            </div>
                            <div class="widget-body  am-fr">
                                <div class="am-u-sm-12">

                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                        <tr>
                                            <th>评论编号</th>
                                            <th>用户</th>
                                            <th>商品编号</th>
                                            <th>评论时间</th>
                                            <th>评论等级</th>
                                            <th>点赞数</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="gradeX">

                                                <td class="am-text-middle">${goodsComment.goods_comment_id}</td>
                                                <td class="am-text-middle">${goodsComment.user_email}</td>
                                                <td class="am-text-middle">${goodsComment.goods_id}</td>
                                                <td class="am-text-middle"><fmt:formatDate value="${goodsComment.comment_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                <td class="am-text-middle">${goodsComment.comment_level}</td>
                                                <td class="am-text-middle">${goodsComment.like_num}</td>
                                                <td class="am-text-middle">
                                                    <div class="tpl-table-black-operation">
                                                        <a href="#" id="doc-prompt-toggle">
                                                            <i class="am-icon-pencil"></i>回复
                                                        </a>
                                                        <a href="deleteMGoodsComment.action?goods_comment_id=${goodsComment.goods_comment_id}&pageNum=${pageNum}" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>评论内容:</td>
                                                <td>${goodsComment.comment}</td>
                                            </tr>
                                            <tr class="gradeX">
                                                <c:forEach items="${goodsComment.commentPictureList}" var="CommentPicture">
                                                    <td>
                                                        <img src="${CommentPicture.picture_url}" class="tpl-table-line-img" alt="评论图片">
                                                    </td>
                                                </c:forEach>
                                            </tr>
                                            <c:forEach items="${goodsComment.commentReplyList}" var="CommentReply">
                                                <tr>
                                                    <td>${CommentReply.user_email}</td>
                                                    <td><fmt:formatDate value="${CommentReply.reply_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                </tr>
                                                <tr>
                                                    <td>回复内容：</td>
                                                    <td>${CommentReply.reply}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>


                                    </table>
                                    <div data-am-sticky>
                                        <div data-am-widget="gotop" class="am-gotop am-gotop-default" >
                                            <a href="#top" title="回到顶部">
                                                <span class="am-gotop-title">回到顶部</span>
                                                <i class="am-gotop-icon  am-icon-hand-o-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">官方回复</div>
        <form action="addMCommentReply.action" method="post" id="mCommentReply">
        <div class="am-modal-bd">
            请输入回复内容
            <textarea name="reply" id="reply" cols="30" rows="5" class="am-modal-prompt-input"></textarea>
        </div>
            <input type="hidden" id="goods_comment_id" name="goods_comment_id" value="${goodsComment.goods_comment_id}" />
            <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm>提交</span>
        </div>
        </form>
    </div>
</div>
<script src="asset/js/theme.js"></script>
<script src="asset/js/amazeui.min.js"></script>
<script src="asset/js/amazeui.datatables.min.js"></script>
<script src="asset/js/dataTables.responsive.min.js"></script>
<script src="asset/js/app.js"></script>
</body>
</html>