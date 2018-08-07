
//默认选项
//商品类别初始项
var categoryOption = "<option value='0'>请选择商品类别</option>";
//商品名称初始项
var goodsOption = "<option value='0'>请选择商品</option>";
//商品参数表格中的一行的HTML
var attributeHtml = "";
//商品图片表格中的一行的HTML
var pictureHtml =  "";
//商品版本细节照片表格的一行的HTML
var detailPicHtml = "";
//标记商品名称是否输入正确
var nameFlag = false;
//标记商品代码是否输入正确
var codeFlag = false;
//标记参数值是否输入正确
var attributeValueFlag = false;
//标记参数名称是否输入正确
var attributeNameFlag = false;
//标记参数是否重复
var repeatFlag = true;
//标记颜色是否输入正确
var colorFlag = false;
//标记原价是否输入正确
var primePriceFlag = false;
//标记折扣价是否输入正确
var discountPriceFlage = false;
//标记返回值true,false,void
var flag = "";

//移除表格中的该行
function removeTr(){
	
		//alert(1);
		var number = 0; 
		$(this).parents("tbody").find("tr").each(function(){
			if($(this).find(".am-btn.am-btn-default.am-btn-success").next().val()!=-1){
				number++;
			}
		});
		$(this).prev().val(-1);
		if(number<=1){
			$(this).parents("tr").find("td").eq(0).find("input").val("");
			$(this).parents("tr").find("td").eq(1).find("input").val("");
			$(this).parents("tr").find("img").attr("src","");
			$(this).parents("tr").find("span.am-badge").remove();
			alert("删除该行数据");
		}else{
			
			$(this).parents("tr").hide();
			$(this).parents("tr").find(".doc-form-file").remove();
		}
}
//获取该类别下某页的的商品
function getGoodsInfo(goodsId,pageNum){
	 //获取该类别下的商品
	$.ajax({
		 type:"POST", //请求方式  
      url:"getAllDetailByGoodsId.action",
      /*data : JSON.stringify(vale),*/
      data:"goodsId="+goodsId+"&pageNum="+pageNum,  
    /* contentType:'application/json;charset=UTF-8',*/
   /*  async : false,*/
      dataType: 'json', 
      cache: false,   
      success:function(data){ 
   	   $("#goodsDetail tr").each(function(){
   		   $(this).remove();
   	   })
   	   var button = "<td class='saveDetail'><div class=\"tpl-table-black-operation\"><a href=\"javascript:; \" class='saveDetail' ><i class=\"am-icon-pencil\"></i> 保存</a><a href=\"javascript:;\" class='deleteDetail' ><i class=\"am-icon-trash\"></i> 删除</a></div></td>";
   	   var picture = "<td class='picture'><a href='javascript:;' class='picture'> 图片</a></td>";
   	   var checkKind = "<img class='img_kind' src=''><span class='res_kind' style='color:#ff5b5b;font-size: 14px;'></span>";
   	   var checkColor = "<img class='img_color' src=''><span class='res_color' style='color:#ff5b5b;font-size: 14px;'></span>";
   	   var checkPrimePrice = "<img class='img_prime_price' src=''><span class='res_prime_price' style='color:#ff5b5b;font-size: 14px;'></span>";
   	   var checkDiscountPrice = "<img class='img_discount_price' src=''><span class='res_discount_price' style='color:#ff5b5b;font-size: 14px;'></span>";
   	   for(var i=0;i<data.detailInfo.length; i++){
	             $("#goodsDetail").append("<tr> " +
	             		"<td><input type='text' class='kind' value="+data.detailInfo[i].kind+">"+checkKind+"</td>" +
	             		"<td><input type='text' class='color' value="+data.detailInfo[i].color+">"+checkColor+"</td>" +
	             		"<td><input type='text' class='prime_price' value="+data.detailInfo[i].prime_price+">"+checkPrimePrice+"</td>" +
	             		"<td><input type='text' class='discount_price' value="+data.detailInfo[i].discount_price+">"+checkDiscountPrice+"</td>"+
	             		picture+button+"<input type='hidden' class='detailId' value="+data.detailInfo[i].goods_detail_id+">" +
	             				"</tr>");  
   	   }
	   	$("#page").find("li").remove();
		//分页   
	   if(pageNum==1){
		$("#page").append("<li class='am-disabled'><a href='#'>«</a></li>");
	   }else{
		$("#page").append("<li ><a href='#' onclick='getGoodsInfo("+goodsId+","+(pageNum-1)+")'>«</a></li>");
	   }
	      	   
	   for(var i=1;i<=data.pageCount;i++){
		   if(pageNum==i){
			$("#page").append("<li class='am-active'><a href='#' onclick='getGoodsInfo("+goodsId+","+i+")'>"+i+"</a></li>");
		   }else{
			$("#page").append("<li ><a href='#' onclick='getGoodsInfo("+goodsId+","+i+")'>"+i+"</a></li>");
		   }   		      		   
	   }
	   if(pageNum==data.pageCount){
		 $("#page").append("<li class='am-disabled'><a href='#'>»</a></li>");
	   }else{
		 $("#page").append("<li ><a href='#' onclick='getGoodsInfo("+goodsId+","+(pageNum+1)+")'>»</a></li>");
	   }
      }  
	}); 
  	   
  	  
 }  


