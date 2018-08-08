

$(document).ready(function() {
	noRead1();
	cartnum();
	setInterval("noRead()",5000);

    $.ajax({
        url: "getAllCategory.action",
        data: {},
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#allCategoryList").append("<li><a class='font-14' href='getCategoryGoods.action?category_id=" +
                    data[i].goods_category_id + "' >"+ data[i].category_name + "</a></li>");
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        alert("ajax error!");
        }
    });

   /* $(".list-item").hover(function () {
        $(this).children("div.category-item").show();
    }, function () {
        $(this).children("div.category-item").delay(1).hide(0);
        // $(this).children("div.sort-detail").hide(10);
    });*/
});

function noRead(){
	$.ajax({
        url: "getNoReadNum.action",
        data: {},
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {
            var red1=$("#redpoint").text();
            if(data==red1){
            	
            }else{
            	$("#redpoint").text(data);
            	alert("收到一条新消息");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
       
        }
    });
}


	function noRead1(){
		$.ajax({
	        url: "getNoReadNum.action",
	        data: {},
	        async: false,
	        datatype: "json",
	        type: "POST",
	        success: function (data) {
	           
	            	$("#redpoint").text(data);
	            
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	        
	        }
	    });
}
	
	
	function cartnum(){
		$.ajax({
	        url: "getCartNum.action",
	        data: {},
	        async: false,
	        datatype: "json",
	        type: "POST",
	        success: function (data) {
            	$("#cartnum").text(data);
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	        
	        }
	    });
	}