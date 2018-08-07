<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="cn">
<head>
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
    <script src="js/addSecKill.js"></script>
    <script src="laydate/laydate.js"></script>
</head>
<body data-type="widgets">
<script src="asset/js/theme.js"></script>
<div class="am-g tpl-g">
	<%@include file="xm_topleft.jsp"  %>
	<div class="tpl-content-wrapper">

        <div class="row-content am-cf">


            <div class="row">

                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">新增秒杀</div>
                        </div>
                        <div class="widget-body am-fr">

                            <form class="am-form tpl-form-line-form" id="addSecKill" action="addSecKill.action" method="post">
                                <div class="am-form-group">
                                    <label for="goodsId" class="am-u-sm-3 am-form-label">秒杀商品 <span class="tpl-form-line-small-title">Goods</span></label>
                                    <div class="am-u-sm-8">
                                        <select data-am-selected="{searchBox: 1}" style="display: none;" id="goodsId">
                                            <option value="0">请选择商品</option>

                                        </select>

                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_goodsId" src="" >
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="goods_detail_id" class="am-u-sm-3 am-form-label">秒杀商品型号 <span class="tpl-form-line-small-title">Detail</span></label>
                                    <div class="am-u-sm-8">
                                        <select data-am-selected="{searchBox: 1}" style="display: none;" id="goods_detail_id" name="goods_detail_id">
                                            <option value="0">请选择商品型号</option>

                                        </select>

                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_goods_detail_id" src="" >
                                    </div>

                                </div>
                                <div class="am-form-group">
                                    <label for="seckill_name" class="am-u-sm-3 am-form-label">秒杀名字 <span class="tpl-form-line-small-title">Name</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="seckill_name" name="seckill_name" placeholder="请输入秒杀名字">
                                        <small>此项必填</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_seckill_name" src="">
                                        <span ></span>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="seckill_num" class="am-u-sm-3 am-form-label">秒杀商品最大数量 <span class="tpl-form-line-small-title">Number</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="seckill_num" name="seckill_num" placeholder="请输入秒杀商品最大数量">
                                        <small>请填写大于1的整数。</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_seckill_num" src="">
                                        <span ></span>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="seckill_money" class="am-u-sm-3 am-form-label">秒杀价格 <span class="tpl-form-line-small-title">Price</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="tpl-form-input" id="seckill_money" name="seckill_money" placeholder="秒杀价格">
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
                                        <input type="text" class="am-form-field tpl-form-no-bg" id="starttime" name="starttime" placeholder="秒杀开始时间"  readonly="">
                                        <small>团购开始时间为必填</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_starttime" src="">
                                        <span></span>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="endtime" class="am-u-sm-3 am-form-label">秒杀结束时间 <span class="tpl-form-line-small-title">Time</span></label>
                                    <div class="am-u-sm-8">
                                        <input type="text" class="am-form-field tpl-form-no-bg" id="endtime" name="endtime" placeholder="秒杀结束时间"  readonly="">
                                        <small>团购结束时间为必填</small>
                                    </div>
                                    <div class="am-u-sm-1">
                                        <img id="validate_endtime" src="">
                                        <span></span>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " id="addSecKillButton">提交</button>
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
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">添加提醒</div>
        <div class="am-modal-bd">
            你，确定要添加这个秒杀吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>
<script>
    var start=laydate.render({
        elem: '#starttime'
        ,type: 'datetime'
        ,min:-0
        ,value:new Date()
        ,isInitValue:true
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
        ,value:new Date()
        ,isInitValue:true
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