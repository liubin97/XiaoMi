
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
});
function editGroupBuy() {//提交表单是校验新的结束时间是否比之前大
    var endtime_ref = $('#endtime_ref').val();
    var endtime=$("#endtime").val();
    var d1 = new Date(endtime_ref.replace(/\-/g, "\/"));
    var d2 = new Date(endtime.replace(/\-/g, "\/"));
    if(endtime_ref!=""&&endtime!=""&&d1>=d2)
    {
        $('#validate_alert').modal('toggle');
        return false;
    }else {
        $('#editGroupBuy').submit();
    }



}