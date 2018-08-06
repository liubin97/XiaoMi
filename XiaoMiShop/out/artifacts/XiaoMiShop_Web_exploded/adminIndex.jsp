<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
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

    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/echarts.min.js"></script>
    <script src="laydate/laydate.js"></script>
    <script src="js/adminIndex.js"></script>
</head>
<body data-type="widgets">
<div class="am-g tpl-g">
    <c:import url="xm_topleft.jsp"></c:import>
    <div class="tpl-content-wrapper">


        <div class="row-content am-cf">
            <div class="row  am-cf">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">年度销量统计</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body am-fr">
                            <div class="am-fl">
                                <div>
                                    现总计
                                </div>
                                <div class="widget-fluctuation-description-amount text-success" am-cf>
                                    +<span id="goodsYearSum"></span>件
                                </div>
                            </div>
                            <div class="am-fr am-cf">
                                <div class="widget-fluctuation-description-amount text-success" am-cf>
                                    +<span id="goodsSum"></span>件
                                </div>
                                <div class="widget-fluctuation-description-text am-text-right">
                                    <span id="month"></span>月份收入
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                    <div class="widget widget-primary am-cf">
                        <div class="widget-statistic-header">
                            本月销售额
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                <p id="monthInterest"></p>
                            </div>
                            <div class="widget-statistic-description">
                                本月与上月的差值 <strong id="beforeMonth"></strong> 人民币
                            </div>
                            <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                    <div class="widget widget-purple am-cf">
                        <div class="widget-statistic-header">
                            本季度销售额
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                <p id="termInterest"></p>
                            </div>
                            <div class="widget-statistic-description">
                                本季度比上季度差值为 <strong id="beforeterm"></strong> 人民币
                            </div>
                            <span class="widget-statistic-icon am-icon-support"></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="widget am-cf">
                <div class="widget-head am-cf">
                    <div class="widget-title am-fl"></div>
                    <div class="widget-function am-fr">
                        <a href="javascript:;" class="am-icon-cog"></a>
                    </div>
                </div>
                <div class="widget-body am-fr">
                    <div style="height: 400px" class="" id="chart3">

                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="asset/js/theme.js"></script>
<script src="asset/js/amazeui.min.js"></script>
<script src="asset/js/amazeui.datatables.min.js"></script>
<script src="asset/js/dataTables.responsive.min.js"></script>
<script src="asset/js/app.js"></script>
</body>
</html>
