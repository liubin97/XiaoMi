$(document).ready(function () {

    //确认订单
    $("#confirm").click(function () {
        var address_selected = $(".selected");
        //判断是否选择收货地址
        if(address_selected.length == 0){
            alert("请选择地址");
        }else {
            var items = [];
            var address_id = address_selected.attr("data-address_id");
            var goods_num = $("#sum-num").text();
            var sum_money = $("#sum-price").attr("data-sum");
            var count = 0;//记录库存是否充足
            console.log("address:"+address_id+" sum_money:"+sum_money+" goods_num:"+goods_num);
            $("#items-body").find("tr").each(function () {
                var goods_detail_id = $(this).find(".goods-detail-id").val();
                var item_num = $(this).find(".quantity-label").val();
                var item_price = $(this).find(".single-price").attr("data-single_price");
                console.log("goods_detail_id:"+goods_detail_id+" item_num:"+item_num+" item_price:"+item_price);
                items.push({"goods_detail_id":goods_detail_id,"order_item_num":item_num,"item_price":item_price})
                //ajax判断库存
                $.ajax({
                    url: "getStock.action",
                    data: "goods_detail_id="+goods_detail_id,
                    async: false,
                    datatype: "json",
                    type: "POST",
                    success: function (data) {
                        console.log(data);
                        if(data>=item_num){

                        }else {
                            count++;
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("ajax error!");
                    }
                });
            });
            //若库存充足
            if(count == 0){
                //ajax传入订单数据
                $.ajax({
                    type:"POST",
                    url:"confirmOrder.action",
                    data:JSON.stringify({
                        orderItems:items,
                        address_id:address_id,
                        goods_num:goods_num,
                        sum_money:sum_money
                    })
                    ,
                    contentType:"application/json;charsetset=UTF-8",
                    dataType:"text",
                    async: false,
                    success:function(data){
                        alert("购买成功！");
                        window.location.href = "category.jsp";
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("ajax error!");
                    }
                });
            }else{//库存不足
                alert("库存不足");
                window.location.href = "index.jsp";
            }

        }
    });


});