var buttonHtml = "";
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
	$("#confirm").click(function(){
		//var number = $("attribute").rows.length-1;
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
