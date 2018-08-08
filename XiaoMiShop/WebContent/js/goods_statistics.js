//默认选项
var categoryOption = "<option value='0'>请选择商品类别</option>";
var goodsOption = "<option value='0'>请选择商品</option>";
var kindOption = "<option value='0'>请选择版本</option>";
var option;//柱状图参数
var option2;//饼状图参数
var myChart;
var chart2;
var chart3;
function initChart(data){
	//alert(JSON.stringify(data));
	if(JSON.stringify(data) == "[null]"){
		alert("当前没有数据");
		myChart.clear();
		chart2.clear();
		return;
	}
	var name = [];
	var num = [];
	var barData = [];
	for(var i = 0;i<data.length;i++, name.push(nameTemp)){
		var nameTemp;
		 num.push(data[i].number);
		
		 if(data[i].category_name!=null){
			 nameTemp = data[i].category_name;
			 
		 }
		 if(data[i].goods_name!=null){
			 nameTemp = data[i].goods_name;
			 
		 }
		 if(data[i].kind!=null){
			 nameTemp = data[i].kind;
			 
		 }
		 if(data[i].color!=null){
			 nameTemp = data[i].color;
		 }
		 barData.push({
			 value : data[i].number,
			 name : nameTemp
		 });
	 }
	//柱状图
	option = {
		    color: ['#3398DB'],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    toolbox: {
    	        feature: {
    	            saveAsImage: {}
    	        }
    	    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : name,
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'直接访问',
		            type:'bar',
		            barWidth: '60%',
		            data:num
		        }
		    ]
		};
    //饼状图
    option2 = {
    	    title : {
    	        text: '最近一周内各个类别的销售量',
    	        x:'center'
    	    },
    	    tooltip : {
    	        trigger: 'item',
    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
    	    },
    	    toolbox: {
    	        feature: {
    	            saveAsImage: {}
    	        }
    	    },
    	    legend: {
    	        orient: 'vertical',
    	        left: 'left',
    	        data: name
    	    },
    	    series : [
    	        {
    	            name: '销售量',
    	            type: 'pie',
    	            radius : '55%',
    	            center: ['50%', '60%'],
    	            data:barData,
    	            itemStyle: {
    	                emphasis: {
    	                    shadowBlur: 10,
    	                    shadowOffsetX: 0,
    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
    	                }
    	            }
    	        }
    	    ]
    	};
    //显示图表
    myChart.setOption(option);
    chart2.setOption(option2);
}
//初始化折线图
function initLine(data){
	//最近7天的时间
	var weekData = [];
	//折线图数据
	var lineData = [];
	var category = [];
	for(var i = 0;i<data[0].statisticsList.length;i++){
   		weekData.push(data[0].statisticsList[i].date); 
	   	 }
   	 for(var i = 0;i<data.length;i++){
   		 var numData = [];
   		 for(var j = 0;j<data[i].statisticsList.length;j++){
   			numData.push(data[i].statisticsList[j].number);
   		}
   		 category.push(data[i].category_name);
   		 lineData.push({
   			 name:data[i].category_name,
            type:'line',
            
            data:numData
   		 });
   		
   	 }
   	 //折线图
     option3 = {
     	    title: {
     	        text: '销售量'
     	    },
     	    tooltip: {
     	        trigger: 'axis'
     	    },
     	    legend: {
     	        data:category
     	    },
     	    grid: {
     	        left: '3%',
     	        right: '4%',
     	        bottom: '3%',
     	        containLabel: true
     	    },
     	    toolbox: {
     	        feature: {
     	            saveAsImage: {}
     	        }
     	    },
     	    xAxis: {
     	        type: 'category',
     	        boundaryGap: false,
     	        data: weekData
     	    },
     	    yAxis: {
     	        type: 'value'
     	    },
     	    series: lineData
     	};

     // 显示折线图
     chart3.setOption(option3);
}
$(function(){
	// 基于准备好的dom，初始化echarts实例
	myChart = echarts.init($('#main')[0]);
	chart2 = echarts.init($('#chart2')[0]);
    chart3 = echarts.init($('#chart3')[0]);
    //获取数据
    $.ajax({
		 type:"POST", //请求方式  
   url:"getStatistics.action",
   /*data : JSON.stringify(vale),*/
   
 /* contentType:'application/json;charset=UTF-8',*/
   async : false,
   dataType: 'json', 
   cache: false,   
   success:function(data){ 
	   initLine(data);
	   }
	});
	
    
	//获取所有类别
	$.ajax({
		 type:"POST", //请求方式  
    url:"getALLCategory.action", //请求路径  
    cache: false,   
    async : false,
    dataType: 'json',   //返回值类型  
    success:function(json){ 

	 for(var i=0;i<json.length; i++){
            $("#category").append("<option value="+json[i].goods_category_id+">"+json[i].category_name+"</option>"); 
	 }
   	
    }  
	});  
	//获取时间段
	$.ajax({
		 type:"POST", //请求方式  
   url:"getAllMouth.action", //请求路径  
   cache: false,    
   async : false,
   dataType: 'json',   //返回值类型  
   success:function(json){ 

	 for(var i=0;i<json.length; i++){
           $("#date").append("<option value="+json[i]+">"+json[i]+"</option>"); 
	 }
  	
   }  
	});  
	//初始化图表
	$.ajax({
		 type:"POST", //请求方式  
    url:"getAllNum.action",
    data : "date="+$("#date").val(),
    
  /* contentType:'application/json;charset=UTF-8',*/
 async : false,
    dataType: 'json', 
    cache: false,   
    success:function(data){ 
    	initChart(data);
   	 
 	   }
	});
	//选择分类获取下属商品销售量数据
	$("#category").change(function(){
		//alert(1);
		var categoryId = $("#category option:selected").val();
		var date = $("#date").val();
		console.log(categoryId);
		 //获取该类别下的商品
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllGoodsByCategoryId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"categoryId="+categoryId+"&date="+date,//请求路径  
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
		 //获取统计信息
		 $.ajax({
			 type:"POST", //请求方式  
	     url:"getGoodsDataByCategoryId.action",
	     data : "categoryId="+categoryId+"&date="+date,	     
	     /*async : false,*/
	     dataType: 'json', 
	     async : false,
	     cache: false,   
	     success:function(data){ 
	    	 initChart(data);
	     } 
	    });
	});
	//记录当前商品名称
	$("#goods").change(function(){
		var goodsId = $("#goods option:selected").val();
		if(goodsId==0){
			$("#kind option").each(function(){
	    		   $(this).remove();
	    	   })
	    	   $("#kind").append(kindOption); 
			return;
		}
		var date = $("#date").val();
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getAllKindByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	       dataType: 'json', 
	       async : false,
	       cache: false,   
	       success:function(data){ 
	    	   $("#kind option").each(function(){
	    		   $(this).remove();
	    	   })
	    	   $("#kind").append(kindOption); 
	    	   for(var i=0;i<data.length; i++){
		           $("#kind").append("<option value='"+data[i]+"'>"+data[i]+"</option>"); 
	    	   }
	    	 
	       }  
	   }); 
		 //获取商品所有版本销售量
		 $.ajax({
			 type:"POST", //请求方式  
	       url:"getKindDataByGoodsId.action",
	       /*data : JSON.stringify(vale),*/
	       data:"goodsId="+goodsId+"&date="+date,//请求路径  
	     /* contentType:'application/json;charset=UTF-8',*/
	       dataType: 'json', 
	       async : false,
	       cache: false,   
	       success:function(data){ 
	    	 initChart(data);
	    	 
	       }  
	   }); 
	});
	//选择版本获取版本下各个颜色的销售统计
$("#kind").change(function(){
	var goodsId = $("#goods option:selected").val();
	var kind = $("#kind").val();
	if(goodsId==0){
		return;
	}
	if(kind=='0'){
		return;
	}
	var date = $("#date").val();
	var data = {"goods_id" : goodsId,"date" : date,"kind" : kind};
	//获取商品所有版本销售量
	 $.ajax({
		 type:"POST", //请求方式  
       url:"getColorDataByKind.action",
       data : JSON.stringify(data),
       contentType:'application/json;charset=UTF-8',
       dataType: 'json', 
       async : false,
       cache: false,   
       success:function(data){ 
    	  initChart(data);
    	 
       }  
   }); 
})
	
	$("#date").change(function(){
		var kind = $("#kind").val();
		if(kind!='0'){
			$("#kind").change();
			return;
		}
		var goods = $("#goods").val();
		if(goods!='0'){
			$("#goods").change();
			return;
		}
		
		$("#category").change();

	})
	
    
   
   
}) 
