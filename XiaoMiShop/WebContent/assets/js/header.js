$(document).ready(function() {
    $(".list-item").hover(function () {
        $(this).children("div.category-item").show();
    }, function () {
        $(this).children("div.category-item").delay(1).hide(0);
        // $(this).children("div.sort-detail").hide(10);
    });
});