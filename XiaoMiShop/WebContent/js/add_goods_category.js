var flag = false;
$(document).ready(function(){
	$("#category_name").blur(function(){

		$.ajax({
			 type:"POST", //请求方式  
	      url:"validateCategoryName.action", //请求路径  
	      data: "categoryName="+$.trim($("#category_name").val()),
	      dataType: 'text',   //返回值类型  
	      success:function(text){       
	    	  
	        	if(text=="true"){
	        		flag = true;
	        		$("#img_category_name").attr("src","asset/img/tick.png");
	        		$("#res_category_name").html("");
	        	}
	        	else{
	        		flag = false;
	        		$("#img_category_name").attr("src","asset/img/error.png");
	        		
	        		if($("#category_name").val()==""||$.trim($("#category_name").val()).length == 0){
	        			$("#res_category_name").html("商品分类名称不能为空");
	        		}else{
		        		$("#res_category_name").html("商品分类已存在");
	        		}

	        	}
	      }  
	  });  
	})
	$("#confirm").click(function(){
		if(flag){
			$("#category").submit();
		}else{
			$("input").blur();
			alert("请输入正确的商品类别数据");
		}
	})
})