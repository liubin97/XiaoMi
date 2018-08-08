<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="cn">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登记新类别</title>
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
    <script src="js/add_goods_category.js"></script>

</head>

<body data-type="widgets" class="theme-white">
    <c:import url="xm_topleft.jsp"></c:import>
  <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">新增商品类别</div>


                            </div>
                            <div class="widget-body  am-fr">

								<form class="am-form tpl-form-line-form" id="category" name="" action="insertCategory.action" method="post" >
									 <div class="am-form-group">
												<label class="am-u-sm-3 am-form-label" >商品类别名称</label>
												<div class="am-u-sm-8">
													<input type="text" id="category_name" name="category_name" class="am-form-field" placeholder="商品类别名称" >
													<span id="res_category_name" style="color:#ff5b5b;font-size: 14px;"></span>
												</div>
												<div class="am-u-sm-1">
													<img id="img_category_name" src="">
													
												</div>
												
									</div>
									<div class="am-form-group">
										<label class="am-u-sm-3 am-form-label" >描述信息</label>
										<div class="am-u-sm-8">
											<input type="text" name="description" class="am-form-field" placeholder="描述信息">
										</div>
										<div class="am-u-sm-1">
												
										</div>
									</div>
											
											
								  	<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<button type="button" id="confirm" class="am-btn am-btn-success">保存</button>
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