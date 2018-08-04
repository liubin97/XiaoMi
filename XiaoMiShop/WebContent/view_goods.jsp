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
	<script src="js/view_goods.js"></script>
	
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
                                <div class="widget-title  am-cf">查看商品信息</div>


                            </div>
                            <div class="widget-body  am-fr">

									 <form class="am-form tpl-form-line-form" id="goodsForm">
										 <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
												<div class="am-form-group tpl-table-list-select">
													<select data-am-selected="{searchBox: 1}" style="display: none;" class="category">
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
										<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
											<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
												<button type="button" class="am-btn am-btn-success" id="goodsInfoButton">信息</button>
												<button type="button" class="am-btn am-btn-success" id="goodsPicButton">图片</button>
												<button type="button" class="am-btn am-btn-success" id="goodsAttributeButton">参数</button>
												
											</div>
										</div>
	
										
										
										<div class="am-u-sm-12">
											<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
												<thead>
													<tr>
														<th>版本名称</th>
														<th>颜色</th>
														<th>原价</th>
														<th>折扣价</th>
														<th>图片</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody id="goodsDetail">
													
													<!-- more data -->
												</tbody>
											</table>
										</div>
										<div class="am-u-lg-12 am-cf">
	
											<div class="am-fr">
												<ul class="am-pagination tpl-pagination" id="page">
													
												</ul>
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
<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe> 
	<div class="am-modal am-modal-prompt" tabindex="-1" id="goodsInfo">
	  <div class="am-modal-dialog">
		<div class="am-modal-hd">商品信息</div>
		<div class="am-modal-bd">
		  <form class="am-form tpl-form-line-form" id="changeGoods" action="updateGoods.action" method="post" enctype="multipart/form-data">
					<input id="goodsId" type="hidden" name="goods_id">
					<div class="am-form-group">
							<label for="user-phone" class="am-u-sm-3 am-form-label">商品类别</label>
							<div class="am-u-sm-9">
								<select data-am-selected="{searchBox: 1}" style="display: none;" class="category" name="goods_category_id">
									<option value="0">请选择商品类别</option>
								</select>

							</div>
					</div>
							
					<div class="am-form-group">
					  	<label class="am-u-sm-3 am-form-label">商品名称</label>
						<div class="am-u-sm-8">
                            <input type="text" placeholder="输入商品名称" id="goods_name" name="goods_name">
                             <span id="res_goods_name" style="color:#ff5b5b;font-size: 14px;"></span>
						</div>
					 	<div class="am-u-sm-1">
							<img id="img_goods_name" src="">
														
						</div>
					</div>

					<div class="am-form-group">
					  <label class="am-u-sm-3 am-form-label">商品代码</label>
						<div class="am-u-sm-8">
                             <input type="text" placeholder="输入商品代码" id="goods_code" name="goods_code">
                             <span id="res_goods_code" style="color:#ff5b5b;font-size: 14px;"></span>
						</div>
					 	<div class="am-u-sm-1">
							<img id="img_goods_code" src="">
														
						</div>
					</div>
					<div class="am-form-group">
                                   <label for="user-weibo" class="am-u-sm-3 am-form-label">商品展示图片 </label>
                                   <div class="am-u-sm-9">
                                    <img id="profilePic" src="" style="width:100px;height:50px"></img>
                                       <div class="am-form-group am-form-file">
                                          
                                           <button type="button" class="am-btn am-btn-danger am-btn-sm">
							<i class="am-icon-cloud-upload"></i> 更改展示图片</button>
                                           <input class="doc-form-file" type="file"  name="profilePic">
                                           <div class="file-list"></div>
                                       </div>
						
                                   </div>
                     </div>
                     <div class="am-form-group">
                         <label for="user-weibo" class="am-u-sm-3 am-form-label">商品介绍图片 </label>
                         <div class="am-u-sm-9">
                          <img id="goodsIntroductionPic" style="width:100px;height:50px"></img>
                             <div class="am-form-group am-form-file">
                                
                                 <button type="button" class="am-btn am-btn-danger am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                 <input class="doc-form-file" type="file"  name="goodsIntroductionPic">
                                 <div class="file-list"></div>
                             </div>

                         </div>
                     </div>
							
					<div class="am-form-group">
                          <label for="user-weibo" class="am-u-sm-3 am-form-label">商品视频 </label>
                          <div class="am-u-sm-9">
                          	<video id="goodsVideo" controls="controls" style="width:380px;height:220px"></video>
                              <div class="am-form-group am-form-file">
                                  
                                  <button type="button" class="am-btn am-btn-danger am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择视频上传</button>
                                  <input class="doc-form-file" type="file" name="goodsVideo">
                                  <div class="file-list"></div>
                              </div>

                          </div>
	                 </div>
							
					
				</form>
				
		</div>
		<div class="am-modal-footer">
		  <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		  <span class="am-modal-btn" data-am-modal-confirm>提交</span>
		</div>
	  </div>
	</div>

	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="goodsPic">
	  <div class="am-modal-dialog">
		<div class="am-modal-hd">商品图片</div>
		<div class="am-modal-bd">
		  <form class="am-form tpl-form-line-form" id="changePic" action="updateGoodsPic.action" method="post" enctype="multipart/form-data">
									
			<div class="am-form-group">
                <label for="user-weibo" class="am-u-sm-3 am-form-label">商品图片 </label>
                <input type="hidden" class="goods_id" name="goods_id">
				<div class="am-u-sm-9">
                      <table class="am-table am-table-striped am-table-hover">
						<thead>
							<tr>
								<th>图片</th>
								<th>图片上传</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="pictureList">
							<tr>
								<td>
								<img src="" style="width:100px;height:50px" alt="">
								</td>
								<td><div class="am-form-group am-form-file">
								 <button type="button" class="am-btn am-btn-danger am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                           <input class="doc-form-file" type="file"  name="goodsPic">
                                           
                                           <div class="file-list"></div>
                                       	</div></td>
								<td>
									<div class="am-btn-group am-btn-group-xs">
										<input type="hidden" class="goods_preview_pic_id" value="0">
										
										<button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
										<input type="hidden" class="goods_pre_pic_status" value="0">
										<button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
                                  
               </div>
									
			</form>
		</div>
		<div class="am-modal-footer">
		  <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		  <span class="am-modal-btn" data-am-modal-confirm>提交</span>
		</div>
	  </div>
	</div>
	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="goodsAttribute">
	  <div class="am-modal-dialog">
		<div class="am-modal-hd">商品参数</div>
		<div class="am-modal-bd">
		  <form class="am-form tpl-form-line-form" id="changeAttribute" action="updateAttribute.action" method="post" enctype="multipart/form-data">
							<div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">商品参数 </label>
                                <input type="hidden" class="goods_id" name="goods_id">
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
														<input type="hidden" class="goods_attribute_id" value="0">
														<button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
														<input type="hidden" class="attribute_status" value="0">
														<button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
													</div>
												</td>
											</tr>
											
										</tbody>
									</table>
								</div>
							 </div>
			</form>
		</div>
		<div class="am-modal-footer">
		  <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		  <span class="am-modal-btn" data-am-modal-confirm>提交</span>
		</div>
	  </div>
	</div>
	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="detailPicture">
	  <div class="am-modal-dialog">
		<div class="am-modal-hd">商品版本图片</div>
		<div class="am-modal-bd">
		  <form class="am-form tpl-form-line-form" id="changeDetailPic" action="updateDetailPic.action" method="post" enctype="multipart/form-data">
									
			<div class="am-form-group">
                <label for="user-weibo" class="am-u-sm-3 am-form-label">商品图片 </label>
                <input type="hidden" class="goods_detail_id" name="goods_detail_id">
				<div class="am-u-sm-9">
                      <table class="am-table am-table-striped am-table-hover">
						<thead>
							<tr>
								<th>图片</th>
								<th>图片上传</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="detailPictureList">
							<tr>
								<td>
								<img src="" style="width:100px;height:50px" alt="">
								</td>
								<td><div class="am-form-group am-form-file">
								 <button type="button" class="am-btn am-btn-danger am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择图片上传</button>
                                           <input class="doc-form-file" type="file"  name="detailPic">
                                           
                                           <div class="file-list"></div>
                                       	</div></td>
								<td>
									<div class="am-btn-group am-btn-group-xs">
										<input type="hidden" class="picture_set_id" value="0">
										
										<button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
										<input type="hidden" class="picture_set_status" value="0">
										<button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
                                  
               </div>
									
			</form>
		</div>
		<div class="am-modal-footer">
		  <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		  <span class="am-modal-btn" data-am-modal-confirm>提交</span>
		</div>
	  </div>
	</div>
</html>