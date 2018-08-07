//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";


//记录获取的商品数据
var goodsData;
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
		$.ajax({
			 type:"POST", //请求方式  
	       url:"getAllStockByGoodsId.action",
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
	    	   var button = "<td class='saveStock'><div class=\"tpl-table-black-operation\"><a href=\"javascript:; \" ><i class=\"am-icon-pencil\"></i> 保存</a></div></td>";
	    	   for(var i=0;i<data.length; i++){
		             $("#goodsDetail").append("<tr class='goods'> <td>"+data[i].kind+"</td><td>"+data[i].color+"</td><td><input type='text'  value="+data[i].stock+"></td>"+button+"<input type='hidden' value="+data[i].goods_detail_id+"></tr>");  
	     	 }
	    	 
	       }  
	   }); 
	});
	$("#goodsDetail").on('click','a',function(){
		
		var stock = $(this).parents("td.saveStock").prev().children().val();
		var goods_detail_id = $(this).parents("td.saveStock").next().val();
		
		$.ajax({
			 type:"POST", //请求方式  
	       url:"updateStockChange.action",
	       /*data : JSON.stringify(vale),*/
	       data:"stock="+stock+"&goods_detail_id="+goods_detail_id,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	    /*  async : false,*/
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	  alert(data);
	    	 
	       }  
	   }); 
	})

})