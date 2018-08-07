//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var kindOption = "<option value='0'>请选择版本</option>";
var colorOption = "<option value='0'>请选择颜色</option>";
//标记新增库存量是否正确
var stockFlag = false;
//存储版本库存信息
var stockData;
$(document).ready(function(){
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
	    /*  async : false,*/
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	  
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
	$("#goods").change(function(){
		var goodsId = $("#goods option:selected").val();
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllKindByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	    /*  async : false,*/
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
	$("#goods").change(function(){
		var goodsId = $("#goods option:selected").val();
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllKindByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	    /*  async : false,*/
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
	$("#kind").change(function(){
		var goodsId = $("#goods option:selected").val();
		var kindName = $("#kind option:selected").val();
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllColorBygoodsIdAndKind.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goods_id="+goodsId+"&kind="+kindName,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	    /*  async : false,*/
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   stockData = data;
	    	   $("#color option").each(function(){
	    		   $(this).remove();
	    	   })
	    	   $("#color").append(colorOption); 
	    	   for(var i=0;i<data.length; i++){
		             $("#color").append("<option value="+data[i].goods_detail_id+">"+data[i].color+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
	});
	$("#color").change(function(){
		var stockId = $("#color option:selected").val();
		for(var i=0;i<stockData.length;i++){
			if(stockData[i].goods_detail_id==stockId){
				$("#stock").attr("value",stockData[i].stock);
				break;
			}
		}
	});
	$("#stockNum").blur(function(){
		var stock = $(this).val();
		if(!(/(^[0-9]*[1-9][0-9]*$)/.test(stock))){
			stockFlag = false;
			$("#img_stock").attr("src","asset/img/error.png");
			$("#res_stock").html("新增商品库存量最小为1并且必须是整数");	
			
		}
		else{
			stockFlag = true;
			$("#img_stock").attr("src","asset/img/tick.png");
			$("#res_stock").html("");		
		}
	});
	$("#confirm").click(function(){
		var category = $("#category").val();
		if(category==0){
			alert("请先选择商品类别");
			return;
		}
		var goods = $("#goods").val();
		if(goods==0){
			alert("请先选择商品名称");
			return;
		}
		var kind = $("#kind").val();
		if(kind==0){
			alert("请先选择商品版本");
			return;
		}
		var color = $("#color").val();
		if(color==0){
			alert("请先选择商品颜色");
			return;
		}
		$("#stockNum").blur();
		if(!stockFlag){
			alert("请输入正确的新增商品库存量");
			return;
		}
		$("#stockForm").submit();
	});
})