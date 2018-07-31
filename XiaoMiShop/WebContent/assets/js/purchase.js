//ajax判断库存
function getStock(id,url){
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
        var id = $(" .filter-center a.active").attr("id");
        //获取库存，判断是否跳转
        getStock(id,"purchaseImmediately.action?goods_detail_id="+id);
    });

});