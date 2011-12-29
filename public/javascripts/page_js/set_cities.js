//这个js文件是在用户属性管理页面的设置所在城市时使用
$(".set_city").click(function(){
    $("#span_city").html($(this).html());
    $("#user_city_name").val($(this).html());
    $("#user_city_id").val($(this).attr("value"));   //将属性为value的值设定到user_city_id这个f.hidden_field中
    $("#div_change_city").slideToggle("slow");
    return false;
});