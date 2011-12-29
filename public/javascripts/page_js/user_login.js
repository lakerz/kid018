function view_ready(){
    $("#loginForm").validate({
        debug: false,
        onsubmit: true,
        rules: {
            "loginName": {required: true, email: true},
            "password": {required: true}
         },
        messages: {
         }
    });
}