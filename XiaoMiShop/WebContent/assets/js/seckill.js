// /**
//  * 存放主要交互逻辑的js代码
//  * javascript 模块化(package.类.方法)
//  * Created by nnngu
//  */
// var seckill = {
//
//     //封装秒杀相关ajax的url
//     URL: {
//         now: function () {
//             return '/seckill/time/now';
//         },
//         exposer: function (seckillId) {
//             return '/seckill/' + seckillId + '/exposer';
//         },
//         execution: function (seckillId, md5) {
//             return '/seckill/' + seckillId + '/' + md5 + '/execution';
//         }
//     },
//
//     //验证手机号
//     validatePhone: function (phone) {
//         if (phone && phone.length == 11 && !isNaN(phone)) {
//             return true;//直接判断对象会看对象是否为空,空就是undefine就是false; isNaN 非数字返回true
//         } else {
//             return false;
//         }
//     },
//
//     //详情页秒杀逻辑
//     detail: {
//         //详情页初始化
//         init: function (params) {
//             //手机验证和登录,计时交互
//             //规划我们的交互流程
//             //在cookie中查找手机号
//             var userPhone = $.cookie('userPhone');
//             //验证手机号
//             if (!seckill.validatePhone(userPhone)) {
//                 //绑定手机 控制输出
//                 var killPhoneModal = $('#killPhoneModal');
//                 killPhoneModal.modal({
//                     show: true,//显示弹出层
//                     backdrop: 'static',//禁止位置关闭
//                     keyboard: false//关闭键盘事件
//                 });
//
//                 $('#killPhoneBtn').click(function () {
//                     var inputPhone = $('#killPhoneKey').val();
//                     console.log("inputPhone: " + inputPhone);
//                     if (seckill.validatePhone(inputPhone)) {
//                         //电话写入cookie(7天过期)
//                         $.cookie('userPhone', inputPhone, {expires: 7, path: '/seckill'});
//                         //验证通过　　刷新页面
//                         window.location.reload();
//                     } else {
//                         //todo 错误文案信息抽取到前端字典里
//                         $('#killPhoneMessage').hide().html('<label class="label label-danger">手机号错误!</label>').show(300);
//                     }
//                 });
//             }
//
//             //已经登录
//             //计时交互
//             var startTime = params[' '];
//             var endTime = params['endTime'];
//             var seckillId = params['seckillId'];
//             $.get(seckill.URL.now(), {}, function (result) {
//                 if (result && result['success']) {
//                     var nowTime = result['data'];
//                     //时间判断 计时交互
//                     seckill.countDown(seckillId, nowTime, startTime, endTime);
//                 } else {
//                     console.log('result: ' + result);
//                     alert('result: ' + result);
//                 }
//             });
//         }
//     },
//
//     handlerSeckill: function (seckillId, node) {
//         //获取秒杀地址,控制显示器,执行秒杀
//         node.hide().html('<button class="btn btn-primary btn-lg" id="killBtn">开始秒杀</button>');
//
//         $.get(seckill.URL.exposer(seckillId), {}, function (result) {
//             //在回调函数种执行交互流程
//             if (result && result['success']) {
//                 var exposer = result['data'];
//                 if (exposer['exposed']) {
//                     //开启秒杀
//                     //获取秒杀地址
//                     var md5 = exposer['md5'];
//                     var killUrl = seckill.URL.execution(seckillId, md5);
//                     console.log("killUrl: " + killUrl);
//                     //绑定一次点击事件
//                     $('#killBtn').one('click', function () {
//                         //执行秒杀请求
//                         //1.先禁用按钮
//                         $(this).addClass('disabled');//,<-$(this)===('#killBtn')->
//                         //2.发送秒杀请求执行秒杀
//                         $.post(killUrl, {}, function (result) {
//                             if (result && result['success']) {
//                                 var killResult = result['data'];
//                                 var state = killResult['state'];
//                                 var stateInfo = killResult['stateInfo'];
//                                 //显示秒杀结果
//                                 node.html('<span class="label label-success">' + stateInfo + '</span>');
//                             }
//                         });
//                     });
//                     node.show();
//                 } else {
//                     //未开启秒杀(浏览器计时偏差)
//                     var now = exposer['now'];
//                     var start = exposer['start'];
//                     var end = exposer['end'];
//                     seckill.countDown(seckillId, now, start, end);
//                 }
//             } else {
//                 console.log('result: ' + result);
//             }
//         });
//
//     },
//
//     countDown: function (seckillId, nowTime, startTime, endTime) {
//         console.log(seckillId + '_' + nowTime + '_' + startTime + '_' + endTime);
//         var seckillBox = $('#seckill-box');
//         if (nowTime > endTime) {
//             //秒杀结束
//             seckillBox.html('秒杀结束!');
//         } else if (nowTime < startTime) {
//             //秒杀未开始,计时事件绑定
//             var killTime = new Date(startTime + 1000);//todo 防止时间偏移
//             seckillBox.countdown(killTime, function (event) {
//                 //时间格式
//                 var format = event.strftime('秒杀倒计时: %D天 %H时 %M分 %S秒 ');
//                 seckillBox.html(format);
//             }).on('finish.countdown', function () {
//                 //时间完成后回调事件
//                 //获取秒杀地址,控制现实逻辑,执行秒杀
//                 console.log('______fininsh.countdown');
//                 seckill.handlerSeckill(seckillId, seckillBox);
//             });
//         } else {
//             //秒杀开始
//             seckill.handlerSeckill(seckillId, seckillBox);
//         }
//     }
//
// }

