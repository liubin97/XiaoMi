<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="js/addGroupBuying.js"></script>
</head>
<body data-type="widgets">
<script src="assets/js/theme.js"></script>
<div class="am-g tpl-g">
	<%@include file="xm_topleft.html"  %>
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">新增团购</div>
                            </div>
                            <div class="widget-body am-fr">
                                <form class="am-form tpl-form-line-form">
                                    <div class="am-form-group">
                                        <label for="product_id" class="am-u-sm-3 am-form-label">团购商品 <span class="tpl-form-line-small-title">Author</span></label>
                                        <div class="am-u-sm-9">
                                            <select data-am-selected="{searchBox: 1}" style="display: none;" id="product_id">
                                                <option value="a">-The.CC</option>
                                                <option value="b">夕风色</option>
                                                <option value="o">Orange</option>
                                            </select>

                                        </div>


                                    </div>
                                    <div class="am-form-group">
                                        <label for="product_id" class="am-u-sm-3 am-form-label">团购商品型号 <span class="tpl-form-line-small-title">Author</span></label>
                                        <div class="am-u-sm-9">
                                            <select data-am-selected="{searchBox: 1}" style="display: none;" id="product_id">
                                                <option value="a">-The.CC</option>
                                                <option value="b">夕风色</option>
                                                <option value="o">Orange</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="minNumber" class="am-u-sm-3 am-form-label">团购所需人数 <span class="tpl-form-line-small-title">Title</span></label>
                                        <div class="am-u-sm-8">
                                            <input type="text" class="tpl-form-input" id="minNumber" placeholder="请输入团购所需人数">
                                            <small>请填写大于1的整数。</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span id="validate_minNumber"></span>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="gb_price" class="am-u-sm-3 am-form-label">团购价格 <span class="tpl-form-line-small-title">Title</span></label>
                                        <div class="am-u-sm-8">
                                            <input type="text" class="tpl-form-input" id="gb_price" placeholder="团购价格">
                                            <small>请填写小于商品原价的正数。</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span id="validate_gb_price"></span>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="starttime" class="am-u-sm-3 am-form-label">团购开始时间 <span class="tpl-form-line-small-title">Time</span></label>
                                        <div class="am-u-sm-8">
                                            <input type="text" class="am-form-field tpl-form-no-bg" id="starttime" placeholder="发布时间" data-am-datepicker="" readonly="">
                                            <small>团购开始时间为必填</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span></span>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="endtime" class="am-u-sm-3 am-form-label">团购结束时间 <span class="tpl-form-line-small-title">Time</span></label>
                                        <div class="am-u-sm-8">
                                            <input type="text" class="am-form-field tpl-form-no-bg" id="endtime" placeholder="发布时间" data-am-datepicker="" readonly="">
                                            <small>团购结束时间为必填</small>
                                        </div>
                                        <div class="am-u-sm-1">
                                            <span></span>
                                        </div>
                                    </div>


                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
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
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>