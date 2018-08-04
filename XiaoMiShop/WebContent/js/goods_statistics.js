$(function(){
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init($('#main')[0]);
    var chart2 = echarts.init($('#chart2')[0]);
    var chart3 = echarts.init($('#chart3')[0]);
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };
    //饼状图
    var option2 = {
    	    title : {
    	        text: '某站点用户访问来源',
    	        subtext: '纯属虚构',
    	        x:'center'
    	    },
    	    tooltip : {
    	        trigger: 'item',
    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
    	    },
    	    legend: {
    	        orient: 'vertical',
    	        left: 'left',
    	        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
    	    },
    	    series : [
    	        {
    	            name: '访问来源',
    	            type: 'pie',
    	            radius : '55%',
    	            center: ['50%', '60%'],
    	            data:[
    	                {value:335, name:'直接访问'},
    	                {value:310, name:'邮件营销'},
    	                {value:234, name:'联盟广告'},
    	                {value:135, name:'视频广告'},
    	                {value:1548, name:'搜索引擎'}
    	            ],
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
    	        text: '折线图堆叠'
    	    },
    	    tooltip: {
    	        trigger: 'axis'
    	    },
    	    legend: {
    	        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
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
    	        data: ['周一','周二','周三','周四','周五','周六','周日']
    	    },
    	    yAxis: {
    	        type: 'value'
    	    },
    	    series: [
    	        {
    	            name:'邮件营销',
    	            type:'line',
    	            stack: '总量',
    	            data:[120, 132, 101, 134, 90, 230, 210]
    	        },
    	        {
    	            name:'联盟广告',
    	            type:'line',
    	            stack: '总量',
    	            data:[220, 182, 191, 234, 290, 330, 310]
    	        },
    	        {
    	            name:'视频广告',
    	            type:'line',
    	            stack: '总量',
    	            data:[150, 232, 201, 154, 190, 330, 410]
    	        },
    	        {
    	            name:'直接访问',
    	            type:'line',
    	            stack: '总量',
    	            data:[320, 332, 301, 334, 390, 330, 320]
    	        },
    	        {
    	            name:'搜索引擎',
    	            type:'line',
    	            stack: '总量',
    	            data:[820, 932, 901, 934, 1290, 1330, 1320]
    	        }
    	    ]
    	};

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    chart2.setOption(option2);
    chart3.setOption(option3);
}) 
