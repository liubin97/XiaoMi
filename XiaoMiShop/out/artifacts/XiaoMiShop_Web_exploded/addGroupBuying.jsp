<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"   %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="js/addGroupBuy.js"></script>
    <script src="laydate/laydate.js"></script>

</head>
<body data-type="widgets">
<script src="assets/js/theme.js"></script>

<div class="am-g tpl-g">
    <%@include file="xm_topleft.jsp" %>

    <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">新增团购</div>
                            </div>
                            <div class="widget-body am-fr">
                                <form class="am-form tpl-form-line-form" action="addGroupBuy.action" method="post">
                                    <div class="am-form-group">
                                        <label for="goodsId" class="am-u-sm-3 am-form-label">团购商品 <span class="tpl-form-line-small-title">Author</span></label>
                                        <div class="am-u-sm-9">
                                            <select data-am-selected="{searchBox: 1}" style="display: none;" id="goodsId">

                                            </select>

                                        </div>


                                    </div>
                                    <div class="am-form-group">
                                        <label for="goods_detail_id" class="am-u-sm-3 am-form-label">团购商品型号 <span class="tpl-form-line-small-title">Author</span></label>
                                        <div class="am-u-sm-9">
                                            <select data-am-selected="{searchBox: 1}" style="display: none;" id="goods_detail_id" name="goods_detail_id">

                                            </select>

                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="group_num" class="am-u-sm-3 am-form-label">团购所需人数 <span class="tpl-form-line-small-title">Title</span></label>
                                        <div class="am-u-sm-8">
                                            <input type="text" class="tpl-form-input" id="group_num" name="group_num" placeholder="请输入团购所需人数">
                                            <small>请填写大于1的整数。</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span id="validate_minNumber"></span>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="group_buy_price" class="am-u-sm-3 am-form-label">团购价格 <span class="tpl-form-line-small-title">Title</span></label>
                                        <div class="am-u-sm-8">
                                            <input type="text" class="tpl-form-input" id="group_buy_price" name="group_buy_price" placeholder="团购价格">
                                            <small>请填写小于商品原价的正数。</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span id="validate_gb_price"></span>
                                        </div>
                                    </div>


                                    <div class="am-form-group">
                                        <label for="starttime" class="am-u-sm-3 am-form-label">团购开始时间 <span class="tpl-form-line-small-title">Time</span></label>
                                        <div class="am-u-sm-8">
                                            <input  type="text" id="starttime"  class="am-form-field tpl-form-no-bg" name="starttime" placeholder="发布时间"  readonly="">
                                            <small>团购开始时间为必填</small>
                                        </div>

                                        <div class="am-u-sm-1">
                                            <span></span>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="endtime" class="am-u-sm-3 am-form-label">团购结束时间 <span class="tpl-form-line-small-title">Time</span></label>
                                        <div class="am-u-sm-8">
                                            <input  type="text" id="endtime"  class="am-form-field tpl-form-no-bg" name="endtime" placeholder="发布时间"  readonly="">
                                            <small>团购结束时间为必填</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span></span>
                                        </div>
                                    </div>


                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </div>
<script>
    laydate.render({
        elem: '#starttime'
        ,type: 'datetime'
    });
</script>
<script>
    laydate.render({
        elem: '#endtime'
        ,type: 'datetime'
    });
</script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>