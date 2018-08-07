var flag_1 = 0;
var flag_2 = 0;
var flag_3 = 0;
var flag_4 = 0;
var flag_5 = 0;
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
        //alert(goods_id);
        var selOpt = $("#goods_detail_id option");
        selOpt.remove();
        if(goods_id==0){
            $('#validate_goodsId').attr("src","img/error.png");
            flag_1=0;
        }else {
            $('#validate_goodsId').attr("src","img/tick.png");
            flag_1=1;
        }
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
    $("#goods_detail_id").change(function(){
        var goods_detail_id = $('#goods_detail_id').val();

        if(goods_detail_id==0){
            $('#validate_goods_detail_id').attr("src","img/error.png");
        }else {
            $('#validate_goods_detail_id').attr("src","img/tick.png");
        }
    });
    $("#group_num").change(function(){
        var group_num = $('#group_num').val();
        var goods_detail_id = $('#goods_detail_id').val();
        //alert(group_num);
        var pattern = /^[0-9]*[1-9][0-9]*$/;
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_minNumber').attr("src","img/error.png");
            flag_2=0;
        } else{
            if(pattern.test(group_num)){
                if(goods_detail_id==0){
                    alert("请选择商品");
                    $('#validate_minNumber').attr("src","img/error.png");
                    flag_2=0;
                }else if(group_num==1) {
                    $('#validate_minNumber').attr("src","img/error.png");
                    flag_2=0;
                }else {
                    $.ajax({
                        url:"validate_group_num.action",
                        type:"post",
                        data:{group_num : group_num,
                            goods_detail_id : goods_detail_id
                        },
                        dataType:"json",
                        contentType: "application/x-www-form-urlencoded",
                        success:function(data)
                        {
                            result = eval(data);

                            if(result==0){
                                $('#validate_minNumber').attr("src","img/tick.png");
                                flag_2=1;
                            }else {
                                $('#validate_minNumber').attr("src","img/error.png");
                                flag_2=0;
                            }
                        },
                        error:function(data){
                            alert("fail");
                            $('#validate_minNumber').attr("src","img/error.png");
                            flag_2=0;
                        }
                    });
                }

            }else {
                $('#validate_minNumber').attr("src","img/error.png");
                flag_2=0;
            }
        }

    });
    $("#group_buy_price").change(function () {
        var group_buy_price = $('#group_buy_price').val();
        var goods_detail_id = $('#goods_detail_id').val();
        var pattern = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
        if($(this).val() == "" || $.trim($(this).val()).length == 0){
            $('#validate_gb_price').attr("src","img/error.png");
            flag_3=0;
        } else{
            if(pattern.test(group_buy_price)){
                if(goods_detail_id==0){
                    alert("请选择商品");
                    $('#validate_gb_price').attr("src","img/error.png");
                    flag_3=0;
                }else {
                    $.ajax({
                        url:"validate_group_buy_price.action",
                        type:"post",
                        data:{group_buy_price : group_buy_price,
                            goods_detail_id : goods_detail_id
                        },
                        dataType:"json",
                        contentType: "application/x-www-form-urlencoded",
                        success:function(data)
                        {
                            result = eval(data);

                            if(result==0){
                                $('#validate_gb_price').attr("src","img/tick.png");
                                flag_3=1;
                            }else {
                                $('#validate_gb_price').attr("src","img/error.png");
                                flag_3=0;
                            }
                        },
                        error:function(data){
                            alert("fail");
                            $('#validate_gb_price').attr("src","img/error.png");
                            flag_3=0;
                        },
                    });
                }


            }else {
                $('#validate_gb_price').attr("src","img/error.png");
                flag_3=0;
            }
        }
    });
    $('#addGroupBuyButton').on('click', function() {
        if($('#starttime').val() == "" || $.trim($('#starttime').val()).length == 0){
            $('#validate_starttime').attr("src","img/error.png");
            flag_4=0;
        }else {
            flag_4=1;
            $('#validate_starttime').attr("src","img/tick.png");
        }
        if($('#endtime').val() == "" || $.trim($('#endtime').val()).length == 0){
            $('#validate_endtime').attr("src","img/error.png");
            flag_5=0;
        }else {
            flag_5=1;
            $('#validate_endtime').attr("src","img/tick.png");
        }
        if(flag_1==flag_2==flag_3==flag_4==flag_5==1){
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    $('#addGroupBuy').submit();
                },
                // closeOnConfirm: false,
                onCancel: function() {

                }
            });

        }else{
            alert("请输入正确信息");
        }

    });
});

