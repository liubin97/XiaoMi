var categoryData;
function deleteGoods(){
	/*$(".deleteGoods").click(function(){
		alert(1);
		$(this).parents("tr").remove();
	})*/
	alert(1);
	$(this).parents("tr").remove();
}
$(document).ready(function(){
	//获取全部类别
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
	//选择类别，自动更改类别信息
	$("#category").change(function(){
		//alert(1);
		var categoryId = $("#category option:selected").val();
		if(categoryId==0){
			 $("#category_name").prop("value","");
			 $("#description").prop("value","");
			 return;
		}
		 for(var i=0;i<categoryData.length; i++){
			 if(categoryData[i].goods_category_id==categoryId){
				 $("#category_name").prop("value",categoryData[i].category_name);
				 $("#description").prop("value",categoryData[i].description);
				 break;
			 }
			 
		 }
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
	    	   $("#goods td").each(function(){
	    		   $(this).remove();
	    	   })
	    	   var button = "<td class='deleteGoods'><div class=\"tpl-table-black-operation\"><a href=\"javascript:;\" class=\"tpl-table-black-operation-del\"><i class=\"am-icon-trash\"></i> 删除</a></div></td>";
	    	   for(var i=0;i<data.length; i++){
	    		  
		             $("#goods").append("<tr class='goods'> <td>"+data[i].goods_name+"</td><td>"+data[i].goods_code+"</td><td>"+data[i].goods_pic_url+"</td><td>"+data[i].goods_desc_pic_url+"</td><td>"+data[i].video_set_url+"</td>"+button+"<input type='hidden' value="+data[i].goods_id+"></tr>");  
	     	 }
	       }  
	   }); 
	});
	//删除类别中的商品
	$("#goods").on('click','a.tpl-table-black-operation-del',function(){
		//alert(1);
		var goodsId = $(this).parents("td.deleteGoods").next().val();
		//alert(goodsId);
		var categoryId = $("#category option:selected").val();
		var categoryName;
		//查看当前商品的类别名称
		for(var i=0;i<categoryData.length;i++){
			if(categoryData[i].goods_category_id==categoryId){
				categoryName = categoryData[i].category_name;
				break;
			}
		}
		var flag;
		//alert(categoryName);
		$.ajax({
			type:"POST", //请求方式  
	       url:"deleteGoodsInCategory.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId+"&categoryName="+categoryName,//请求路径  
	       dataType: 'text', 
	       async : false,
	       cache: false,   
	       success:function(date){ 
	    	   //alert(date);
	    	   flag = date;
	    	  
	       }  
	   }); 
		if(flag=="true"){
			$(this).parents("tr.goods").remove();
		}
		else{
			alert("当前不可删除");
		}
		//$(this).parents(".deleteGoods").unbind("click");
	});
	//$("div a.tpl-table-black-operation-del").unbind("click");
	//保存对类别属性的修改
	$("#save").click(function(){
		var categoryId = $("#category option:selected").val();
		var category;
		 for(var i=0;i<categoryData.length; i++){
			 if(categoryData[i].goods_category_id==categoryId){
				 categoryData[i].category_name = $("#category_name").val();
				 categoryData[i].description = $("#description").val();   
				 category = categoryData[i];
			 }
		 }
		// var vale = {"categoryId" : "1","categoryName" : "是","description" : "是"};
		 /*var vale = {"categoryId":1,"categoryName":"是","description":"是","goodsList":null};*/
		
		$.ajax({
			 type:"POST", //请求方式  
	       url:"updateCategory.action",
	       /*data : JSON.stringify(vale),*/
	       data:JSON.stringify(category),//请求路径  
	      contentType:'application/json;charset=UTF-8',
	       /*dataType: 'text', */
	       cache: false,   
	       success:function(date){ 
	    	   alert(date);
	       }  
	   }); 
	})
	//删除该类别
	$("#delete").click(function(){
		var categoryId = $("#category option:selected").val();
		if(categoryId==0){
			alert("不可删除");
		}else{
			
			//alert(categoryId);
			$.ajax({
				 type:"POST", //请求方式  
		       url:"deleteCategory.action",
		       /*data : JSON.stringify(vale),*/
		       data : "categoryId="+categoryId,//请求路径  
		     /* contentType:'application/json;charset=UTF-8',*/
		      async : false,
		       traditional:true,
		       /*dataType: 'text', */
		       cache: false,   
		       success:function(date){ 
		    	   $("#category option:selected").remove();
		    	   alert(date);
		       }  
		   }); 
		}
		
	})
})

