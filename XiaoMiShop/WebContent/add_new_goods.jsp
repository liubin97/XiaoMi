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
    <script src="js/add_new_goods.js"></script>
	
</head>
<body>
 <%@include file="manager_leftandtop.html"%>
 <!-- 内容区域 -->
      <div class="tpl-content-wrapper">
          <div class="row-content am-cf">
              <div class="row">
                  <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                      <div class="widget am-cf">
                          <div class="widget-head am-cf">
                              <div class="widget-title  am-cf">新商品登记</div>


                          </div>
                          <div class="widget-body  am-fr">
						<form class="am-form tpl-form-line-form" id="addGoods" action="insertGoods.action" method="post" enctype="multipart/form-data">
							
								<div class="am-form-group">
									<label for="user-phone" class="am-u-sm-3 am-form-label">选择商品类别</label>
									<div class="am-u-sm-9">
										<select data-am-selected="{searchBox: 1}" style="display: none;" id="category" name="goods_category_id">
										 
										</select>

									</div>
								</div>
								
								<div class="am-form-group">
								  <label class="am-u-sm-3 am-form-label">商品名称</label>
									<div class="am-u-sm-8">
                                          <input type="text" placeholder="输入商品名称" name="goods_name" id="goods_name">
                                          <span id="res_goods_name" style="color:#ff5b5b;font-size: 14px;"></span>
									</div>
									 <div class="am-u-sm-1">
										<img id="img_goods_name" src="">
														
									</div>
								</div>

								<div class="am-form-group">
								  <label class="am-u-sm-3 am-form-label">商品代码</label>
									<div class="am-u-sm-8">
                                          <input type="number" placeholder="输入商品代码" min="1" name="goods_code" id="goods_code">
                                          <span id="res_goods_code" style="color:#ff5b5b;font-size: 14px;"></span>
									</div>
								 	<div class="am-u-sm-1">
										<img id="img_goods_code" src="">
														
									</div>
								</div>
								<div class="am-form-group">
                                      <label for="user-weibo" class="am-u-sm-3 am-form-label">商品展示图片 </label>
                                      <div class="am-u-sm-9">
                                          <div class="am-form-group am-form-file">
                                              
                                              <button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                              <input class="doc-form-file" type="file" name="profilePic">
                                              <div class="file-list"></div>
                                          </div>
									
                                      </div>
                                  </div>
                                  <div class="am-form-group">
                                      <label for="user-weibo" class="am-u-sm-3 am-form-label">商品介绍图片 </label>
                                      <div class="am-u-sm-9">
                                          <div class="am-form-group am-form-file">
                                              
                                              <button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                              <input class="doc-form-file" type="file" name="goodsIntroductionPic">
                                              <div class="file-list"></div>
                                          </div>
									
                                      </div>
                                  </div>
								<div class="am-form-group">
                                      <label for="user-weibo" class="am-u-sm-3 am-form-label">商品图片 </label>
                                      <div class="am-u-sm-9">
                                          <div class="am-form-group am-form-file">
                                              
                                              <button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                              <input class="doc-form-file" type="file" name="goodsPic" multiple>
                                              <div class="file-list"></div>
                                          </div>
									
                                      </div>
                                  </div>
							<div class="am-form-group">
                                      <label for="user-weibo" class="am-u-sm-3 am-form-label">商品视频 </label>
                                      <div class="am-u-sm-9">
                                          <div class="am-form-group am-form-file">
                                              
                                              <button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择视频上传</button>
                                              <input class="doc-form-file" type="file" name="goodsVideo">
                                              <div class="file-list"></div>
                                          </div>
									
                                      </div>
                                  </div>
							<div class="am-form-group">
                                      <label for="user-weibo" class="am-u-sm-3 am-form-label">商品参数 </label>
								<div class="am-u-sm-9">
                                          <table class="am-table am-table-striped am-table-hover" >
										<thead>
											<tr>
												<th>参数名称</th>
												<th>参数值</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="attribute">
											<tr>
												<td><div class="am-form-group">
												<input type="text" class="attributeName"  placeholder="输入参数名称" >
												<img class="img_attributeName" src="">
												<span class="res_attributeName" style="color:#ff5b5b;font-size: 14px;"></span>
												</div></td>
												<td><div class="am-form-group">
												<input type="text" class="attributeValue"  placeholder="输入参数值" >
												<img class="img_attributeValue" src="">
												<span class="res_attributeValue" style="color:#ff5b5b;font-size: 14px;"></span>
												</div></td>
												<td>
													<div class="am-btn-group am-btn-group-xs">
														<button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
												
														<button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
													</div>
												</td>
											</tr>
											
										</tbody>
									</table>
								</div>
                                      
                                  </div>
							 <div class="am-form-group">
                                      <div class="am-u-sm-9 am-u-sm-push-3">
                                          <button type="button" id="confirm" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
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