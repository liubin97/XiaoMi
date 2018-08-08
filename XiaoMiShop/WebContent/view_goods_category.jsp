<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
    <script src="js/view_goods_category.js"></script>

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
									<div class="widget-title  am-cf">查看商品类别</div>


								</div>
								<div class="widget-body  am-fr">

									
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
										<div class="am-form-group tpl-table-list-select">
											<select data-am-selected="{btnSize: 'sm'}" id="category">
											  <option value="0">请选择类别</option>
											</select>
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
										<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
											<input type="text" id="category_name" class="am-form-field " style="width:200px;" placeholder="类别名称" disabled>
											
										</div>
									</div>
									

									<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
										<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
											<input type="text" id="description" class="am-form-field " style="width:200px;" placeholder="描述信息" disabled>
											
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
										<div class="am-form-group">
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" id="save" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
													<button type="button" id="delete" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
												</div>
											</div>
										</div>
									</div>
									<div class="am-u-sm-12">
										<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
											<thead>
												<tr>
													<th>商品名称</th>
													<th>商品代码</th>
													<th>展示图片</th>
													<th>介绍图片</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="goods">
												
												<!-- more data -->
											</tbody>
										</table>
									</div>
									
									<div class="am-u-lg-12 am-cf">

										<div class="am-fr">
											<ul class="am-pagination tpl-pagination" id="page">
												<li class="am-disabled"><a href="#">«</a></li>
												<li><a href="#">»</a></li>
											</ul>
										</div>
									</div>
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