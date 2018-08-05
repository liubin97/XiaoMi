$(document).ready(function() {
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