//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var kindOption = "<option value='0'>请选择版本</option>";

//标记是否为新版本
var flag = false;
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
		for(var i=0;i<goodsData.length; i++){
			 if(goodsData[i].goods_id==goodsId){
				 $("#goodsName").prop("value",goodsData[i].goods_name);
				 break;
			 }
			 
		 }
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
		             $("#kind").append("<option value="+data[i]+">"+data[i]+"</option>"); 
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
	//提交表单
	$("#confirm").click(function(){
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