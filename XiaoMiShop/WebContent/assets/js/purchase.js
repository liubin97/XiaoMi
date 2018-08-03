//ajax判断库存,并跳转到指定链接
function checkStock(id,url){
    $.ajax({
        url: "getStock.action",
        data: "goods_detail_id="+id,
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            console.log(data);
            if(data>0){
                window.open(url);
            }else {
                alert("库存不足");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("ajax error!");
        }
    });
}
//日期格式转化
Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth() + 1, //月份
        "d+" : this.getDate(), //日
        "h+" : this.getHours(), //小时
        "m+" : this.getMinutes(), //分
        "s+" : this.getSeconds(), //秒
        "q+" : Math.floor((this.getMonth() + 3) / 3), //季度
        "S" : this.getMilliseconds()
        //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for ( var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
                : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};


//获取商品评价，通过判断size加载更多
function getComments(offset,size,goods_id){
    //ajax获取商品评价
    $.ajax({
        url: "getGoodsComment.action",
        data: "goods_id="+goods_id,
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            //var data = reponse.list;
            //var sum = reponse.list.length;
            var sum = data.length;
            var result = '';

            /****业务逻辑块：实现拼接内容并append到页面*********/

            //console.log(offset , size, sum);

            /*如果剩下的记录数不够分页，就让分页数取剩下的记录数
            * 实际MySQL查询时不写这个不会有问题
            */
            if(sum - offset < size ){
                size = sum - offset;
            }

            /*使用for循环模拟SQL里的limit(offset,size)*/
            for(var i=offset; i< (offset+size); i++){

                var reply_size = 2;//默认显示两条评论回复

                //拼接评论
                result += '<li class="com-item J_resetImgCon J_canZoomBox"> <img class="user-img" src="'+ data[i].user.imgurl +'" />\n' +
                    '    <div class="comment-info">\n' +
                    '        <a class="user-name" href="javascript:void(0);">'+ data[i].user.nickname +'</a>\n' +
                    '        <p class="time">'+ new Date(data[i].comment_date).format("yyyy-MM-dd hh:mm:ss") +'</p>\n' +
                    '    </div>\n' +
                    '    <div class="comment-eval">\n' +
                    '        <div class="rating">\n' +
                    '           <span class="rating-stars" data-rating="'+ data[i].comment_level +'"> ';
                //显示评价等级
                for(var index = 5;index>0;index--){
                    if(index == data[i].comment_level){
                        result +='<i class="fa fa-star-o star-active"></i>';
                    }else{
                        result +='<i class="fa fa-star-o"></i>';
                    }
                }
                //拼接评论内容
                 result += '     </span>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="comment-txt">\n' +
                    '        <a href="goToCommentPage.action?goods_comment_id='+ data[i].goods_comment_id +'" target="_blank">' +  data[i].comment  + '</a>\n' +
                    '    </div>\n' +
                    '    <div class="m-img-list clearfix h-img-list">\n';
                //拼接评论图片
                for(var j=0;j<data[i].commentPictureList.length;j++) {
                    result +=   '        <div class="img-item showimg">\n' +
                                '            <img class="J_resetImgItem J_canZoom" src="'+ data[i].commentPictureList[j].picture_url +'" />\n' +
                                '        </div>\n';
                }
                result += '</div>\n' +
                    '    <div class="comment-handler">\n' +
                    '        <a href="javascript:void(0);" data-commentid="'+ data[i].goods_comment_id +'" class="J_hasHelp">' +
                    '           <i class="iconfont"></i>&nbsp; <span class="amount"> '+ data[i].like_num +' </span> ' +
                    '        </a>\n' +
                    '    </div>\n' +
                    '    <div class="comment-input">\n' +
                    '        <input type="text" placeholder="回复楼主" class="J_commentAnswerInput" />\n' +
                    '        <a href="javascript:void(0);" class="comment-reply-link btn btn-md btn-gray btn-rounded " data-commentid="'+ data[i].goods_comment_id +'">回复</a>\n' +
                    '    </div>\n' +
                    '    <div class="comment-answer">\n';

                //将评论回复按照类型排序
                data[i].commentReplyList.sort(function(a,b){
                    return  b.reply_type - a.reply_type;
                });
                //判断评论回复是否需要分页显示
                if(reply_size<data[i].commentReplyList.length){//评论需要分页显示
                    for(var k = 0;k<reply_size;k++) {
                        //若回复类型为官方回复
                        if(data[i].commentReplyList[k].reply_type == 1){
                            result +=  '  <div class="answer-item">\n' +
                                '            <img class="answer-img" src="assets/images/logo.png" />\n' +
                                '            <div class="answer-content">\n' +
                                '                <h3 class="official-name">官方回复</h3>\n' +
                                '                <p> '+ data[i].commentReplyList[k].reply +
                                '                   <a href="javascript:void(0);" class="J_csLike " data-commentid="'+ data[i].commentReplyList[k].comment_reply_id +'"> ' +
                                '                       <i class="iconfont"></i>&nbsp; <span class="amount"> ' + data[i].commentReplyList[k].reply_like_num + ' </span> </a> ' +
                                '                </p>\n' +
                                '            </div>\n' +
                                '        </div>\n';
                        }//回复类型为普通回复
                        else if(data[i].commentReplyList[k].reply_type == 0){
                            result += '        <div class="answer-item">\n' +
                                '            <img class="answer-img" src="'+ data[i].commentReplyList[k].user.imgurl +'" />\n' +
                                '            <div class="answer-content" data-txt="">\n' +
                                '                <h3 class="">'+data[i].commentReplyList[k].user.nickname+'</h3>\n' +
                                '                <p>'+ data[i].commentReplyList[k].reply +'  </p>\n' +
                                '            </div>\n' +
                                '        </div>\n' ;
                        }

                    }
                    result += '  <div class="comment-more">\n' +
                        '            <a class="show-more" href="goToCommentPage.action?goods_comment_id='+ data[i].goods_comment_id +'" target="_blank">查看全部 ' +
                        '               <span>'+data[i].commentReplyList.length +'</span>条回复</a>\n' +
                        '        </div>\n' +
                        '    </div> \n' +
                        '</li>'   ;
                }else {//评论不需要分页显示
                    for(var k = 0;k<data[i].commentReplyList.length;k++) {
                        //若回复类型为官方回复
                        if(data[i].commentReplyList[k].reply_type == 1){
                            result +=  '  <div class="answer-item">\n' +
                                '            <img class="answer-img" src="assets/images/logo.png" />\n' +
                                '            <div class="answer-content">\n' +
                                '                <h3 class="official-name">官方回复</h3>\n' +
                                '                <p> '+ data[i].commentReplyList[k].reply +
                                '                   <a href="javascript:void(0);" class="J_csLike " data-commentid="'+ data[i].commentReplyList[k].comment_reply_id +'">' +
                                '                   <i class="iconfont"></i>&nbsp; <span class="amount"> ' + data[i].commentReplyList[k].reply_like_num + ' </span> </a> </p>\n' +
                                '            </div>\n' +
                                '        </div>\n';
                        }//回复类型为普通回复
                        else if(data[i].commentReplyList[k].reply_type == 0){
                            result += '        <div class="answer-item">\n' +
                                '            <img class="answer-img" src="'+ data[i].commentReplyList[k].user.imgurl +'" />\n' +
                                '            <div class="answer-content" data-txt="">\n' +
                                '                <h3>' + data[i].commentReplyList[k].user.nickname +'</h3>\n' +
                                '                <p> ' + data[i].commentReplyList[k].reply +  '</p>\n' +
                                '            </div>\n' +
                                '        </div>\n' ;
                        }

                    }
                }


            }

            $('#comment-list').append(result);


            /*隐藏more按钮*/
            if ( (offset + size) >= sum){
                $("#load-more").hide();
            }else{
                $("#load-more").show();
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("ajax error!");
        }
    });
}

