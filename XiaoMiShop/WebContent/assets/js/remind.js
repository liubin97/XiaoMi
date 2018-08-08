// (function($) {
//     var countdown = function () {
//         var countdown_select = $("");
//         countdown_select.each(function () {
//             $(this).countdown($(this).data('countdown'))
//                 .on('update.countdown', function (e) {
//                     var format = '%H : %M : %S';
//                     if (e.offset.totalDays > 0) {
//                         format = '%d Day%!d ' + format;
//                     }
//                     if (e.offset.weeks > 0) {
//                         format = '%w Week%!w ' + format;
//                     }
//                     $(this).html(e.strftime('' + format));
//                 });
//         }).on('finish.countdown', function(e){
//             $(this).html('活动结束').addClass('disabled');
//         });
//     };
//     $(document).on('ready', function() {
//
//         countdown();
//
//         // countdown();
//
//     });
//
//
// })(jQuery);
var sec_reminder={
    //封装Ajax
    URL:{
        remindme:function (seckillId) {
                return path+'/seckill/'+seckillId+'/reminder';
        }
    },
    canRemind:function(remindtime){
        var start_time = new Date(remindtime);//将字符串转化为时间
        start_time.setMinutes (start_time.getMinutes () - 10);
        console.log("start_time",start_time);
        var now = new Date;
        console.log("now",now);
        if(start_time.getTime()<=now){
            // alert("不能提醒");
            console.log("不可以添加提醒");
            return false;
        }else {
            //alert("已经增加提醒")
            console.log("可以添加提醒");
            return true;
        }
    },
    //判断时间是否合法（开团前10min不让增加提醒）
    remind:function(seckillId,remindtime){
        var modelLoc = $("#myModal");//获取模态弹窗位置
        alert("1");
        if(sec_reminder.canRemind(remindtime)){
            //可以提醒
            alert("2");
            console.log(sec_reminder.URL.remindme(seckillId) );
            $.post(sec_reminder.URL.remindme(seckillId), {}, function (result) {
                alert("3");
                //判断是否有返回值
                if (result && result['success']) {
                    alert("4");
                    var remind = result['data'];
                    if(remind['success']){
                        alert("5");
                        //成功
                        var stateInfo = remind['stateInfo'];
                        console.log('stateInfo:',stateInfo);
                        alert("已经增加提醒");
                        $('#myModalLabel').html(stateInfo);
                        $('#myModalbody').html("我们会在秒杀开始前前提醒您");
                        modelLoc.modal();
                    }else {
                        //出现问题
                        var stateInfo = remind['stateInfo'];
                        console.log('stateInfo:',stateInfo);
                        alert("可以增加提醒，但是");
                        $('#myModalLabel').html(stateInfo);
                        $('#myModalbody').html(stateInfo);
                        modelLoc.modal();

                    }


                }
            }).error(function(result) {
                alert("error");
                if(result.responseText == "loseSession"){
                    //在这个地方进行跳转
                    var url = window.location.pathname;
                    alert(url);
                   url = url+"?";
                    // alert(url);

                    window.location.href="../login.jsp?redirectURL="+url;
                }

            });

        }else {
            alert("不能提醒");
            $('#myModalLabel').html("增加提醒失败");
            $('#myModalbody').html("秒杀前10min无法增加提醒，" +
                "<svg class=\"icon\" aria-hidden=\"true\">\n" +
                "                        <use xlink:href=\"#icon-ganga\"></use>\n" +
                "                    </svg>");
            modelLoc.modal();
        }
    }



}
