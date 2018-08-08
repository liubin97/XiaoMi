$(document).ready(function(){
$(".addGroup a").click(function(){
	var groupId = $(this).children(".groupId").text();
	var groupBuyInfoId = $(this).children(".groupBuyInfoId").text();
	$.ajax({
        url: "getIsInGroup.action",
        data: "groupId="+groupId,
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            console.log(data);
            if(data==1){
                alert("不能重复加入团!");
            }else if(data==0){
                //alert("跳转");
                window.location.href = "selectUserAddress.action?groupId="+groupId+"&groupBuyInfoId="+groupBuyInfoId;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //alert("ajax error!");
        }
    });
});



$("#stockEnough").click(function(){
	//alert("correct!");
	var num = $(this).children("#group_num").text();
	var id = $(this).children("#goods_detail_id").text();
	var groupBuyInfoId = $(this).children("#groupBuyInfoId").text();
$.ajax({
    url: "getGroupStock.action",
    data: "goodsDetailId="+id,
    async: false,
    datatype: "json",
    type: "POST",
    success: function (data) {
        console.log(data);
        if(data>=num){
            window.location.href = "selectUserAddress.action?groupBuyInfoId="+ groupBuyInfoId;
        }else {
            alert("库存不足");
        }
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
        //alert("ajax error!");
    }
});

});

});