$(document).ready(function(){
    //获取goods_id
    var goods_id = $("#goods-id").text();
    //加载评论
    $(function () {
        /*初始化*/
        var counter = 0; /*计数器*/
        var pageStart = 0; /*offset*/
        var pageSize = 2; /*size*/

        /*首次加载*/
        getComments(pageStart, pageSize,goods_id);

        /*监听加载更多*/
        $("#load-more").click(function(){
            counter ++;
            pageStart = counter * pageSize;
            getComments(pageStart, pageSize,goods_id);
        });
    });

    //判断商品是否被加入我的喜欢
    $.ajax({
        url: "checkFavorites.action",
        data: "goods_id="+goods_id,
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {

            if(data>0){
                var favoritesSpan = $("#favorites").children("span");
                if(favoritesSpan.removeClass("fa-heart-o")){
                    favoritesSpan.removeClass("fa-heart-o");
                    favoritesSpan.addClass("fa-heart");
                }
                else{
                    favoritesSpan.addClass("fa-heart");
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("ajax error!");
        }
    });


    /*点击品类*/
    $(" .filter-center a").click(function(){
        $(this).parent("li").siblings().children("a").removeClass("active");
        $(this).addClass("active");

        //更改显示价格
        var price = $(this).children(".price").text();
        $("#price").text(price);
        //更改显示库存
        var stock = $(this).children(".stock").text();
        $("#stock").text(stock);
    });

    //进入立即购买
    $("#purchase").click(function () {
        var goods_detail_id = $(" .filter-center a.active").attr("id");
        //获取库存，判断是否跳转
        $.ajax({
            url: "getStock.action",
            data: "goods_detail_id="+goods_detail_id,
            async: false,
            datatype: "json",
            type: "POST",
            success: function (data) {
                console.log(data);
                if(data>0){
                    window.location.href = "purchaseImmediately.action?goods_detail_id="+goods_detail_id ;
                }else {
                    alert("库存不足");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("ajax error!");
            }
        });
    });

    //加入购物车
    $("#add-cart").click(function () {
        var id = $(" .filter-center a.active").attr("id");
        //checkStock(id,"addToCart.action?goods_detail_id="+id);
    });

    //将商品加入我喜欢
    $("#favorites").click(function () {
        $.ajax({
            url: "addFavorites.action",
            data: "goods_id="+goods_id,
            async: false,
            datatype: "json",
            type: "POST",
            success: function (data) {
            },
            error: function (data) {
                if(data.responseText == "loseSession"){
                    //在这个地方进行跳转
                    var url = window.location.pathname;
                    url = url.substring(11)+window.location.search;
                    window.location.href="login.jsp?redirectURL="+url;
                }
            }
        });
        //更改我喜欢图标
        if ($(this).children("span").hasClass("fa-heart-o")) {
            $(this).children("span").removeClass("fa-heart-o");
            $(this).children("span").addClass("fa-heart");
        }
        else if ($(this).children("span").hasClass("fa-heart")) {
            $(this).children("span").removeClass("fa-heart");
            $(this).children("span").addClass("fa-heart-o");
        }
    });

    //评论回复
    $(document).on('click','.comment-reply-link',function () {
        var goods_comment_id = $(this).attr("data-commentid");
        var input = $(this).parent().children(".J_commentAnswerInput");
        var reply = input.val();
        if(reply == ''){
            alert("请输入评论");
        }else{
            $.ajax({
                url: "makeCommentReply.action",
                data: {
                    goods_comment_id:goods_comment_id,
                    reply:reply
                },
                async: false,
                datatype: "json",
                type: "POST",
                success: function (data) {
                },
                error: function (data) {
                    if(data.responseText == "loseSession"){
                        //在这个地方进行跳转
                        var url = window.location.pathname;
                        url = url.substring(11)+window.location.search;
                        window.location.href="login.jsp?redirectURL="+url;
                    }
                }
            });
            input.val('');//清空回复框
            var reply_sapn = $(this).parent().parent().find(".show-more").children("span");
            var reply_num = reply_sapn.text();
            var new_num = reply_num*1 + 1;
            reply_sapn.text(new_num);
            //拼接回复评论
            reply_result = '<div class="answer-item">\n' +
                '            <img class="answer-img" src="'+ user_imgurl +'">\n' +
                '            <div class="answer-content" data-txt="">\n' +
                '                <h3 class="">'+user_nickname+'</h3>\n' +
                '                <p>'+ reply +'</p>\n' +
                '            </div>\n' +
                '        </div>';
            $(this).parent().parent().find(".comment-answer").prepend(reply_result);

        }

    });


    //评论点赞
    $(document).on('click','.J_hasHelp',function () {
        var goods_comment_id = $(this).attr("data-commentid");
        console.log(goods_comment_id);
        var amount_span = $(this).find(".amount");
        var amount = amount_span.text()*1;
        //判断是否已经点赞
        if($(this).hasClass("cur")){
            amount = amount - 1;
        }else{
            amount = amount + 1;
        }
        $(this).toggleClass("cur");
        amount_span.text(amount);
        console.log(amount);
        $.ajax({
            url: "commentLike.action",
            data: {
                goods_comment_id:goods_comment_id,
                like_num:amount
            },
            async: false,
            datatype: "json",
            type: "POST",
            success: function (data) {

            },
            error: function (data) {
                if(data.responseText == "loseSession"){
                    //在这个地方进行跳转
                    var url = window.location.pathname;
                    url = url.substring(11)+window.location.search;
                    window.location.href="login.jsp?redirectURL="+url;
                }
            }
        });
    });

    //评论回复点赞
    $(document).on('click','.J_csLike',function () {
        var comment_reply_id = $(this).attr("data-commentid");
        console.log(comment_reply_id);
        var amount_span = $(this).find(".amount");
        var amount = amount_span.text()*1;
        //判断是否已经点赞
        if($(this).hasClass("cur")){
            amount = amount - 1;
        }else{
            amount = amount + 1;
        }
        $(this).toggleClass("cur");
        amount_span.text(amount);
        console.log(amount);
        $.ajax({
            url: "replyLike.action",
            data: {
                comment_reply_id:comment_reply_id,
                reply_like_num:amount
            },
            async: false,
            datatype: "json",
            type: "POST",
            success: function (data) {

            },
            error: function (data) {
                if(data.responseText == "loseSession"){
                    //在这个地方进行跳转
                    var url = window.location.pathname;
                    url = url.substring(11)+window.location.search;
                    window.location.href="login.jsp?redirectURL="+url;
                }
            }
        });
    });
});
