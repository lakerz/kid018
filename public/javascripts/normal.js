/**
 * Created by .
 * User: laker
 * Date: 11-11-23
 * Time: 上午9:11
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {
    //the common functions which should be run for all action view
    show_fade_message();

    login_partial_ready();
    //这个方法由各个view定义！
    view_ready();
});

var self_desc_count = 200;     //自我描述的字数限制
var signature_count = 80;

//根据某一text_area的字数，设定可以输入的字数
//text_obj是text_area或text_field的id, show_obj是用于显示的id, max_count是最大字数
function character_count_remain_num(text_obj, show_obj, max_count){
    var remain_count = max_count - $(text_obj).val().length;
     $(show_obj).html(remain_count.toString());
}

//以渐渐消失的方式显示的提示信息。注意，要使用该功能，需要
//1，使用fade_message的partial
//2,
function show_fade_message(){
    if ($("#fadeInMessage").html() == "no message"){
       $("#fadeInMessage").hide();
    }else{
       $("#fadeInMessage").show();
       $("#fadeInMessage").fadeOut(3000);
    }
}

//显示一个浮动的文字提醒框
function show_floating_fade_message(){
    if ($("#floating_fade_message").html() == "no message"){
       $("#floating_fade_message").hide();
    }else{
       $("#floating_fade_message").show();
       $("#floating_fade_message").fadeOut(3000);
    }
}


function share_to_sina(shared_title){
  var _w = 16 , _h = 16;
  var param = {
    url:location.href,
    type:'3',
    count:'', /**是否显示分享数，1显示(可选)*/
    appkey:'', /**您申请的应用appkey,显示分享来源(可选)*/
    title:shared_title, /**分享的文字内容(可选，默认为所在页面的title)*/
    pic:'', /**分享图片的路径(可选)*/
    ralateUid:'LakerZeng', /**关联用户的UID，分享微博会@该用户(可选)*/
	language:'zh_cn', /**设置语言，zh_cn|zh_tw(可选)*/
    rnd:new Date().valueOf()
  }
  var temp = [];
  for( var p in param ){
    temp.push(p + '=' + encodeURIComponent( param[p] || '' ) )
  }
  document.write('<iframe allowTransparency="true" frameborder="0" scrolling="no" src="http://hits.sinajs.cn/A1/weiboshare.html?' + temp.join('&') + '" width="'+ _w+'" height="'+_h+'"></iframe>')
}
