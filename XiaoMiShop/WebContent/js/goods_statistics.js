$(function(){

	//类别名
	var category = [];
	//最近
	var num = [];
	//饼状图数据
	var barData = [];
	//最近7天的时间
	var weekData = [];
	//折线图数据
	var lineData = [];
	$.ajax({
		 type:"POST", //请求方式  
     url:"getAllNum.action",
     /*data : JSON.stringify(vale),*/
     
   /* contentType:'application/json;charset=UTF-8',*/
  async : false,
     dataType: 'json', 
     cache: false,   
     success:function(data){ 
    	 
    	 for(var i = 0;i<data.length;i++){
    		 
    		 category.push(data[i].category_name);
    		 num.push(data[i].number);
    		 barData.push({
    			 value : data[i].number,
    			 name : data[i].category_name
    		 })
    	 }
  	   }
	});
	$.ajax({
		 type:"POST", //请求方式  
    url:"getStatustics.action",
    /*data : JSON.stringify(vale),*/
    
  /* contentType:'application/json;charset=UTF-8',*/
    async : false,
    dataType: 'json', 
    cache: false,   
    success:function(data){ 
    	for(var i = 0;i<data[0].statisticsList.length;i++){
    		weekData.push(data[0].statisticsList[i].date); 
	   	 }
	   	 for(var i = 0;i<data.length;i++){
	   		 var numData = [];
	   		 for(var j = 0;j<data[i].statisticsList.length;j++){
	   			numData.push(data[i].statisticsList[j].number);
	   		}
	   		 lineData.push({
	   			 name:data[i].category_name,
 	            type:'line',
 	            stack: '总量',
 	            data:numData
	   		 });
	   		
	   	 }
 	   }
	});
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init($('#main')[0]);
    var chart2 = echarts.init($('#chart2')[0]);
    var chart3 = echarts.init($('#chart3')[0]);
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '销售量'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: category
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: num
        }]
    };
    //饼状图
    var option2 = {
    	    title : {
    	        text: '最近一周内各个类别的销售量',
    	        x:'center'
    	    },
    	    tooltip : {
    	        trigger: 'item',
    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
    	    },
    	    legend: {
    	        orient: 'vertical',
    	        left: 'left',
    	        data: category
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

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    chart2.setOption(option2);
    chart3.setOption(option3);
}) 
