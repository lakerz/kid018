/**
 * Created by .
 * User: laker
 * Date: 11-11-23
 * Time: 上午9:11
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {
    $("#new_user").validate({
        debug: false,
        onsubmit: true,
        rules: {
            "user[email]": {required: true, email: true, remote:"/users/check_mail"},
            "user[password]": {required: true, minlength: 6, maxlength:14},
            "repeatPassword": {required: true, equalTo: "#user_password"},
            "user[name]": {required: true, maxlength: 12, remote:"/users/check_name"},
            "inviteCode": {required: true, remote:"/users/check_invitecode"}
         },
        messages: {
             "user[email]": {
                 remote: "所输入的Email地址已被使用过"
             },
             "repeatPassword":{
                 equalTo:"两次设定的密码应该一致"
             },
            "user[name]": {
                maxlength: "网名用1-8个字符",
                remote: "这个名字已被使用，请选用其他名字"
            },
            "inviteCode": {
                remote: "邀请码无效，请重新输入"
            }
         }
    });

    // 该方法是确保在提交前再次对EMAIL, 网名以及邀请码进行确认，可以防止重复提交和时间差提交
    // 绑定在submit上的处理
    $("#user_submit").click(function() {
      //先清空cache的数据
      $("#user_email").removeData("previousValue");
      $("#user_name").removeData("previousValue");
      $("#inviteCode").removeData("previousValue");

      var validateResult = true;
      //调用对相应元素的检查
      validateResult = $("#new_user").validate().element("user[email]");
      validateResult = $("#new_user").validate().element("user[name]");
      validateResult = $("#new_user").validate().element("inviteCode");

      if(validateResult){
         $("#new_user").submit();
      }else{
        return false;
      }
    });

});