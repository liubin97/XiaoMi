
var flag_2=1;
var flag_3=1;
var flag_4=1;
var flag_5=1;
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
                $("#goods_detail_id_val").append("<option value='"+data[i].goods_detail_id+"'>"+data[i].kind+","+data[i].color+"</option>" );
            }
            var select_value = $("#goods_detail_id").val();
            $("#goods_detail_id_val option[value='"+select_value+"']").attr("selected","selected");
        },
        error:function(data){
            alert("fail");
        },
    });
    $('#seckill_name').change(function () {
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_seckill_name').attr("src","img/error.png");
            flag_2=0;
        } else{
            $('#validate_seckill_name').attr("src","img/tick.png");
            flag_2=1;
        }
    });//校验秒杀名称非空
    $('#seckill_num').change(function () {
        var seckill_num = $('#seckill_num').val();
        var goods_detail_id = $('#goods_detail_id').val();
        var seckill_num_ref = $('#seckill_num_ref').val();
        var seckill_num_val = seckill_num-seckill_num_ref;
        var pattern = /^[0-9]*[1-9][0-9]*$/;
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_seckill_num').attr("src","img/error.png");
            flag_3=0;
        } else{
            if(pattern.test(seckill_num)){
                if(goods_detail_id==0){//未选择商品
                    alert("请选择商品");
                    $('#validate_seckill_num').attr("src","img/error.png");
                    flag_3=0;
                }else if(seckill_num_ref>=seckill_num){
                    $('#validate_seckill_num').attr("src","img/tick.png");
                    flag_3=1;
                } else {
                    $.ajax({
                        url:"validate_seckill_num.action",
                        type:"post",
                        data:{seckill_num : seckill_num_val ,
                            goods_detail_id : goods_detail_id
                        },
                        dataType:"json",
                        contentType: "application/x-www-form-urlencoded",
                        success:function(data)
                        {
                            result = eval(data);

                            if(result==0){
                                $('#validate_seckill_num').attr("src","img/tick.png");
                                flag_3=1;
                            }else {
                                $('#validate_seckill_num').attr("src","img/error.png");
                                flag_3=0;
                            }
                        },
                        error:function(data){
                            alert("fail");
                            $('#validate_seckill_num').attr("src","img/error.png");
                            flag_3=0;
                        }
                    });
                }

            }else {
                $('#validate_seckill_num').attr("src","img/error.png");
                flag_3=0;
            }
        }
    });//校验秒杀数量，非空，正整数，小于库存量
    $('#seckill_money').change(function () {
        var seckill_money = $('#seckill_money').val();
        var goods_detail_id = $('#goods_detail_id').val();
        var pattern = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_seckill_money').attr("src","img/error.png");
            flag_4=0;
        } else{
            if(pattern.test(seckill_money)){
                if(goods_detail_id==0){
                    alert("请选择商品");
                    $('#validate_seckill_money').attr("src","img/error.png");
                    flag_4=0;
                }else {
                    $.ajax({
                        url:"validate_seckill_money.action",
                        type:"post",
                        data:{seckill_money : seckill_money,
                            goods_detail_id : goods_detail_id
                        },
                        dataType:"json",
                        contentType: "application/x-www-form-urlencoded",
                        success:function(data)
                        {
                            result = eval(data);

                            if(result==0){
                                $('#validate_seckill_money').attr("src","img/tick.png");
                                flag_4=1;
                            }else {
                                $('#validate_seckill_money').attr("src","img/error.png");
                                flag_4=0;
                            }
                        },
                        error:function(data){
                            alert("fail");
                            $('#validate_seckill_money').attr("src","img/error.png");
                            flag_4=0;
                        },
                    });
                }


            }else {
                $('#validate_seckill_money').attr("src","img/error.png");
                flag_4=0;
            }
        }
    });//校验秒杀价格，非空，正数，小于原价
    $("#starttime").change(function(){
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_starttime').attr("src","img/error.png");
            flag_4=0;
        } else{
            $('#validate_starttime').attr("src","img/tick.png");
            flag_4=1;
        }
    });//校验开始时间非空
    $("#endtime").change(function(){
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_endtime').attr("src","img/error.png");
            flag_5=0;
        } else{
            $('#validate_endtime').attr("src","img/tick.png");
            flag_5=1;
        }
    });//校验结束时间非空
});
function editSecKill() {
    if(flag_2==flag_3==flag_4==flag_5==1){
        $('#editMSecKill').submit();
    }else{
        alert("请输入正确信息");
    }
}