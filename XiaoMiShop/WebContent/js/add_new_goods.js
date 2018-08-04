var buttonHtml = "";
var flag = false;
var flag2 = false;
var flag3 = false;
$(document).ready(function(){
	buttonHtml = "<tr>"+$("#attribute").find("tr").eq(0).html()+"</tr>";
	$.ajax({
		 type:"POST", //请求方式  
     url:"getALLCategory.action", //请求路径  
     cache: false,     
     dataType: 'json',   //返回值类型  
     success:function(json){ 
  	   categoryData = json;
    	 for(var i=0;i<json.length; i++){
	             $("#category").append("<option value="+json[i].goods_category_id+">"+json[i].category_name+"</option>")  
    	 }
    	
     }  
	});
	$("#category").change(function(){
		$("#goods_name").blur();
		
	})
	$("#goods_name").blur(function(){
		var goodsCategoryId = $("#category").val();
		var goodsName = $.trim($("#goods_name").val());
		var goodsInfo = {"goods_name" : goodsName,"goods_category_id" : goodsCategoryId};
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validateGoodsName.action", //请求路径  
	      data: JSON.stringify(goodsInfo),
	      contentType:'application/json;charset=UTF-8',
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		flag = true;
	        		$("#img_goods_name").attr("src","asset/img/tick.png");
	        		$("#res_goods_name").html("");
	        	}
	        	else {
	        		flag = false;
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
	$("#goods_code").blur(function(){
		var goods_code = $("#goods_code").val();
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
	      data: "goods_code="+goods_code,
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		flag2 = true;
	        		$("#img_goods_code").attr("src","asset/img/tick.png");
	        		$("#res_goods_code").html("");
	        	}
	        	else {
	        		flag2 = false;
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
			flag3 = false;
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
    		if(!flag3){
    			flag3 = true;
    			$(this).parents("tr").find(".attributeValue").blur();
    		}
    		
		}
	})
	//参数值验证
	$("#attribute").on('blur',".attributeValue",function(){
		if($.trim($(this).val())==""^$.trim($(this).parents("tr").find(".attributeName").val())==""){
			flag3 = false;
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
    		if(!flag3){
    			flag3 = true;
    			$(this).parents("tr").find(".attributeName").blur();
    		}
    	
		}
	})
	
	$("#confirm").click(function(){
		//var number = $("attribute").rows.length-1;
		if(!flag||!flag2||!flag3){
			alert("请填写正确数据");
			$("input").blur();
			return;
		}
		//删除空
		$("#attribute").find("tr").each(function(){
			if($.trim($(this).find(".attributeValue").val())==""){
				$(this).remove();
			}
		});
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
	$("tbody").on('click','.am-btn.am-btn-default.am-btn-success',function(){
		//alert(1);
		$(this).parents("tr").after(buttonHtml);
		$(this).parents("tr").next().find(".attributeName").blur();
		$(this).parents("tr").next().find(".attributeValue").blur();
	})
	$("tbody").on('click','.am-btn.am-btn-default.am-btn-danger',function(){
		//alert(1);
		var number = $(this).parents("table").find("tr").length;
		if(number==2){
			alert("不可删除");
		}else{
			$(this).parents("tr").remove();
		}

	})
	$('.doc-form-file').on('change', function() {
		  var fileNames = '';
		  $.each(this.files, function() {
			fileNames += '<span class="am-badge">' + this.name + '</span> ';
		  });
		  //alert(1);
		  $(this).next().html(fileNames);
	});
	
}) 
