//该函数需要被调用该partial的view所对应的view_ready()函数所调用
function login_partial_ready(){
    $("#loginForm").validate({
        debug: false,
        onsubmit: true,
        rules: {
            "loginName": {required: true, email: true},
            "password": {required: true}
         },
        messages: {
           loginName: {
            required: "请输入Email地址",
            email: "请输入正确的email地址"
           },
           password: {
            required: "请输入密码"
           }
         },
        errorLabelContainer: "#errorBox",
        wrapper: "li"
    });

    $(".login_pop").colorbox({inline:true, width:"450px", height:"250px", opacity:0.3, title:"用户登录"});
}