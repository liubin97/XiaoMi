
//默认选项

var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var attributeHtml = "";

var pictureHtml =  "";
//记录获取的商品数据
var goodsData;
//移除该行
function removeTr(){
	
		//alert(1);
		var number = $(this).parents("table").find("tr").length;
		if(number==2){
			alert("不可删除");
		}else{
			$(this).parents("tr").remove();
		}
}

$(document).ready(function(){
	attributeHtml = "<tr>"+$("#attribute").find("tr").eq(0).html()+"</tr>";
	pictureHtml = "<tr>" +$("#pictureList").find("tr").eq(0).html()+"</tr>";
	$.ajax({
		 type:"POST", //请求方式  
     url:"getALLCategory.action", //请求路径  
     cache: false,     
     dataType: 'json',   //返回值类型  
     success:function(json){ 
 
	 for(var i=0;i<json.length; i++){
           $(".category").append("<option value="+json[i].goods_category_id+">"+json[i].category_name+"</option>"); 
	 }
    	
     }  
	});  
	$("#goodsForm .category").change(function(){
		//alert(1);
		var categoryId = $(".category option:selected").val();
		
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
	       url:"getAllDetailByGoodsId.action",
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
	    	   var button = "<td class='saveDetail'><div class=\"tpl-table-black-operation\"><a href=\"javascript:; \" class='saveDetail' ><i class=\"am-icon-pencil\"></i> 保存</a><a href=\"javascript:; \" ><i class=\"am-icon-trash\"></i> 删除</a></div></td>";
	    	   var picture = "<td class='picture'><a href='javascript:;' class='picture'> 图片</a></td>"
	    	   for(var i=0;i<data.length; i++){
		             $("#goodsDetail").append("<tr> <td><input type='text'  value="+data[i].kind+"></td><td><input type='text'  value="+data[i].color+"></td><td><input type='text'  value="+data[i].prime_price+"></td><td><input type='text'  value="+data[i].discount_price+"></td>"+picture+button+"<input type='hidden' value="+data[i].goods_detail_id+"></tr>");  
	     	 }
	    	 
	       }  
	   }); 
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
	
	$("#attribute").on('click','.am-btn.am-btn-default.am-btn-success',function(){
		$(this).parents("tr").after(attributeHtml);
	});
	$("#attribute").on('click','.am-btn.am-btn-default.am-btn-danger',removeTr);
	$("#pictureList").on('click','.am-btn.am-btn-default.am-btn-success',function(){
		$(this).parents("tr").after(pictureHtml);
	});
	$("#pictureList").on('click','.am-btn.am-btn-default.am-btn-danger',removeTr);
	
	$("form").on('change','.doc-form-file', function() {
		  var fileNames = '';
		  $.each(this.files, function() {
			fileNames += '<span class="am-badge">' + this.name + '</span> ';
		  });
		  //alert(1);
		  $(this).next().html(fileNames);
	});
	//商品信息按钮点击，发送商品id查找商品信息
  $('#goodsInfoButton').off('click').on('click',function() {
	  //alert(1);
	  $("#goodsForm.category").remove();
	  var goodsId = $("#goods option:selected").val();
	  //alert(goodsId);
	  $.ajax({
			 type:"POST", //请求方式  
	       url:"getGoodsByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	       async : false,
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   //alert(1);
	    	   //alert(data.goods_category_id);
	    	   $("#goodsInfo .category").val(data.goods_category_id);
	    	   $("#goodsInfo .category").trigger('changed.selected.amui');
	    	   $("#goods_name").val(data.goods_name);
	    	   $("#goods_code").val(data.goods_code);
	    	   $("#profilePic").attr("src",data.goods_pic_url);
	    	   $("#goodsIntroductionPic").attr("src",data.goods_desc_pic_url);
	    	   $("#goodsVideo").attr("src",data.video_set_url);
	    	   
	       }  
	   }); 
	 
	$('#goodsInfo').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		
	  },
	  onCancel: function(e) {
		
	  }
	});
  });
  $('#goodsPicButton').off('click').on('click', function() {
	  
	$('#goodsPic').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		
	  },
	  onCancel: function(e) {
		
	  }
	});
  });
   $('#goodsAttributeButton').on('click', function() {	  
	  
	$('#goodsAttribute').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		alert('你输入的是：' + e.data || '')
	  },
	  onCancel: function(e) {
		alert('不想说!');
	  }
	});
  });
   $('#goodsDetail').on('click','a.picture', function() {	   
		$('#detailPicture').modal({
		  relatedTarget: this,
		  onConfirm: function(e) {
			alert('你输入的是：' + e.data || '')
		  },
		  onCancel: function(e) {
			alert('不想说!');
		  }
		});
	  });
})