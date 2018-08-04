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

$(document).ready(function(){
    var goods_id = $("#goods-id").text();
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

    //ajax获取商品评价
    $.ajax({
        url: "getGoodsComment.action",
        data: "goods_id="+goods_id,
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            console.log(data);

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
                    window.open("purchaseImmediately.action?goods_detail_id="+goods_detail_id);
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




});