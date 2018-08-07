
//默认选项

var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var attributeHtml = "";

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
		var number = $(this).parents("table").find("tr").length;
		if(number==2){
			alert("不可删除");
		}else{
			$(this).parents("tr").remove();
		}
}

$(document).ready(function(){
	attributeHtml = "<tr>"+$("#attribute").find("tr").eq(0).html()+"</tr>";
	pictureHtml = "<tr>" +$("#pictureList").find("tr").eq(0).html()+"</tr>";
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
	$("#goodsForm .category").change(function(){
		//alert(1);
		var categoryId = $(".category option:selected").val();

		 //获取该类别下的商品
		 $.ajax({
			 type:"POST", //请求方式
	       url:"getAllGoodsByCategoryId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"categoryId="+categoryId,//请求路径
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
	//记录当前商品名称
	$("#goods").change(function(){
		var goodsId = $("#goods option:selected").val();

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
	       url:"getAllDetailByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径
	     /* contentType:'application/json;charset=UTF-8',*/
	    /*  async : false,*/
	       dataType: 'json',
	       cache: false,
	       success:function(data){
	    	   $("#goodsDetail tr").each(function(){
	    		   $(this).remove();
	    	   })
	    	   var button = "<td class='saveDetail'><div class=\"tpl-table-black-operation\"><a href=\"javascript:; \" class='saveDetail' ><i class=\"am-icon-pencil\"></i> 保存</a><a href=\"javascript:; \" ><i class=\"am-icon-trash\"></i> 删除</a></div></td>";
	    	   var picture = "<td class='picture'><a href='javascript:;' class='picture'> 图片</a></td>"
	    	   for(var i=0;i<data.length; i++){
		             $("#goodsDetail").append("<tr> <td><input type='text'  value="+data[i].kind+"></td><td><input type='text'  value="+data[i].color+"></td><td><input type='text'  value="+data[i].prime_price+"></td><td><input type='text'  value="+data[i].discount_price+"></td>"+picture+button+"<input type='hidden' value="+data[i].goods_detail_id+"></tr>");
	     	 }

	       }
	   });
	});
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

	$("form").on('change','.doc-form-file', function() {
		  var fileNames = '';
		  $.each(this.files, function() {
			fileNames += '<span class="am-badge">' + this.name + '</span> ';
		  });
		  //alert(1);
		  $(this).next().html(fileNames);
	});
	//商品信息按钮点击，发送商品id查找商品信息
  $('#goodsInfoButton').off('click').on('click',function() {
	  //alert(1);
	  $("#goodsForm.category").remove();
	  var goodsId = $("#goods option:selected").val();
	  //alert(goodsId);
	  $.ajax({
			 type:"POST", //请求方式
	       url:"getGoodsByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径
	     /* contentType:'application/json;charset=UTF-8',*/
	       async : false,
	       dataType: 'json',
	       cache: false,
	       success:function(data){
	    	   //alert(1);
	    	   //alert(data.goods_category_id);
	    	   $("#goodsInfo .category").val(data.goods_category_id);
	    	   $("#goodsInfo .category").trigger('changed.selected.amui');
	    	   $("#goods_name").val(data.goods_name);
	    	   $("#goods_code").val(data.goods_code);
	    	   $("#profilePic").attr("src",data.goods_pic_url);
	    	   $("#goodsIntroductionPic").attr("src",data.goods_desc_pic_url);
	    	   $("#goodsVideo").attr("src",data.video_set_url);

	       }
	   });

	$('#goodsInfo').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {

	  },
	  onCancel: function(e) {

	  }
	});
  });
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
		alert('不想说!');
	  }
	});
  });
   $('#goodsDetail').on('click','a.picture', function() {
		$('#detailPicture').modal({
		  relatedTarget: this,
		  onConfirm: function(e) {
			alert('你输入的是：' + e.data || '')
		  },
		  onCancel: function(e) {
			alert('不想说!');
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
