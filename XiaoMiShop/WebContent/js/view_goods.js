
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
			$(this).prev().val(-1);
			$(this).parents("tr").hide();
			$(this).parents("tr").find(".doc-form-file").remove();
		}
}
$.fn.serializeObject = function()    
{    
   var o = {};    
   var a = this.serializeArray();    
   $.each(a, function() {    
       if (o[this.name]) {    
           if (!o[this.name].push) {    
               o[this.name] = [o[this.name]];    
           }    
           o[this.name].push(this.value || '');    
       } else {    
           o[this.name] = this.value || '';    
       }    
   });    
   return o;    
};  

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
		  var filePath = $(this).val();
		  var src = window.URL.createObjectURL(this.files[0]);
		  //表单里
		  $(this).parents("div.am-form-group.am-form-file").prev().attr("src",src);
		  //表格内的图片
		  $(this).parents("td").prev().find("img").attr("src",src);
		  $(this).parents("tr").find("input.goods_pre_pic_status").val(1);
		  $.each(this.files, function() {
			fileNames += '<span class="am-badge">' + this.name + '</span> ';
		  });
		  //alert(1);
		  $(this).next().html(fileNames);
	});
	//商品信息按钮点击，发送商品id查找商品信息
  $('#goodsInfoButton').off('click').on('click',function() {
	  //alert(1);
	  $("#goodsInfo .file-list").find("span").remove();
	  $("#goodsInfo input").each(function(){
			 $(this).val("");
		 })
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
	    	   $("#goodsId").val(data.goods_id);
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
		 $("#changeGoods").attr("target","rfFrame");
		 $("#changeGoods").submit();
		 
	  },
	  onCancel: function(e) {
		 
		
	  }
	});
  });
  //根据goodsId查找商品图片信息
  $('#goodsPicButton').off('click').on('click', function() {
	  $("#goodsPic tbody").find("tr").remove();
	  $("#goodsPic tbody").append(pictureHtml);
	  var goodsId = $("#goods option:selected").val();
	  $.ajax({
			 type:"POST", //请求方式  
	       url:"getGoodsPicByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	      
	       dataType: 'json', 
	       cache: false,   
	       success:function(data){ 
	    	   $("#goodsPic tbody").find("img").attr("src",data[0].goods_url);
	    	   $("#goodsPic tbody").find(".goods_preview_pic_id").val(data[0].goods_preview_pic_id);
	    	   $("#goodsPic tbody").find(".goods_pre_pic_status").val(0);
	    	   $("#goodsPic .goods_id").val(data[0].goods_id);
	    	   for(var i=1;i<data.length;i++){
	    		   $("#goodsPic tbody").append(pictureHtml);
	    		   $("#goodsPic tbody").find("tr").eq(i).find("img").attr("src",data[i].goods_url);
		    	   $("#goodsPic tbody").find("tr").eq(i).find(".goods_preview_pic_id").val(data[i].goods_preview_pic_id);
		    	   $("#goodsPic tbody").find("tr").eq(i).find(".goods_pre_pic_status").val(0);
	    	   }
	       }  
	   }); 
	$('#goodsPic').modal({
	  relatedTarget: this,
	  onConfirm: function(e) {
		  $("#changePic").attr("target","rfFrame");
		  var i = 0;
		  $("#goodsPic .goods_preview_pic_id").each(function(){
			  $(this).attr("name","previewPictureList["+i+"].goods_preview_pic_id");
			  i++;
		  })
		  i=0;
		  $("#goodsPic .goods_pre_pic_status").each(function(){
			  $(this).attr("name","previewPictureList["+i+"].goods_pre_pic_status");
			  i++;
		  })
		  //删除状态为0，id为0的行
		  $("#goodsPic tbody").find("tr").each(function(){
			  if($(this).find("input.goods_preview_pic_id").val()==0&&$(this).find("input.goods_pre_pic_status").val==0){
				  $(this).remove();
			  }
		  });
		 $("#changePic").submit();
	  },
	  onCancel: function(e) {
		
	  }
	});
  });
   $('#goodsAttributeButton').on('click', function() {	  
	   $("#goodsAttribute tbody").find("tr").remove();
		  $("#goodsAttribute tbody").append(attributeHtml);
		  var goodsId = $("#goods option:selected").val();
		  $.ajax({
				 type:"POST", //请求方式  
		       url:"getAttributesByGoodsId.action",
		       /*data : JSON.stringify(vale),*/
		       data:"goodsId="+goodsId,//请求路径  
		     /* contentType:'application/json;charset=UTF-8',*/
		       
		       dataType: 'json', 
		       cache: false,   
		       success:function(data){ 
		    	   $("#goodsAttribute .goods_id").val(data[0].goods_id);
		    	   $("#goodsAttribute .attributeName").val(data[0].attribute_name);
		    	   $("#goodsAttribute .attributeValue").val(data[0].attribute_value);
		    	   $("#goodsAttribute .goods_attribute_id").val(data[0].goods_attribute_id);
		    	   for(var i=1;i<data.length;i++){
		    		   $("#goodsAttribute tbody").append(attributeHtml);
		    		   $("#goodsAttribute tbody").find("tr").eq(i).find(".attributeName").val(data[i].attribute_name);
			    	   $("#goodsAttribute tbody").find("tr").eq(i).find(".attributeValue").val(data[i].attribute_value);
			    	   $("#goodsAttribute tbody").find("tr").eq(i).find(".goods_attribute_id").val(data[i].goods_attribute_id);
		    	   }
		       }  
		   }); 
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