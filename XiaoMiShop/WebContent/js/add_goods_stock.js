//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var kindOption = "<option value='0'>请选择版本</option>";
var colorOption = "<option value='0'>请选择颜色</option>";
//标记新增库存量是否正确
var stockFlag = false;
//储存库存量信息
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
		 $("#goods option").each(function(){
  		   $(this).remove();
  	   })
  	   $("#goods").append(goodsOption); 
		//alert(1);
		var categoryId = $("#category option:selected").val();
		if(categoryId==0){
			return;
		}
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
	    	  
	    	  
	    	   for(var i=0;i<data.length; i++){
		             $("#goods").append("<option value="+data[i].goods_id+">"+data[i].goods_name+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
	});
	
	$("#goods").change(function(){
		var goodsId = $("#goods option:selected").val();
		if(goodsId==0){
			return;
		}
		$("#kind option").each(function(){
 		   $(this).remove();
 	   })
 	   $("#kind").append(kindOption); 
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
	    	   
	    	   for(var i=0;i<data.length; i++){
		             $("#kind").append("<option value='"+data[i]+"'>"+data[i]+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
	});
	$("#kind").change(function(){
		$("#color option").each(function(){
  		   $(this).remove();
  	   })
  	   $("#color").append(colorOption); 
		var goodsId = $("#goods option:selected").val();
		if(goodsId==0){
			return;
		}
		var kindName = $("#kind option:selected").val();
		
		if(kindName==0){
			return;
		}
		//encodeURI(kindName).replace(/\+/g,'%2B');
		var data = {"goods_id" : goodsId,"kind" : kindName};
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllColorBygoodsIdAndKind.action",
	       /*data : JSON.stringify(vale),*/
	       data:JSON.stringify(data),//请求路径  
	     contentType:'application/json;charset=UTF-8',
	       async : false,
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   stockData = data;
	    	   for(var i=0;i<data.length; i++){
		             $("#color").append("<option value="+data[i].goods_detail_id+">"+data[i].color+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
	});
	$("#color").change(function(){
		$("#stock").val(0);
		var stockId = $("#color option:selected").val();
		if(stockId==0){
			return;
		}
		for(var i=0;i<stockData.length;i++){
			if(stockData[i].goods_detail_id==stockId){
				$("#stock").val(stockData[i].stock);
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