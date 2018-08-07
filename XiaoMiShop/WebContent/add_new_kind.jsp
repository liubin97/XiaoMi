<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="asset/js/echarts.min.js"></script>
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="asset/js/jquery.min.js"></script>
	<script src="js/add_new_kind.js"></script>
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
                                <div class="widget-title  am-cf">新版本登记</div>


                            </div>
                            <div class="widget-body  am-fr">
									<form class="am-form tpl-form-line-form" id="newKindForm"action="insertDetail.action" method="post" enctype="multipart/form-data">
									
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
												<select data-am-selected="{searchBox: 1}" style="display: none;" id="goods" name="goods_id">
												<option value='0'>请选择商品名称</option>
												</select>
												
					
											</div>
										</div>
										<div class="am-form-group" id="oldKind">
											<label for="user-phone" class="am-u-sm-3 am-form-label">商品版本</label>
											<div class="am-u-sm-9">
												<select data-am-selected="{searchBox: 1}" style="display: none;" id="kind" name="kind">
												<option value='0'>请选择商品版本</option>
												</select>
												<button type="button" class="changeKind" class="am-btn am-btn-primary tpl-btn-bg-color-success ">登记新版本</button>
											</div>
										</div>
										<div class="am-form-group" id="newKind">
											<label for="user-phone" class="am-u-sm-3 am-form-label">商品版本</label>
											<div class="am-u-sm-8" >
												<input type="text" placeholder="输入商品版本" name="kind" >
												<button type="button" class="changeKind" class="am-btn am-btn-primary tpl-btn-bg-color-success ">选择已有版本</button>
												<span id="res_kind" style="color:#ff5b5b;font-size: 14px;"></span>
											</div>
											<div class="am-u-sm-1">
	                                           	<img id="img_kind" src="">							
	                                        </div>
										</div>
										

										<div class="am-form-group">
										  <label class="am-u-sm-3 am-form-label">商品颜色</label>
											<div class="am-u-sm-8">
                                            <input type="text" placeholder="输入商品颜色" name="color" id="color">
                                            <span id="res_color" style="color:#ff5b5b;font-size: 14px;"></span>
											</div>
										 	<div class="am-u-sm-1">
	                                            <img id="img_color" src="">											
	                                        </div>
										</div>
										<div class="am-form-group">
										  <label class="am-u-sm-3 am-form-label">商品原价</label>
											<div class="am-u-sm-8">
                                            <input type="text" placeholder="输入商品原价" name="prime_price" id="prime_price">
                                            <span id="res_prime_price" style="color:#ff5b5b;font-size: 14px;"></span>
											</div>
										 	<div class="am-u-sm-1">
	                                            <img id="img_prime_price" src="">											
	                                        </div>
										</div>
										<div class="am-form-group">
										  <label class="am-u-sm-3 am-form-label">商品折扣价</label>
											<div class="am-u-sm-8">
                                            <input type="text" placeholder="输入商品折扣价" name="discount_price" id="discount_price">
                                            <span id="res_discount_price" style="color:#ff5b5b;font-size: 14px;"></span>
											</div>
										 	<div class="am-u-sm-1">
	                                            <img id="img_discount_price" src="">											
	                                        </div>
										</div>
									<div class="am-form-group">
                                        <label for="user-weibo" class="am-u-sm-3 am-form-label">商品图片 </label>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm">
												<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                                <input id="doc-form-file" type="file" name="goodsPic" multiple>
                                            </div>
											<div id="file-list"></div>
                                        </div>
                                    </div>
									
                                        
                                    
									 <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <button type="button" id="confirm"class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
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
 
    <script src="asset/js/amazeui.min.js"></script>
    <script src="asset/js/amazeui.datatables.min.js"></script>
    <script src="asset/js/dataTables.responsive.min.js"></script>
    <script src="asset/js/app.js"></script>

</body>

</html>