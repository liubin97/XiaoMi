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
    <script src="js/editMSecKill.js"></script>
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
                            <div class="widget-title am-fl">修改秒杀</div>
                        </div>

                        <div class="widget-body am-fr">
                            <form class="am-form tpl-form-line-form" id="editMSecKill" action="editMSecKill.action" method="post">
                                <input type="hidden" value="${result.seckill_id}" name="seckill_id" />
                                <div class="am-form-group">
                                    <label for="goodsId" class="am-u-sm-3 am-form-label">秒杀商品 <span class="tpl-form-line-small-title">Author</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="hidden" value="${goods_id}" id="goods_id" />
                                        <select data-am-selected="{searchBox: 1}" style="display: none;" id="goodsId" disabled>

                                        </select>

                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_goodsId" src="">
                                    </div>

                                </div>
                                <div class="am-form-group">
                                    <label for="goods_detail_id" class="am-u-sm-3 am-form-label">秒杀商品型号 <span class="tpl-form-line-small-title">Author</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="hidden" value="${result.goods_detail_id}" id="goods_detail_id" name="goods_detail_id" />
                                        <select data-am-selected="{searchBox: 1}" style="display: none;" id="goods_detail_id_val" name="goods_detail_id_val" disabled>

                                        </select>

                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_goods_detail_id" src="">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="seckill_name" class="am-u-sm-3 am-form-label">秒杀名字 <span class="tpl-form-line-small-title">Title</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="seckill_name" name="seckill_name" value="${result.seckill_name}">
                                        <small>此项必填。</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_seckill_name" src="">
                                        <span ></span>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="seckill_num" class="am-u-sm-3 am-form-label">秒杀最大人数 <span class="tpl-form-line-small-title">Title</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="hidden" id="seckill_num_ref" name="seckill_num_ref" value="${result.seckill_num}"/>
                                        <input type="text" class="tpl-form-input" id="seckill_num" name="seckill_num" value="${result.seckill_num}">
                                        <small>请填写大于1的整数。</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_seckill_num" src="">
                                        <span></span>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="seckill_money" class="am-u-sm-3 am-form-label">秒杀价格 <span class="tpl-form-line-small-title">Title</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="seckill_money" name="seckill_money" value="${result.seckill_money}">
                                        <small>请填写小于商品原价的正数。</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_seckill_money" src="">
                                        <span></span>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <label for="starttime" class="am-u-sm-3 am-form-label">秒杀开始时间 <span class="tpl-form-line-small-title">Time</span></label>
                                    <div class="am-u-sm-8">
                                        <input  type="text" id="starttime"  class="am-form-field tpl-form-no-bg" name="starttime" value="<fmt:formatDate value="${result.seckill_starttime}" pattern="yyyy-MM-dd HH:mm:ss" />"  readonly="">
                                        <small>秒杀开始时间为必填</small>
                                    </div>

                                    <div class="am-u-sm-1">
                                        <img id="validate_starttime" src="">
                                        <span></span>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="endtime" class="am-u-sm-3 am-form-label">秒杀结束时间 <span class="tpl-form-line-small-title">Time</span></label>
                                    <div class="am-u-sm-8">
                                        <input  type="text" id="endtime"  class="am-form-field tpl-form-no-bg" name="endtime" value="<fmt:formatDate value="${result.seckill_endtime}" pattern="yyyy-MM-dd HH:mm:ss" />"  readonly="">
                                        <small>秒杀结束时间为必填</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_endtime" src="">
                                        <span></span>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " onclick="editSecKill()">提交</button>
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
    var start=laydate.render({
        elem: '#starttime'
        ,type: 'datetime'
        ,min:-0
        ,btns: ['now', 'confirm']
        ,done:function (value,date,endDate) {
            end.config.min={
                year:date.year,
                month:date.month-1,
                date:date.date,
                hours:date.hours,
                minutes:date.minutes,
                seconds:date.seconds
            };//开始日选好后重置结束日期的最小日期
            end.config.value={
                year:date.year,
                month:date.month-1,
                date:date.date,
                hours:date.hours,
                minutes:date.minutes,
                seconds:date.seconds
            };//将结束日的初始值设为开始日
        }

    });
    var end=laydate.render({
        elem: '#endtime'
        ,type: 'datetime'
        ,min:-0
        ,btns: ['now', 'confirm']
        ,done:function (value,date,endDate) {
            start.config.max={
                year:date.year,
                month:date.month-1,
                date:date.date,
                hours:date.hours,
                minutes:date.minutes,
                seconds:date.seconds
            }
        }
    });
</script>
<script src="asset/js/amazeui.min.js"></script>
<script src="asset/js/amazeui.datatables.min.js"></script>
<script src="asset/js/dataTables.responsive.min.js"></script>
<script src="asset/js/app.js"></script>
</body>
</html>