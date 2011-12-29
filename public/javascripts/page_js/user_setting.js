function set_self_desc_character_count(){
     character_count_remain_num("#user_self_desc", "#desc_count", self_desc_count);
}

function set_signature_character_count(){
     character_count_remain_num("#user_signature", "#signature_count", signature_count);
}

function view_ready() {
    $("#reset_avatar").click(function(){
        $("#div_reset_avatar").slideToggle("slow");
      });

    $("#change_email").click(function(){
        $("#div_change_email").slideToggle("slow");
      });

    $("#change_name").click(function(){
        $("#div_change_name").slideToggle("slow");
      });

    $("#change_city").click(function(){
        $("#div_change_city").slideToggle("slow");
      });

    $("#user_self_desc").keyup(function(){
        set_self_desc_character_count();
    });

    $("#user_signature").keyup(function(){
        set_signature_character_count();
    });

    set_self_desc_character_count();
    set_signature_character_count();
}
