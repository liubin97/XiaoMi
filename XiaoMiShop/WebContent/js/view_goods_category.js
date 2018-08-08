var categoryData;

function deleteGoods(){
	/*$(".deleteGoods").click(function(){
		alert(1);
		$(this).parents("tr").remove();
	})*/
	alert("移除成功");
	$(this).parents("tr").remove();
}
function getGoodsInfo(categoryId,pageNum){
	 //获取该类别下的商品
	 $.ajax({
		 type:"POST", //请求方式  
      url:"getAllGoodsInfoByCategoryId.action",
      /*data : JSON.stringify(vale),*/
      data:"categoryId="+categoryId+"&pageNum="+pageNum,//请求路径  
    /* contentType:'application/json;charset=UTF-8',*/
     async : false,
      traditional:true,
      dataType: 'json', 
      cache: false,   
      success:function(data){ 
   	   $("#goods tr").each(function(){
   		   $(this).remove();
   	   })
   	   var button = "<td class='deleteGoods'><div class=\"tpl-table-black-operation\"><a href=\"javascript:;\" class=\"tpl-table-black-operation-del\"><i class=\"am-icon-trash\"></i> 删除</a></div></td>";
   	   for(var i=0;i<data.goodsInfo.length; i++){
   		  $("#goods").append("<tr class='goods'> <td>"+data.goodsInfo[i].goods_name+"</td><td>"+data.goodsInfo[i].goods_code+"</td><td><img src='"+data.goodsInfo[i].goods_pic_url+"' style='width:100px;height:50px'>"+"</td><td><img src='"+data.goodsInfo[i].goods_desc_pic_url+"' style='width:100px;height:50px'>"+"</td>"+button+"<input type='hidden' value="+data.goodsInfo[i].goods_id+"></tr>");  
    	}
   	   $("#page").find("li").remove();
   	   
   	   if(pageNum==1){
   		$("#page").append("<li class='am-disabled'><a href='#'>«</a></li>");
   	   }else{
   		$("#page").append("<li ><a href='#' onclick='getGoodsInfo("+categoryId+","+(pageNum-1)+")'>«</a></li>");
   	   }
   	      	   
   	   for(var i=1;i<=data.pageCount;i++){
   		   if(pageNum==i){
   			$("#page").append("<li class='am-active'><a href='#' onclick='getGoodsInfo("+categoryId+","+i+")'>"+i+"</a></li>");
   		   }else{
   			$("#page").append("<li ><a href='#' onclick='getGoodsInfo("+categoryId+","+i+")'>"+i+"</a></li>");
   		   }   		      		   
   	   }
   	   if(pageNum==data.pageCount){
   		 $("#page").append("<li class='am-disabled'><a href='#'>»</a></li>");
   	   }else{
   		 $("#page").append("<li ><a href='#' onclick='getGoodsInfo("+categoryId+","+(pageNum+1)+")'>»</a></li>");
   	   }
   	  
      }  
  }); 
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
			 $("#category_name").attr("disabled","disabled");
			 $("#description").attr("disabled","disabled");
			 $("#goods tr").each(function(){
		   		   $(this).remove();
		   	   })
		   	 $("#page").find("li").remove();
			 return;
		}
		 $("#category_name").removeAttr("disabled");
		 $("#description").removeAttr("disabled");
		 for(var i=0;i<categoryData.length; i++){
			 if(categoryData[i].goods_category_id==categoryId){
				 $("#category_name").prop("value",categoryData[i].category_name);
				 $("#description").prop("value",categoryData[i].description);
				 break;
			 }
			 
		 }
		 getGoodsInfo(categoryId,1);
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
		if(categoryId==0){
			alert("请先选择类别名称");
			return;
		}
		var description = $("#description").val(); 
		var category_name = $.trim($("#category_name").val());
		var category ={"goods_category_id":categoryId,"category_name" : category_name,"description" : description};
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
	       success:function(data){ 
	    	   if(data=="void"){
	    		   alert("商品类别名不能为空");
	    	   }else if(data=="false"){
	    		   alert("商品类别名已存在");
	    	   }else if(data=="true"){
	    		   alert("保存成功");
	    		   $("#category option:selected").text(category_name);
	    			//$("#goodsInfo .category").trigger('changed.selected.amui');
	    			 for(var i=0;i<categoryData.length; i++){
	    				 if(categoryData[i].goods_category_id==categoryId){
	    					 categoryData[i].category_name = category_name;
	    					 categoryData[i].description = description;   
	    					 category = categoryData[i];
	    				 }
	    			 }
	    	   }
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
		       success:function(data){
		    	   if(data=="false"){
		    		   alert("当前分类下属有商品，不可删除");
		    	   }else if(data=="true"){
		    		   alert("删除成功");
		    		   $("#category option:selected").remove();
		    	   }

		       }  
		   }); 
		}
		
	})
})

