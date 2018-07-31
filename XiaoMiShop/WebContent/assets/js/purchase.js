//ajax判断库存,并跳转
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
                window.location.href = url ;
            }else {
                alert("库存不足")
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("ajax error!");
        }
    });
}

$(document).ready(function(){
    //判断商品是否被加入我的喜欢
    $.ajax({
        url: "addFavorites.action",
        data: "goods_id="+id,
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            console.log(data);
            if(data>0){
                window.location.href = url ;
            }else {
                alert("库存不足")
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
        checkStock(goods_detail_id,"purchaseImmediately.action?goods_detail_id="+goods_detail_id);
    });

    //加入购物车
    $("#add-cart").click(function () {
        var id = $(" .filter-center a.active").attr("id");
        //checkStock(id,"addToCart.action?goods_detail_id="+id);
    });

    //加入我喜欢
    $("#favorites").click(function () {
        var goods_id = $("#goods-id").text();
        console.log(goods_id);
        $.ajax({
            url: "addFavorites.action",
            data: "goods_id="+id,
            async: false,
            datatype: "json",
            type: "POST",
            success: function (data) {
                console.log(data);
                if(data>0){
                    window.location.href = url ;
                }else {
                    alert("库存不足")
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("ajax error!");
            }
        });
    });



});