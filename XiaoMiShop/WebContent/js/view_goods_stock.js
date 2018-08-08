//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";


//记录获取的商品数据
var goodsData;
//记录输入的库存量是否正确
var stockFlag = false;
function getGoodsInfo(goodsId,pageNum){
	
	 //获取该商品所有版本的库存信息
	$.ajax({
		 type:"POST", //请求方式  
      url:"getAllStockByGoodsId.action",
      /*data : JSON.stringify(vale),*/
      data:"goodsId="+goodsId+"&pageNum="+pageNum,//请求路径  
    /* contentType:'application/json;charset=UTF-8',*/
   /*  async : false,*/
      dataType: 'json', 
      cache: false,   
      success:function(data){ 
   	   $("#goodsDetail tr").each(function(){
   		   $(this).remove();
   	   })
   	   var button = "<td class='saveStock'><div class=\"tpl-table-black-operation\"><a href=\"javascript:; \" ><i class=\"am-icon-pencil\"></i> 保存</a></div></td>";
   	   var checkStock = "<img class='img_stock' src=''><span class='res_stock' style='color:#ff5b5b;font-size: 14px;'></span>";
   	   for(var i=0;i<data.detailList.length; i++){
	             $("#goodsDetail").append("<tr class='goods'> " +
	             		"<td>"+data.detailList[i].kind+"</td>" +
	             		"<td>"+data.detailList[i].color+"</td>" +
	             		"<td><input type='text' class='stock' value="+data.detailList[i].stock+">"+checkStock+"</td>"+
	             		button+"<input type='hidden' class='detail_id' value="+data.detailList[i].goods_detail_id+">" +
	             		"</tr>");  
    	 }
   	   
     	$("#page").find("li").remove();
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
		getGoodsInfo(goodsId,1);
	});
	$("#saveAll").click(function(){
		$("#goodsDetail").find(".stock").each(function(){
			$(this).blur();
			if(!stockFlag){
				alert("请输入正确数据");
				return false;
			}
		});
		var stockData = [];
		var i = 0;
		$("#goodsDetail").find("tr").each(function(){
			var goods_detail_id = $(this).find(".detail_id").val();
			var stock = $(this).find(".stock").val();
			var data = {"goods_detail_id" : goods_detail_id,"stock" : stock};
			stockData.push(data);
		});
		//alert(JSON.stringify(stockData));
		//保存库存修改信息
		$.ajax({
			 type:"POST", //请求方式  
	       url:"updateAllStockChange.action",
	       /*data : JSON.stringify(vale),*/
	       data: JSON.stringify(stockData),//请求路径  
	     contentType:'application/json;charset=UTF-8',
	       traditional:true,
	       dataType: 'text', 
	       cache: false,   
	       success:function(data){ 

	    	   if(data=="true"){
	    		   alert("保存成功");
	    	   }
	    	 
	       }  
	   }); 
	});
	//验证输入的商品库存量
	$("#goodsDetail").off('blur').on('blur',".stock",function(){
		
		var stock = $(this).val();
		if(!(/(^[0-9]*[0-9][0-9]*$)/.test(stock))){
			stockFlag = false;
			$(this).parents("td").find(".img_stock").attr("src","asset/img/error.png");
			$(this).parents("td").find(".res_stock").html("商品库存量最小为0并且必须是整数");	
			
		}
		else{
			stockFlag = true;
			$(this).parents("td").find(".img_stock").attr("src","asset/img/tick.png");
			$(this).parents("td").find(".res_stock").html("");		
		}
	});
	$("#goodsDetail").off('click').on('click','a',function(){
		$(this).parents("tr").find(".stock").blur();
		if(!stockFlag){
			alert("请输入正确的商品库存量");
			return;
		}
		var stock = $(this).parents("td.saveStock").prev().children().val();
		var goods_detail_id = $(this).parents("td.saveStock").next().val();
		
		$.ajax({
			 type:"POST", //请求方式  
	       url:"updateStockChange.action",
	       /*data : JSON.stringify(vale),*/
	       data:"stock="+stock+"&goods_detail_id="+goods_detail_id,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	    /*  async : false,*/
	       dataType: 'text', 
	       cache: false,   
	       success:function(data){ 
	    	  if(data=="true"){
	    		  alert("保存成功");
	    	  }
	    	 
	       }  
	   }); 
	})

})