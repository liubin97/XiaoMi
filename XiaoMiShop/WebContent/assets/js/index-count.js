var index_count={

        //初始化函数
        init: function (params) {
           // alert("初始化成功！！");
            var start_time = params['start_time'];//开始时间
            var end_time = params['end_time'];//结束时间

            //开始计时
            index_count.countDown(start_time, end_time);

        },
    //采用countdown插件
    countDown: function (start_time, end_time) {
        // alert("进入");
        console.log( start_time + '_' + end_time);
        var seckillbox = $('#killTime');
        //1.时间的判断

        //秒杀未开始,进行时间绑定--- +1000毫秒是为了防止客户端的时间偏移

        var killTime = new Date(start_time + 1000);
        seckillbox.countdown(killTime, function (event) {
            var format = event.strftime('  <span class="box">%H</span>\n' +
                '                          <span class="dosh">:</span>\n' +
                '                          <span class="box">%M</span>\n' +
                '                          <span class="dosh">:</span>\n' +
                '                          <span class="box">%S</span>');
            seckillbox.html(format);
            //时间完成后回调时间
        }).on('finish.countdown', function () {

            //获取秒杀地址，控制显示逻辑，执行秒杀
            //    TODO
            seckillbox.html("已经开始");
        });

    }
}
