
$(document).ready(function(){
    var sysDate = new Date();
    var sysmonth = sysDate.getMonth()+1;
    var sysday = sysDate.getDay();
    sysmonth = (sysmonth<10?"0"+sysmonth:sysmonth);
    var sysyear = sysDate.getFullYear();
    var sysYearMonth = (sysyear.toString()+sysmonth.toString());
    var YearStart = sysyear.toString()+"01";
    $.ajax({
        url:"selectMonthInterest.action",
        type:"post",
        data:{YearMonth : sysYearMonth},
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success:function(data)
        {
            $('#monthInterest').html("￥"+data);
            var beforeMonth = sysmonth - 1;
            beforeMonth =(beforeMonth<10?"0"+beforeMonth:beforeMonth);
            var beforeYearMonth = (sysyear.toString()+beforeMonth.toString())
            $.ajax({
                url:"selectMonthInterest.action",
                type:"post",
                data:{YearMonth : beforeYearMonth},
                dataType:"json",
                contentType: "application/x-www-form-urlencoded",
                success:function(data_demo)
                {
                    $('#beforeMonth').html(data-data_demo);
                },
                error:function(data_demo){
                    alert("fail");
                },
            });
        },
        error:function(data){
            alert("fail");
        },
    });
    $.ajax({
        url:"selectGoodsSum.action",
        type:"post",
        data:{YearMonth : sysYearMonth},
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success:function(data)
        {
            $('#goodsSum').html(data);
        },
        error:function(data){
            alert("fail");
        },
    });
    $.ajax({
        url:"selectYearGoodsSum.action",
        type:"post",
        data:{YearMonth : sysYearMonth,
            YearStart :  YearStart
        },
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success:function(data)
        {
            $('#goodsYearSum').html(data);
        },
        error:function(data){
            alert("fail");
        },
    });
    var month = sysDate.getMonth()+1;
    if(month<=3){
        var starttime = (sysyear.toString()+"01");
        var beforeStartTime = ((sysyear-1).toString()+"10");
        var beforeEndTime = ((sysyear-1).toString()+"12");
    }else if(month<=6){
        var starttime = (sysyear.toString()+"04");
        var beforeStartTime = (sysyear.toString()+"01");
        var beforeEndTime = (sysyear.toString()+"03");
    }else if(month<=9){
        var starttime = (sysyear.toString()+"07");
        var beforeStartTime = (sysyear.toString()+"04");
        var beforeEndTime = (sysyear.toString()+"06");
    }else if(month<=12){
        var starttime = (sysyear.toString()+"10");
        var beforeStartTime = (sysyear.toString()+"07");
        var beforeEndTime = (sysyear.toString()+"09");
    }
    $.ajax({
        url:"selectTermInterest.action",
        type:"post",
        data:{YearMonth : sysYearMonth,
            starttime : starttime
        },
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success:function(data)
        {
            $('#termInterest').html("￥"+data);
            $.ajax({
                url:"selectTermInterest.action",
                type:"post",
                data:{YearMonth : beforeEndTime,
                    starttime : beforeStartTime
                },
                dataType:"json",
                contentType: "application/x-www-form-urlencoded",
                success:function(data_demo)
                {
                    $('#beforeterm').html(data-data_demo);
                    $('#month').html(sysYearMonth);
                },
                error:function(data_demo){
                    alert("fail");
                },
            });
        },
        error:function(data){
            alert("fail");
        },
    });
    $.ajax({
        url:"selectChartInterest.action",
        type:"post",
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success:function(datademo)
        {
            $(function(){
                // 基于准备好的dom，初始化echarts实例
                var chart3 = echarts.init($('#chart3')[0]);
                var sumValue =[];
                for(var i = 0;i<datademo.groupValue.length;i++){
                    sumValue.push(datademo.groupValue[i]+datademo.normalValue[i]);
                }
                //近七天销售额
                option3 = {
                    title: {
                        text: '近七天销售额'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['团购','正常','总和']
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
                        data: datademo.normalDate
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'团购',
                            type:'line',

                            data:datademo.groupValue
                        },
                        {
                            name:'正常',
                            type:'line',

                            data:datademo.normalValue
                        },
                        {
                            name:'总和',
                            type:'line',
                            data:sumValue
                        }

                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                chart3.setOption(option3);
            })
        },
        error:function(data){
            alert("fail");
        },
    });

});