//存放主要交互逻辑js
//模块化

//seckill.detail.init(params)  类比（包的概念）
//最后整个去掉邮箱
var  seckill = {
    //封装秒杀相关ajax的url
    URL: {
        now: function () {
            return '/seckill/time/now';
        },

        exposer: function (seckillId) {
            return '/seckill/' + seckillId + '/exposer';
        },

        execution: function (seckillId, md5) {
            return '/seckill/' + seckillId + '/' + md5 + '/execution';
        },
        order:function (seckillId, md5) {
            return '/seckill/' + seckillId + '/' + md5 + '/handerorder';
        },
    },
    //验证email合法性
    validateEmail: function (email) {


        var reg = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
        if (reg.test(email)) {
            return true;
        } else {
            return false;
        }
    },

    //详情页秒杀逻辑
    detail: {
        //详情页初始化
        init: function (params) {
            //邮箱，计时
            // 规划交互流程
            //在cookie中查找邮箱号码
           // var email = $.cookie('email');

            // //验证邮箱
            // if (!seckill.validateEmail(email)) {
            //
            //     //绑定email
            //     //控制输出
            //     var killEmailModal = $("#killEmailModal");
            //     killEmailModal.modal({
            //
            //         show: true,//显示弹出层
            //         backdrop: 'static',//禁止位置关闭
            //         keyboard: false//关闭键盘事件
            //
            //     });
            //     $('#EmailBtn').click(function () {
            //         alert("进入");
            //         var inputEmail = $('#Email').val();
            //         console.log(inputEmail);
            //         console.log("Email:", inputEmail);
            //         if (seckill.validateEmail(inputEmail)) {
            //
            //             //电话写入cookie,尽在seckill模块下有效
            //             $.cookie("email", inputEmail, {expires: 7, path: '/seckill'});
            //
            //             //刷新页面
            //             window.location.reload();
            //         } else {
            //
            //             //todo 错误文案信息抽取到前端字典里
            //             $('#killEmailMessage').hide().html('<label class="label label-danger">邮箱号错误!</label>').show(300);
            //
            //         }
            //
            //     });
            // }
            //已经登录
            //计时交互
            var start_time = params['start_time'];
            var end_time = params['end_time'];
            var seckill_id = params['seckill_id'];
            $.get(seckill.URL.now(), {}, function (result) {
                if (result && result['success']) {
                    var nowTime = result['data'];
                    //时间判断--计时服务判断,计时交互
                    seckill.countDown(seckill_id, nowTime, start_time, end_time);
                } else {
                    console.log('result:', result);
                }
            });//获取系统时间

        }
    },
    //采用countdown插件
    countDown: function (seckill_id, nowTime, start_time, end_time) {
        // alert("进入");
        console.log(seckill_id + '_' + nowTime + '_' + start_time + '_' + end_time);
        //获取倒计时插入位置
        var seckillbox = $('#seckill-box');
        //获取表单位置
        var formLoc = $('#order-form');
        //1.时间的判断
        if (nowTime > end_time) {
            //秒杀结束
            seckillbox.html('秒杀已结束');
        } else if (nowTime < start_time) {
            //秒杀未开始,进行时间绑定--- +1000毫秒是为了防止客户端的时间偏移

            var killTime = new Date(start_time + 1000);
            seckillbox.countdown(killTime, function (event) {
                var format = event.strftime('秒杀倒计时: %D天 %H时 %M分 %S秒 ');
                seckillbox.html(format);
                //时间完成后回调时间
            }).on('finish.countdown', function () {
                //获取秒杀地址，控制显示逻辑，执行秒杀
                //    TODO
                seckill.exportSeckillUrl(seckill_id, formLoc,seckillbox);

            });

        } else {
            //开始秒杀
            seckill.exportSeckillUrl(seckill_id, formLoc,seckillbox);

        }
    },
    //暴露秒杀接口
    exportSeckillUrl:function(seckill_id,formLoc,seckillbox){

        // // //给出form表单
        // var divForm ='<form action="'+seckill.URL.order()+'"'+'method="post">'
        //                 +' <input type="hidden"'+' value='+'"'+seckill_id+'" name="seckillId">'
        //                 +' <button type="button" class="btn btn-block btn-lg" id="killBtn" ><i class="fa fa-shopping-cart font-16 mr-10"></i>立即购买</button>'
        //                 +' </form>';
        //
        // //打印表单
        // node.html(divForm);
        //获取秒杀地址
        $.post(seckill.URL.exposer(seckill_id), {}, function (result) {
            //判断是否有返回值
            if (result && result['success']) {

                var exposer = result['data'];
                if (exposer['exposed']) {
                    //开启秒杀
                    seckillbox.html('秒杀进行中');
                    //获取md5
                    var md5 = exposer['md5'];
                    console.log('md5:',md5);
                    //获取秒杀地址
                    var killUrl = seckill.URL.order(seckill_id, md5);
                    console.log('killUrl', killUrl);
                    //显示按钮同时暴露地址
                    // formLoc.append('<input type="hidden" value="" name="seckillId" id="seckillId">');
                    // formLoc.append('<input type="hidden" value="" name="md5" id="md5">');
                    //为form添加action和method
                    formLoc.attr("action",killUrl);
                    formLoc.attr("method","POST");
                    //为隐藏表单添加值
                    $("#md5").val(md5);
                    $("#seckillId").val(seckill_id);
                    //增加按钮
                    formLoc.append('<button type="button" class="btn btn-block btn-lg" id="killBtn"><i class="fa fa-shopping-cart font-16 mr-10"></i>立即购买</button>');

                    //绑定执行秒杀请求的操作
                    $('#seckill-area').on('click', "#killBtn",function () {

                        // alert("我被你点了");
                        //提交表单
                        formLoc.submit();
                    });

                }

            }
        });
    },
    //时间到处理秒杀逻辑
    handlerSeckill: function (seckill_id, node) {
         // alert('处理秒杀逻辑');

         //仅响应一次点击请求
        $('#order-btn').one('click', function () {
            // alert('你点了我一次');
            $('#oder-form').submit();
        });

    }
}
//
// $(document).on('ready', function() {
//    seckill.handlerSeckill()
// });


