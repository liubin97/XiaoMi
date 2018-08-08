$(function(){
    var goodsID = Number($("#goods-id").html());

    $.ajax({
        async:true,
        type: "POST",
        url: "getGoodsSpecPictures.action",
        dataType: "json",
        data: "goodsId="+goodsID,
        cache: false,
        error: erryFunction,  //错误执行方法
        success: succFunction //成功执行方法
    });

    function erryFunction() {
        alert("error");
    }
    function succFunction(json) {
        var picUrls = new Array();
        $.each(json, function (index, item) {
            //循环获取数据
            var i=0;
            picUrls[i] = item.goods_url;
            i++;
        });

        for (var j=0; j<picUrls.length; j++){
            $("#preview").append('<img src=' + '"' + picUrls[j] + '"' + 'class=' + '"' + 'previewPics' + '"' + '/>' + '<br>');
        }
        $(".previewPics")..width(600).height(450);
    }


});

$(function(){
    var goodsID = Number($("#goods-id").html());

    $.ajax({
        async:true,
        type: "POST",
        url: "getRevisedGoodsAttributes.action",
        dataType: "json",
        data: "goodsId="+goodsID,
        cache: false,
        error: erryFunction,  //错误执行方法
        success: succFunction //成功执行方法
    });

    function erryFunction() {
        alert("error");
    }
    function succFunction(json) {
        var content = '';
        $.each(json, function (index, item) {
            //循环获取数据
            content = '<p class=' + '"' + 'mb-20' + '"' + '>' + item.attribute_name + ' : ' + item.attribute_value + '</p>';

            $("#parameter").html($("#parameter").html() + "<br>" +content);
        });
    }
});