$(document).ready(function(){
	//初始化
	attributeHtml = "<tr>"+$("#attribute").find("tr").eq(0).html()+"</tr>";
	pictureHtml = "<tr>" +$("#pictureList").find("tr").eq(0).html()+"</tr>";
	detailPicHtml = "<tr>" +$("#detailPictureList").find("tr").eq(0).html()+"</tr>";
	//初始化商品类别下拉框
	$.ajax({
		 type:"POST", //请求方式  
     url:"getALLCategory.action", //请求路径  
     cache: false,     
     dataType: 'json',   //返回值类型  
     success:function(json){ 
 
	 for(var i=0;i<json.length; i++){
           $(".category").append("<option value="+json[i].goods_category_id+">"+json[i].category_name+"</option>"); 
	 }
    	
     }  
	});  
	//商品类别改变，获取该类别下的商品初始化商品名称下拉框
	$("#goodsForm .category").change(function(){
		//alert(1);
		var categoryId = $(".category option:selected").val();
		
		 //获取该类别下的商品
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllGoodsByCategoryId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"categoryId="+categoryId,
	     /* contentType:'application/json;charset=UTF-8',*/
	      async : false,
	       traditional:true,
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   goodsData = data;
	    	   $("#goods option").each(function(){
	    		   $(this).remove();
	    	   })
	    	   $("#goods").append(goodsOption); 
	    	   for(var i=0;i<data.length; i++){
		             $("#goods").append("<option value="+data[i].goods_id+">"+data[i].goods_name+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
	});
	//初始化显示该商品第一页的版本数据
	$("#goods").change(function(){
		var goodsId = $("#goods option:selected").val();
		getGoodsInfo(goodsId,1);
		
	});
	$("#deleteGoods").click(function(){
		var goodsId = $("#goods").val();
		
		if(goodsId==0){
			alert("请先选择商品");
			return;
		}
		//删除该商品
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"deleteGoodsByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,
	     /* contentType:'application/json;charset=UTF-8',*/
	      async : false,
	       traditional:true,
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   alert("删除成功");
	    	  
	    	   $("#goods option:selected").remove();
	    	  
	       }  
	   }); 
	})
	//保存更改的商品版本信息
	$("#goodsDetail").on('click',"a.saveDetail",function(){
		$(this).parents("tr").find(".kind").blur();
		$(this).parents("tr").find(".prime_price").blur();
		var kind = $.trim($(this).parents("tr").find("input").eq(0).val());
		if(kind==""){
			alert("请输入版本名称");
			return;
		}
		if(!colorFlag||!primePriceFlag||!discountPriceFlage){
			alert("请输入正确数据");
			return;
		}
		var color = $(this).parents("tr").find("input").eq(1).val();
		var prime_price = $(this).parents("tr").find("input").eq(2).val();
		var discount_price = $(this).parents("tr").find("input").eq(3).val();
		var goods_detail_id = $(this).parents("tr").find("input").eq(4).val();
		var goodsDetail = {"goods_detail_id": goods_detail_id,"kind" : kind,"color" : color,"prime_price" :prime_price,"discount_price" : discount_price};
		$.ajax({
			 type:"POST", //请求方式  
	       url:"updateDetail.action",
	       /*data : JSON.stringify(vale),*/
	       data:JSON.stringify(goodsDetail),
	      contentType:'application/json;charset=UTF-8',
	    /*  async : false,*/
	       dataType: 'text', 
	       cache: false,   
	       success:function(data){ 
	    	   if(data=="true"){
	    		   alert("保存成功")
	    	   }
	    	   
	       }
	   }); 
	});
	//删除该商品版本信息
	$("#goodsDetail").on('click',"a.deleteDetail",function(){
		var goods_detail_id = $(this).parents("td").next().val();
		$.ajax({
			 type:"POST", //请求方式  
	       url:"deleteDetail.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goods_detail_id="+goods_detail_id,
	      /*contentType:'application/json;charset=UTF-8',*/
	       dataType: 'text', 
	       async : false,
	       success:function(data){
	    	   if(data=="true")
	    	   alert("删除成功");
	       }
	   }); 
		$(this).parents("tr").remove();
	})
	$("#confirm").click(function(){
		//var number = $("attribute").rows.length-1;
		var i = 0;
		$(".attributeName").each(function(){
			$(this).attr("name","attributeList["+i+"].attribute_name");
			i++;
		});
		i = 0;
		$(".attributeValue").each(function(){
			$(this).attr("name","attributeList["+i+"].attribute_value");
			i++;
		});
		$("#addGoods").submit();
		
	});
	
	$("#attribute").on('click','.am-btn.am-btn-default.am-btn-success',function(){
		$(this).parents("tr").after(attributeHtml);
	});
	$("#attribute").on('click','.am-btn.am-btn-default.am-btn-danger',removeTr);
	$("#pictureList").on('click','.am-btn.am-btn-default.am-btn-success',function(){
		$(this).parents("tr").after(pictureHtml);
	});
	$("#pictureList").on('click','.am-btn.am-btn-default.am-btn-danger',removeTr);
	$("#detailPictureList").on('click','.am-btn.am-btn-default.am-btn-success',function(){
		$(this).parents("tr").after(detailPicHtml);
	});
	$("#detailPictureList").on('click','.am-btn.am-btn-default.am-btn-danger',removeTr);
	$("form").on('change','.doc-form-file', function() {
		  var fileNames = '';
		  var filePath = $(this).val();
		  var src = window.URL.createObjectURL(this.files[0]);
		  //表单里
		  $(this).parents("div.am-form-group.am-form-file").prev().attr("src",src);
		  //表格内的图片
		  $(this).parents("td").prev().find("img").attr("src",src);
		  $(this).parents("tr").find("input.goods_pre_pic_status").val(1);
		  $(this).parents("tr").find("input.picture_set_status").val(1);
		  $.each(this.files, function() {
			fileNames += '<span class="am-badge">' + this.name + '</span> ';
		  });
		  //alert(1);
		  $(this).next().html(fileNames);
	});
	//商品信息按钮点击，发送商品id查找商品信息
  $('#goodsInfoButton').off('click').on('click',function() {
	  //alert(1);
	  var categoryId = $("#goodsForm").find(".category").val();
	  //alert(categoryId);
	  if(categoryId==0){
		  alert("请先选择商品类别");
		  return;
	  }
	  var goodsId = $("#goods option:selected").val();
	  if(goodsId==0){
		  alert("请选择商品名称");
		  return;
	  }
	  $("#goodsInfo .file-list").find("span").remove();
	  $("#goodsInfo input").each(function(){
			 $(this).val("");
	 })

	  //alert(goodsId);
	  $.ajax({
			 type:"POST", //请求方式  
	       url:"getGoodsByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId, 
	     /* contentType:'application/json;charset=UTF-8',*/
	       async : false,
	       dataType: 'json',
	       cache: false,   
	       success:function(data){ 
	    	   //alert(1);
	    	   //alert(data.goods_category_id);
	    	   $("#goodsId").val(data.goods_id);
	    	   
	    	   $("#goodsInfo .category").val(data.goods_category_id);
	    	   $("#goodsInfo .category").trigger('changed.selected.amui');
	    	   $("#goods_name").val(data.goods_name);
	    	   $("#goods_code").val(data.goods_code);
	    	   $("#profilePic").attr("src",data.goods_pic_url);
	    	   $("#goodsIntroductionPic").attr("src",data.goods_desc_pic_url);
	    	   $("#goodsVideo").attr("src",data.video_set_url);
	    	   $("#goodsInfo .category").find("option").each(function(){
	    		   if($(this).val()==0){
	    			   $(this).remove();
	    			   return;
	    		   }
	    	   });
	       }  
	   }); 
	  $("#goods_name").blur();
	  $("#goods_code").blur();
	$('#goodsInfo').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		 
		  if(!nameFlag||!codeFlag){
			  alert("请输入正确数据");
			  return;
		  }
		 $("#changeGoods").attr("target","rfFrame");
		 $("#changeGoods").submit();
		 
	  },
	  onCancel: function(e) {
		 
		
	  }
	});
  });
  //根据goodsId查找商品图片信息
  $('#goodsPicButton').off('click').on('click', function() {
	  var categoryId = $("#goodsForm").find(".category").val();
	  if(categoryId==0){
		  alert("请先选择商品类别");
		  return;
	  }
	  var goodsId = $("#goods option:selected").val();
	  if(goodsId==0){
		  alert("请选择商品名称");
		  return;
	  }
	  $("#goodsPic tbody").find("tr").remove();
	  $("#goodsPic tbody").append(pictureHtml);
	  $.ajax({
			 type:"POST", //请求方式  
	       url:"getGoodsPicByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,  
	     /* contentType:'application/json;charset=UTF-8',*/
	      
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   $("#goodsPic tbody").find("img").attr("src",data[0].goods_url);
	    	   $("#goodsPic tbody").find(".goods_preview_pic_id").val(data[0].goods_preview_pic_id);
	    	   $("#goodsPic tbody").find(".goods_pre_pic_status").val(0);
	    	   $("#goodsPic .goods_id").val(data[0].goods_id);
	    	   for(var i=1;i<data.length;i++){
	    		   $("#goodsPic tbody").append(pictureHtml);
	    		   $("#goodsPic tbody").find("tr").eq(i).find("img").attr("src",data[i].goods_url);
		    	   $("#goodsPic tbody").find("tr").eq(i).find(".goods_preview_pic_id").val(data[i].goods_preview_pic_id);
		    	   $("#goodsPic tbody").find("tr").eq(i).find(".goods_pre_pic_status").val(0);
	    	   }
	       }  
	   }); 
	$('#goodsPic').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		  $("#changePic").attr("target","rfFrame");
		  var i = 0;
		  $("#goodsPic .goods_preview_pic_id").each(function(){
			  $(this).attr("name","goodsPreviewPictureList["+i+"].goods_preview_pic_id");
			  i++;
		  })
		  i=0;
		  $("#goodsPic .goods_pre_pic_status").each(function(){
			  $(this).attr("name","goodsPreviewPictureList["+i+"].goods_pre_pic_status");
			  i++;
		  })
		  //删除状态为0，id为0的行
		  $("#goodsPic tbody").find("tr").each(function(){
			  if($(this).find("input.goods_preview_pic_id").val()==0&&$(this).find("input.goods_pre_pic_status").val==0){
				  $(this).remove();
			  }
		  });
		 $("#changePic").submit();
	  },
	  onCancel: function(e) {
		
	  }
	});
  });
   $('#goodsAttributeButton').on('click', function() {	  
	   var categoryId = $("#goodsForm").find(".category").val();
		  if(categoryId==0){
			  alert("请先选择商品类别");
			  return;
		  }
		  var goodsId = $("#goods option:selected").val();
		  if(goodsId==0){
			  alert("请选择商品名称");
			  return;
		  }
	   	$("#goodsAttribute tbody").find("tr").remove();
		  $("#goodsAttribute tbody").append(attributeHtml);
		  
		  $.ajax({
				 type:"POST", //请求方式  
		       url:"getAttributesByGoodsId.action",
		       /*data : JSON.stringify(vale),*/
		       data:"goodsId="+goodsId,  
		     /* contentType:'application/json;charset=UTF-8',*/
		       
		       dataType: 'json', 
		       cache: false,   
		       success:function(data){ 
		    	   $("#goodsAttribute .goods_id").val(data[0].goods_id);
		    	   $("#goodsAttribute .attributeName").val(data[0].attribute_name);
		    	   $("#goodsAttribute .attributeValue").val(data[0].attribute_value);
		    	   $("#goodsAttribute .goods_attribute_id").val(data[0].goods_attribute_id);
		    	   for(var i=1;i<data.length;i++){
		    		   $("#goodsAttribute tbody").append(attributeHtml);
		    		   $("#goodsAttribute tbody").find("tr").eq(i).find(".attributeName").val(data[i].attribute_name);
			    	   $("#goodsAttribute tbody").find("tr").eq(i).find(".attributeValue").val(data[i].attribute_value);
			    	   $("#goodsAttribute tbody").find("tr").eq(i).find(".goods_attribute_id").val(data[i].goods_attribute_id);
		    	   }
		       }  
		   }); 
	$('#goodsAttribute').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		  if(!attributeNameFlag||!attributeValueFlag||!repeatFlag){
			  alert("输入有误!");
			  return;
		  }
		  //删除空行
			$("#attribute").find("tr").each(function(){
				if($.trim($(this).find(".attributeValue").val())==""&&$(this).find(".goods_attribute_id").val()==0){
					$(this).remove();
				}
			});
		  $("#changeAttribute").attr("target","rfFrame");
		  var i = 0;
			$("#goodsAttribute .attributeName").each(function(){
				$(this).attr("name","goodsAttributeList["+i+"].attribute_name");
				i++;
			});
			i = 0;
			$("#goodsAttribute .attributeValue").each(function(){
				$(this).attr("name","goodsAttributeList["+i+"].attribute_value");
				i++;
			});
			i=0;
			$("#goodsAttribute .goods_attribute_id").each(function(){
				$(this).attr("name","goodsAttributeList["+i+"].goods_attribute_id");
				i++;
			})
			i=0;
			$("#goodsAttribute .attribute_status").each(function(){
				$(this).attr("name","goodsAttributeList["+i+"].attribute_status");
				i++;
			})
			$("#changeAttribute").submit();
	  },
	  onCancel: function(e) {
		
	  }
	});
  });
   $('#goodsDetail').on('click','a.picture', function() {	 
	   	$("#detailPicture tbody").find("tr").remove();
		$("#detailPicture tbody").append(detailPicHtml);
		var datailId = $(this).parents("tr").find("input.detailId").val();
		
		$.ajax({
			 type:"POST", //请求方式  
	       url:"getDetailPicByDetailId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"detailId="+datailId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	       
	       dataType: 'json',   
	       success:function(data){ 
	    	   $("#detailPicture tbody").find("img").attr("src",data[0].picture_set_url);
	    	   $("#detailPicture .goods_detail_id").val(data[0].goods_detail_id);
	    	   $("#detailPicture tbody").find(".picture_set_id").val(data[0].picture_set_id);
	    	   $("#detailPicture tbody").find(".picture_set_status").val(0);
	    	   for(var i=1;i<data.length;i++){
	    		   $("#detailPicture tbody").append(detailPicHtml);
	    		   $("#detailPicture tbody").find("tr").eq(i).find("img").attr("src",data[i].picture_set_url);
		    	   $("#detailPicture tbody").find("tr").eq(i).find(".picture_set_id").val(data[i].picture_set_id);
		    	   $("#detailPicture tbody").find("tr").eq(i).find(".picture_set_status").val(0);
	    	   }
	       }  
	   }); 
		$('#detailPicture').modal({
		  relatedTarget: this,
		  onConfirm: function(e) {
			 
			  $("#changeDetailPic").attr("target","rfFrame");
			  var i = 0;
			  $("#detailPicture .picture_set_id").each(function(){
				  $(this).attr("name","goodsPictureList["+i+"].picture_set_id");
				  i++;
			  })
			  i = 0;
			  $("#detailPicture .picture_set_status").each(function(){
				  $(this).attr("name","goodsPictureList["+i+"].picture_set_status");
				  i++;
			  })
			   //删除状态为0，id为0的行
			  $("#detailPicture tbody").find("tr").each(function(){
				  if($(this).find("input.picture_set_id").val()==0&&$(this).find("input.picture_set_status").val==0){
					  $(this).remove();
				  }
			  });
			  $("#changeDetailPic").submit();
		  },
		  onCancel: function(e) {
			
		  }
		});
	  });
   //商品参数改变标记状态为1
   $("#attribute").on('change',"input",function(){
	   $(this).parents("tr").find(".attribute_status").val(1);
   });
   
   //商品类别名改变时验证商品名称
   $("#goodsInfo").find(".category").change(function(){
		$("#goods_name").blur();		
	})
	//验证商品信息输入
	//验证商品名称
	$("#goods_name").blur(function(){
		var goodsCategoryId = $("#goodsInfo").find(".category").val();
		var goodsId = $("#goodsId").val();
		var goodsName = $("#goods_name").val();
		//alert(goodsName);
		var goods = {"goods_name" : goodsName,"goods_category_id" : goodsCategoryId,"goods_id" : goodsId};
		
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validateGoodsName.action", //请求路径  
	      data: JSON.stringify(goods),
	      contentType:'application/json;charset=UTF-8',
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		nameFlag = true;
	        		$("#img_goods_name").attr("src","asset/img/tick.png");
	        		$("#res_goods_name").html("");
	        	}
	        	else {
	        		nameFlag = false;
	        		$("#img_goods_name").attr("src","asset/img/error.png");
	        		if(text=="false"){
	        			$("#res_goods_name").html("商品名称已存在");
	        		}
	        		if(text=="void"){
	        			$("#res_goods_name").html("商品名称不能为空");
	        		}
	        		
	        	}
	      }  
	  });  
	})
	//验证商品代码
	$("#goods_code").blur(function(){
		var goods_code = $("#goods_code").val();
		var goodsId = $("#goodsId").val(); 
		if(!(/(^[0-9]*[1-9][0-9]*$)/.test(goods_code))){
			
			$("#img_goods_code").attr("src","asset/img/error.png");
			$("#res_goods_code").html("商品代码最小为1并且不能是小数");
			return;
		}
		if(goods_code==""){
			goods_code = 0;
		}
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validateGoodsCode.action", //请求路径  
	      data: "goods_code="+goods_code+"&goods_id="+goodsId,
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		codeFlag = true;
	        		$("#img_goods_code").attr("src","asset/img/tick.png");
	        		$("#res_goods_code").html("");
	        	}
	        	else {
	        		codeFlag = false;
	        		$("#img_goods_code").attr("src","asset/img/error.png");
	        		if(text=="false"){
	        			$("#res_goods_code").html("商品代码已存在");
	        		}
	        		if(text=="void"){
	        			$("#res_goods_code").html("商品代码不能为空");
	        		}
	        		
	        	}
	      }  
	  });  
	})
	//参数名称验证
	$("#attribute").on('blur',".attributeName",function(){
		if($.trim($(this).val())==""^$.trim($(this).parents("tr").find(".attributeValue").val())==""){
			attributeNameFlag = false;
			if($.trim($(this).val())==""){
				$(this).siblings(".img_attributeName").attr("src","asset/img/error.png");
        		$(this).siblings(".res_attributeName").html("参数名称不能为空");
			}
			else{
				$(this).siblings(".img_attributeName").attr("src","asset/img/tick.png");
        		$(this).siblings(".res_attributeName").html("");
				$(this).parents("tr").find(".attributeValue").blur();
			}
			
		}else{
			
			
    		$(this).siblings(".img_attributeName").attr("src","asset/img/tick.png");
    		$(this).siblings(".res_attributeName").html("");
    		if(!attributeNameFlag){
    			attributeNameFlag = true;
    			$(this).parents("tr").find(".attributeValue").blur();
    		}
    		//验证参数名是否重复
			var attributeName = $.trim($(this).val());
    		if(attributeName!=""){
    			var number = 0;
    			$(this).parents("tr").siblings().each(function(){
    				if(attributeName==$(this).find(".attributeName").val()){
    					repeatFlag = false;
    					$(this).find(".img_attributeName").attr("src","asset/img/error.png");
    	        		$(this).find(".res_attributeName").html("参数名称不能重复");
    	        		number++;
    				}
    			});
    			if(number>0){
    				
    				$(this).siblings(".img_attributeName").attr("src","asset/img/error.png");
    	    		$(this).siblings(".res_attributeName").html("参数名称不能重复");
    	    		
    			}else{
    				
    				if(!repeatFlag){
    					repeatFlag = true;
    					$(this).parents("tr").siblings().each(function(){
    						$(this).find(".attributeName").blur();
    					});
    				}
    				
    				
    			}
    		}
		}
	});
	//参数值验证
	$("#attribute").on('blur',".attributeValue",function(){
		if($.trim($(this).val())==""^$.trim($(this).parents("tr").find(".attributeName").val())==""){
			attributeValueFlag = false;
			if($.trim($(this).val())==""){
				$(this).siblings(".img_attributeValue").attr("src","asset/img/error.png");
        		$(this).siblings(".res_attributeValue").html("参数值不能为空");
			}
			else{
				$(this).siblings(".img_attributeValue").attr("src","asset/img/tick.png");
        		$(this).siblings(".res_attributeValue").html("");
				$(this).parents("tr").find(".attributeName").blur();
			}
			
		}else{
						
    		$(this).siblings(".img_attributeValue").attr("src","asset/img/tick.png");
    		$(this).siblings(".res_attributeValue").html("");
    		if(!attributeValueFlag){
    			attributeValueFlag = true;
    			$(this).parents("tr").find(".attributeName").blur();
    		}
    	
		}
	});
	//版本改变后,判断版本是否为空
	$("#goodsDetail").off('blur').on('blur',".kind",function(){
		$(this).parents("tr").find(".color").blur();
		var kind = $.trim($(this).val());
		if(kind==""){
			$(this).parents("tr").find(".img_kind").attr("src","asset/img/error.png");
			$(this).parents("tr").find(".res_kind").html("版本名称不能为空");
		}else{
			$(this).parents("tr").find(".img_kind").attr("src","asset/img/tick.png");
			$(this).parents("tr").find(".res_kind").html("");
		}
	});
	
	
	//判断该颜色是否存在
	$("#goodsDetail").off('blur').on('blur',".color",function(){
		var kind = $.trim($(this).parents("tr").find(".kind").val());
		if(kind==""||kind==0){
			$(this).parents("tr").find(".img_color").attr("src","");
			$(this).parents("tr").find(".res_color").html("");
			return;
		}
		var color = $.trim($(this).val());
		var goodsDetailId = $(this).parents("tr").find(".detailId").val();
		var goodsId = $("#goods").val();
		var goodsDetail = {"goods_detail_id" : goodsDetailId,"goods_id" : goodsId,"color" : color,"kind" : kind};
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validateGoodsDetailColor.action", //请求路径  
	      data: JSON.stringify(goodsDetail),
	      contentType:'application/json;charset=UTF-8',
	      dataType: 'text',   //返回值类型  
	      async : false,
	      success:function(text){       
	    	  flag = text;
	        	//alert(flag);
	      }  
	  });
		if(flag=="true"){
    		colorFlag = true;
    		$(this).parents("tr").find(".img_color").attr("src","asset/img/tick.png");
    		$(this).parents("tr").find(".res_color").html("");
    	}
    	else {
    		colorFlag = false;
    		$(this).parents("tr").find(".img_color").attr("src","asset/img/error.png");
    		if(flag=="false"){
    			$(this).parents("tr").find(".res_color").html("商品颜色已存在");
    		}
    		if(flag=="void"){
    			$(this).parents("tr").find(".res_color").html("商品颜色不能为空");
    		}
    		
    	}
	});
	
	//判断原价是否输入正确
	$("#goodsDetail").off('blur').on('blur',".prime_price",function(){
		var prime_price = $.trim($(this).val());
		$(this).parents("tr").find(".discount_price").blur();
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validatePrice.action", //请求路径  
	      data: "price="+prime_price,
	      /*contentType:'application/json;charset=UTF-8',*/
	      dataType: 'text',   //返回值类型  
	      async : false,
	      success:function(text){       
	    	  flag = text;
	    	  //alert(flag);
	      }  
	  }); 
		if(flag=="true"){
    		primePriceFlag = true;
    		$(this).parents("tr").find(".img_prime_price").attr("src","asset/img/tick.png");
    		$(this).parents("tr").find(".res_prime_price").html("");
    	}
    	else {
    		primePriceFlag = false;
    		$(this).parents("tr").find(".img_prime_price").attr("src","asset/img/error.png");
    		if(flag=="false"){
    			$(this).parents("tr").find(".res_prime_price").html("请输入正确金额");
    		}
    		if(flag=="void"){
    			$(this).parents("tr").find(".res_prime_price").html("商品原价不能为空");
    		}
    		
    	}
	})
	
	//判断折扣价是否输入正确
	$("#goodsDetail").off('blur').on('blur',".discount_price",function(){
		var prime_price = $.trim($(this).parents("tr").find(".prime_price").val());
		var discount_price = $.trim($(this).val());
		//如果全为数字，判断折扣价小于原价
		if(!isNaN(prime_price)&&!isNaN(discount_price)&&Number(discount_price)>Number(prime_price)){
			discountPriceFlage = false;
			$(this).parents("tr").find(".img_discount_price").attr("src","asset/img/error.png");
			$(this).parents("tr").find(".res_discount_price").html("折扣价应小于等于原价");
    		return;
		}
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validatePrice.action", //请求路径  
	      data: "price="+discount_price,
	      /*contentType:'application/json;charset=UTF-8',*/
	      dataType: 'text',   //返回值类型  
	      async : false,
	      success:function(text){       
	    	  flag = text;
	        	
	      }  
	  }); 
		if(flag=="true"){
    		discountPriceFlage = true;
    		$(this).parents("tr").find(".img_discount_price").attr("src","asset/img/tick.png");
    		$(this).parents("tr").find(".res_discount_price").html("");
    	}
    	else {
    		discountPriceFlage = false;
    		$(this).parents("tr").find(".img_discount_price").attr("src","asset/img/error.png");
    		if(flag=="false"){
    			$(this).parents("tr").find(".res_discount_price").html("请输入正确金额");
    		}
    		if(flag=="void"){
    			$(this).parents("tr").find(".res_discount_price").html("商品折扣价不能为空");
    		}
    		
    	}
	});
	
})