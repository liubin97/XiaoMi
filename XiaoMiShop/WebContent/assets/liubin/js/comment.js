$(document).ready(function(){

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
