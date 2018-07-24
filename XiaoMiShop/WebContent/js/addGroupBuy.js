window.onload=$(function(){
   // alert("1");
    $.ajax({
        url:"getAllGoods.action",
        type:"post",
        dataType:"json",
        contentType: "application/x-www-form-urlencoded",
        success:function(data)
        {
            var result = eval(data);
            for(var i in result){
                $("#goodsId").append("<option value='"+data[i].goods_id+"'>"+data[i].goods_name+"</option>" );
            }
        },
        error:function(data){
            alert("fail");
        },
    });
});
$(document).ready(function(){
    $("#goodsId").change(function(){
        var goods_id = $("#goodsId").val();
        //alert(goods_id);
        var selOpt = $("#goods_detail_id option");
        selOpt.remove();
        $.ajax({
            url:"selectGoodsDetailByGoodsId.action",
            type:"post",
            data:{goods_id : goods_id},
            dataType:"json",
            contentType: "application/x-www-form-urlencoded",
            success:function(data)
            {
                var result = eval(data);
                for(var i in result){
                    $("#goods_detail_id").append("<option value='"+data[i].goods_detail_id+"'>"+data[i].kind+","+data[i].color+"</option>" );
                }
            },
            error:function(data){
                alert("fail");
            },
        });
    });
});
