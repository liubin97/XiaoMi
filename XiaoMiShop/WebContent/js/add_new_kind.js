//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var kindOption = "<option value='0'>请选择版本</option>";

//标记是否为老版本
var flag = true;
//标记颜色是否输入正确
var colorFlag = false;
//标记原价是否输入正确
var primePriceFlag = false;
//标记折扣价是否输入正确
var discountPriceFlage = false;
//记录获取的商品数据
var goodsData;
$(document).ready(function(){
	$("#newKind").hide();
	$("#oldKind").show();
	$.ajax({
		 type:"POST", //请求方式  
     url:"getALLCategory.action", //请求路径  
     cache: false,     
     dataType: 'json',   //返回值类型  
     success:function(json){ 
 
	 for(var i=0;i<json.length; i++){
             $("#category").append("<option value="+json[i].goods_category_id+">"+json[i].category_name+"</option>"); 
	 }
    	
     }  
	});  
	$("#category").change(function(){
		//alert(1);
		var categoryId = $("#category option:selected").val();
		
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
		
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllKindByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   $("#kind option").each(function(){
	    		   $(this).remove();
	    	   })
	    	   $("#kind").append(kindOption); 
	    	   for(var i=0;i<data.length; i++){
		           $("#kind").append("<option value='"+data[i]+"'>"+data[i]+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
	});
	//已有版本和新版本之间的转换
	$(".changeKind").click(function(){
		
		if(flag){	
			
			$("#oldKind").hide();
			$("#newKind").show();
			
			flag = false;
		}
		else{
			
			$("#newKind").hide();
			$("#oldKind").show();
			
			flag = true;
		}
	});
	//版本改变后
	$("#kind").change(function(){
		$("#color").blur();
	})
	//判断版本是否为空
	$("#newKind input").blur(function(){
		$("#color").blur();
		var kind = $.trim($(this).val());
		if(kind==""){
			$("#img_kind").attr("src","asset/img/error.png");
			$("#res_kind").html("版本名称不能为空");
		}else{
			$("#img_kind").attr("src","asset/img/tick.png");
			$("#res_kind").html("");
		}
	});
	
	//判断该颜色是否存在
	$("#color").blur(function(){
		var kind;
		var color = $.trim($(this).val());
		var goods_id = $("#goods").val();
		if(goods_id==0){
			$("#img_color").attr("src","");
    		$("#res_color").html("");
			return;
		}
		if(flag){
			kind = $("#kind").val();
		}else{
			kind = $.trim($("#newKind input").val());
		}
		if(kind==""||kind==0){
			$("#img_color").attr("src","");
    		$("#res_color").html("");
			return;
		}
		var goodsDetail = {"goods_id" : goods_id,"color" : color,"kind" : kind};
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validateGoodsDetailColor.action", //请求路径  
	      data: JSON.stringify(goodsDetail),
	      contentType:'application/json;charset=UTF-8',
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		colorFlag = true;
	        		$("#img_color").attr("src","asset/img/tick.png");
	        		$("#res_color").html("");
	        	}
	        	else {
	        		colorFlag = false;
	        		$("#img_color").attr("src","asset/img/error.png");
	        		if(text=="false"){
	        			$("#res_color").html("商品颜色已存在");
	        		}
	        		if(text=="void"){
	        			$("#res_color").html("商品颜色不能为空");
	        		}
	        		
	        	}
	      }  
	  }); 
	})
	//判断原价是否输入正确
	$("#prime_price").blur(function(){
		var prime_price = $.trim($(this).val());
		//初始化折扣价为原价
		$("#discount_price").val(prime_price);
		$("#discount_price").blur();
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validatePrice.action", //请求路径  
	      data: "price="+prime_price,
	      /*contentType:'application/json;charset=UTF-8',*/
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		primePriceFlag = true;
	        		$("#img_prime_price").attr("src","asset/img/tick.png");
	        		$("#res_prime_price").html("");
	        	}
	        	else {
	        		primePriceFlag = false;
	        		$("#img_prime_price").attr("src","asset/img/error.png");
	        		if(text=="false"){
	        			$("#res_prime_price").html("请输入正确金额");
	        		}
	        		if(text=="void"){
	        			$("#res_prime_price").html("商品原价不能为空");
	        		}
	        		
	        	}
	      }  
	  }); 
	})
	//判断折扣价是否输入正确
	$("#discount_price").blur(function(){
		var prime_price = $.trim($("#prime_price").val());
		var discount_price = $.trim($(this).val());
		//如果全为数字，判断折扣价小于原价
		if(!isNaN(prime_price)&&!isNaN(discount_price)&&Number(discount_price)>Number(prime_price)){
			discountPriceFlage = false;
    		$("#img_discount_price").attr("src","asset/img/error.png");
    		$("#res_discount_price").html("折扣价应小于等于原价");
    		return;
		}
		$.ajax({
			 type:"POST", //请求方式  
	      url:"validatePrice.action", //请求路径  
	      data: "price="+discount_price,
	      /*contentType:'application/json;charset=UTF-8',*/
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		discountPriceFlage = true;
	        		$("#img_discount_price").attr("src","asset/img/tick.png");
	        		$("#res_discount_price").html("");
	        	}
	        	else {
	        		discountPriceFlage = false;
	        		$("#img_discount_price").attr("src","asset/img/error.png");
	        		if(text=="false"){
	        			$("#res_discount_price").html("请输入正确金额");
	        		}
	        		if(text=="void"){
	        			$("#res_discount_price").html("商品折扣价不能为空");
	        		}
	        		
	        	}
	      }  
	  }); 
	});
	//提交表单
	$("#confirm").click(function(){
		//判断商品类别是否被选择
		if($("#category").val()==0){
			alert("请选择商品类别");
			return;
		}
		//判断商品名称是否被选择
		if($("#goods").val()==0){
			alert("请选择商品名称");
			return;
			
		}
		//获取当前版本
		var kind;
		if(flag){
			kind = $("#kind").val();
		}else{
			kind = $.trim($("#newKind input").val());
		}
		//判断当前版本是否为空
		if(kind==""){
			alert("请输入商品版本");
			$("#newKind input").blur();
			return;
		}
		if(kind==0){
			alert("请选择商品版本");
			return;
		}
		//判断输入数据是否正确
		if(!colorFlag||!primePriceFlag||!discountPriceFlage){
			//判断版本是否是新版本
			alert("请输入正确数据");
			if(!flag){
				$("#newKind input").blur();
			}else{
				$("#kind").change();
			}
			$("#color").blur();
			$("#prime_price").blur();
			return;
		}
		if(flag){
			$("#newKind").remove();
		}else{	
			$("#oldKind").remove();
		}
		$("#newKindForm").submit();
	})
	$('#doc-form-file').on('change', function() {
		  var fileNames = '';
		  $.each(this.files, function() {
			fileNames += '<span class="am-badge">' + this.name + '</span> ';
		  });
		  $('#file-list').html(fileNames);
		});
})