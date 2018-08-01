var flag = 0;
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
            var select_value = $("#goods_id").val();
            $("#goodsId option[value='"+select_value+"']").attr("selected","selected");
        },
        error:function(data){
            alert("fail");
        },
    });
    var goods_id = $("#goods_id").val();
    //alert(goods_id);
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
});
    $("#goodsId").change(function(){
        var goods_id = $("#goods_id").val();
        //alert(goods_id);
        var selOpt = $("#goods_detail_id_display option");
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
                    $("#goods_detail_id_display").append("<option value='"+data[i].goods_detail_id+"'>"+data[i].kind+","+data[i].color+"</option>" );
                }
                var select_value = $("#goods_detail_id").val();
                $("#goods_detail_id_display option[value='"+select_value+"']").attr("selected","selected");
            },
            error:function(data){
                alert("fail");
            },
        });
    });
    $('#endtime').change(function(){
        var startTime=$("#endtime_ref").val();
        var start=new Date(startTime.replace("-", "/").replace("-", "/"));
        var endTime=$("#endtime").val();
        var end=new Date(endTime.replace("-", "/").replace("-", "/"));
        if(end<start){
            $('#validate_endtime').attr("src","img/error.png");
            flag=0;
        }else {
            $('#validate_endtime').attr("src","img/tick.png");
            flag=1;
        }

    });
});
function editGroupBuy() {
    if(flag=1){
        $('#editGroupBuy').submit();
    }else {
        alert("请输入正确信息");
    }
}