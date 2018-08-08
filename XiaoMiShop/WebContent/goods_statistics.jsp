<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--font-Awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" >
    <link rel="icon" type="image/png" href="asset/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="asset/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/echarts.min.js"></script>
	<script src="js/goods_statistics.js"></script>
</head>

<body data-type="widgets" class="theme-white">
    <c:import url="xm_topleft.jsp"></c:import>
  <!-- 内容区域 -->
         <div class="tpl-content-wrapper">

          


            <div class="row-content am-cf">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">最近一周各个类别的销售量</div>
                        
                    </div>
                    <div class="widget-body am-fr">
                        <div style="height: 400px" class="" id="chart3">

                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
						<div class="am-form-group tpl-table-list-select">
							<select data-am-selected="{searchBox: 1}" style="display: none;" id="category">
							  <option value="0">请选择商品类别</option>
							  
							</select>
						</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
							<div class="am-form-group tpl-table-list-select">
								<select data-am-selected="{searchBox: 1}" style="display: none;" id="goods">
								  <option value="0">请选择商品</option>
								
								</select>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
							<div class="am-form-group tpl-table-list-select">
								<select data-am-selected="{searchBox: 1}" style="display: none;" id="kind">
								  <option value="0">请选择商品版本</option>
								
								</select>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
							<div class="am-form-group tpl-table-list-select">
								<select data-am-selected="{searchBox: 1}" style="display: none;" id="date">
								  <option value="false">请选择统计月份</option>
								
								</select>
							</div>
						</div>
				</div>
				<div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">柱状图</div>
                        
                    </div>
                    <div class="widget-body am-fr">
                        <div id="main" style="height:400px;"></div>
                    </div>
                </div>
				
				
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">饼状图</div>
                        
                    </div>
                    <div class="widget-body am-fr">
                        <div id="chart2" style="height:400px;"></div>
                    </div>
                </div>



            </div>
        </div>
 
    <script src="asset/js/amazeui.min.js"></script>
    <script src="asset/js/amazeui.datatables.min.js"></script>
    <script src="asset/js/dataTables.responsive.min.js"></script>
    <script src="asset/js/app.js"></script>

</body>

</html>