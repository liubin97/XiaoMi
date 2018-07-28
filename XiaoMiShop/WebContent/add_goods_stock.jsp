<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
    <script src="asset/js/echarts.min.js"></script>
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
	<script src="js/add_goods_stock.js"></script>
</head>

<body data-type="widgets">
    <%@include file="manager_leftandtop.html"%>
  <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">新增商品库存</div>


                            </div>
                            <div class="widget-body  am-fr">
								<form class="am-form tpl-form-line-form" action="updateStockAdd.action" method="post">
									
										<div class="am-form-group">
											<label for="user-phone" class="am-u-sm-3 am-form-label">商品类别</label>
											<div class="am-u-sm-9">
												<select data-am-selected="{searchBox: 1}" style="display: none;" id="category">
												  <option value='0'>请选择商品类别</option>
												</select>

											</div>
										</div>
										<div class="am-form-group">
											<label for="user-phone" class="am-u-sm-3 am-form-label">商品名称</label>
											<div class="am-u-sm-9">
												<select data-am-selected="{searchBox: 1}" style="display: none;" id="goods">
												  <option value="0">请选择商品名称</option>
												  
												</select>

											</div>
										</div>
										<div class="am-form-group">
											<label for="user-phone" class="am-u-sm-3 am-form-label">商品版本</label>
											<div class="am-u-sm-9">
												<select data-am-selected="{searchBox: 1}" style="display: none;" id="kind">
												  <option value="0">请选择商品版本</option>
												
												</select>

											</div>
										</div>
										<div class="am-form-group">
											<label for="user-phone" class="am-u-sm-3 am-form-label">商品颜色</label>
											<div class="am-u-sm-9">
												<select data-am-selected="{searchBox: 1}" style="display: none;" id="color" name="goods_detail_id">
												  <option value="0">请选择商品颜色</option>
												</select>

											</div>
										</div>
										<div class="am-form-group">
										  <label class="am-u-sm-3 am-form-label">现有库存量</label>
											<div class="am-u-sm-9">
                                            <input type="number" value="0" readonly id="stock">
											</div>
										 
										</div>
										<div class="am-form-group">
										  <label class="am-u-sm-3 am-form-label">新增库存量</label>
											<div class="am-u-sm-9">
                                            <input type="number" placeholder="输入数量" name="stock">
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
    
 
    <script src="asset/js/amazeui.min.js"></script>
    <script src="asset/js/amazeui.datatables.min.js"></script>
    <script src="asset/js/dataTables.responsive.min.js"></script>
    <script src="asset/js/app.js"></script>

</body>

</html>