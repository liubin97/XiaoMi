$(document).ready(function(){
    //获取全部商品分类以及分类下的商品
    $.ajax({
        url: "getAllCategory.action",
        data: {},
        async: false,
        datatype: "json",
        type: "POST",
        success: function (data) {//这里的data是由请求页面返回的数据
            $("#allCategory").empty();
            for (var i = 0; i < data.length; i++) {
                //var trHTML1 = "<tr><td>"+data[i].username+"</td><td>"+ data[i].age +"</td><td>" +data[i].email+"</td>";
                var categoryHtml = "<div class=\"container\">\n" +
                    "                <section class=\"stores-area stores-area-v1\">\n" +
                    "                    <header class=\"panel ptb-15 prl-20 pos-r mb-30\">\n" +
                    "                        <h3 class=\"section-title font-18\">\n" +
                    "                            <a class=\"category-list\" data-toggle=\"collapse\" data-target=\"#"+ data[i].goods_category_id + "\"><span class=\"fa fa-chevron-down\">&nbsp;</span>"+ data[i].category_name + "</a>\n" +
                    "                        </h3>\n" +
                    "                     </header>\n" +
                    "                    <div id=\"" +data[i].goods_category_id + "\" class=\"row row-rl-15 row-tb-15 t-center collapse in\">\n" ;

                for(var j = 0; j < data[i].goodsList.length; j++){
                    // console.log(data[i].goodsList[j].goods_pic_url);
                    categoryHtml += "            <div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n" +
                        "                            <a href=\"displayGoodsPurchaseInfo.action?goods_id=" + data[i].goodsList[j].goods_id + "\" class=\"panel is-block\">\n" +
                        "                                <div class=\"embed-responsive embed-responsive-4by3\">\n" +
                        "                                    <div class=\"store-logo\">\n" +
                        "                                        <img src="+"\""+data[i].goodsList[j].goods_pic_url+"\""+"alt=\"\">\n" +
                        "                                    </div>\n" +
                        "                                </div>\n" +
                        "                                <h6 class=\"store-name ptb-10\">"+
                        data[i].goodsList[j].goods_name +"</h6>\n" +
                        "                            </a>\n" +
                        "                        </div>\n" ;
                }
                categoryHtml += "        </div>\n" +
                    "                </section>\n" +
                    "            </div>";

                $("#allCategory").append(categoryHtml);
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("ajax error!");
        }
    });

    //上下图标切换
    $(".category-list").click(function(){
        if ($(this).children("span").hasClass("fa-chevron-up")) {
            $(this).children("span").removeClass("fa-chevron-up");
            $(this).children("span").addClass("fa-chevron-down");
        }
        else if ($(this).children("span").hasClass("fa-chevron-down")) {
            $(this).children("span").removeClass("fa-chevron-down");
            $(this).children("span").addClass("fa-chevron-up");
        }

    });

});
