
   // alert("1");

    /*var goods_id = $("#goodsId").val();
    alert(goods_id);
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
                $("#goods_detail_id_display").append("<option value='"+data[i].goods_detail_id+"'>"+data[i].kind+","+data[i].color+"</option>" );
            }
            var select_value = $("#goods_detail_id").val();
            $("#goods_detail_id_display option[value='"+select_value+"']").attr("selected","selected");
        },
        error:function(data){
            alert("fail");
        },
    });*/

$(document).ready(function(){
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
            $("#goodsId option:first").prop("selected", 'selected');
        },
        error:function(data){
            alert("fail");
        },
    });
    $("#goodsId").change(function(){
        var goods_id = $("#goodsId").val();
        alert(goods_id);
        var selOpt = $("#goods_detail_id option");
        selOpt.remove();

        if(goods_id==0){
            $("#goods_detail_id").append("<option value='0'>"+"请选择商品型号"+"</option>" );
            $("#goodsId option:first").prop("selected", 'selected');
        }else{

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
        }

    });
});
