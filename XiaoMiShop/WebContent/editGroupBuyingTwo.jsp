<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <link rel="icon" type="image/png" href="asset/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="asset/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="asset/js/echarts.min.js"></script>
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="laydate/laydate.js"></script>
    <script src="js/editGroupBuyTwo.js"></script>
</head>
<body data-type="widgets">
<script src="asset/js/theme.js"></script>

<div class="am-g tpl-g">
    <%@include file="xm_topleft.jsp" %>

    <div class="tpl-content-wrapper">
        <div class="row-content am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">修改团购</div>
                        </div>

                        <div class="widget-body am-fr">
                            <form class="am-form tpl-form-line-form" id="editGroupBuy" action="editGroupBuy.action" method="post">
                                <input type="hidden" id="group_buy_info_id" name="group_buy_info_id" value="${result.group_buy_info_id}" />
                                <div class="am-form-group">
                                    <label for="goodsId" class="am-u-sm-3 am-form-label">团购商品 <span class="tpl-form-line-small-title">Author</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="hidden" value="${goods_id}" id="goods_id" />
                                        <select data-am-selected="{searchBox: 1}" style="display: none;" id="goodsId" disabled="disabled">

                                        </select>

                                    </div>


                                </div>
                                <div class="am-form-group">
                                    <label for="goods_detail_id" class="am-u-sm-3 am-form-label">团购商品型号 <span class="tpl-form-line-small-title">Author</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="hidden" value="${result.goods_detail_id}" id="goods_detail_id" name="goods_detail_id"/>
                                        <select data-am-selected="{searchBox: 1}" style="display: none;" id="goods_detail_id_display"  disabled="disabled">

                                        </select>

                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="group_num" class="am-u-sm-3 am-form-label">团购所需人数 <span class="tpl-form-line-small-title">Title</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="group_num" name="group_num" value="${result.group_num}" readonly="readonly">
                                        <small>请填写大于1的整数。</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <span id="validate_minNumber"></span>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="group_buy_price" class="am-u-sm-3 am-form-label">团购价格 <span class="tpl-form-line-small-title">Title</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="group_buy_price" name="group_buy_price" value="${result.group_buy_price}" readonly="readonly">
                                        <small>请填写小于商品原价的正数。</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <span id="validate_gb_price"></span>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <label for="starttime" class="am-u-sm-3 am-form-label">团购开始时间 <span class="tpl-form-line-small-title">Time</span></label>
                                    <div class="am-u-sm-8">
                                        <input  type="text" id="starttime"  class="am-form-field tpl-form-no-bg" name="starttime" value="<fmt:formatDate value="${result.group_starttime}" pattern="yyyy-MM-dd HH:mm:ss" />"  readonly="readonly">
                                        <small>团购开始时间为必填</small>
                                    </div>

                                    <div class="am-u-sm-1">
                                        <span></span>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="endtime" class="am-u-sm-3 am-form-label">团购结束时间 <span class="tpl-form-line-small-title">Time</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="hidden" id="endtime_ref" name="endtime_ref" value="${result.group_endtime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <input  type="text" id="endtime"  class="am-form-field tpl-form-no-bg" name="endtime" value="<fmt:formatDate value="${result.group_endtime}" pattern="yyyy-MM-dd HH:mm:ss" />"  readonly="readonly">
                                        <small>新结束时间必须比原时间大，原结束时间为<fmt:formatDate value="${result.group_endtime}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_endtime" src="">
                                        <span></span>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " onclick="editGroupBuy()">提交</button>
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
<div class="am-modal am-modal-alert" tabindex="-1" id="validate_alert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">无法提交</div>
        <div class="am-modal-bd">
           请输入比原结束时间更大的时间！
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>
<script>
    var end=laydate.render({
        elem: '#endtime'
        ,type: 'datetime'
        ,btns: ['now', 'confirm']
    });
</script>
<script src="asset/js/amazeui.min.js"></script>
<script src="asset/js/amazeui.datatables.min.js"></script>
<script src="asset/js/dataTables.responsive.min.js"></script>
<script src="asset/js/app.js"></script>
</body>
</html>