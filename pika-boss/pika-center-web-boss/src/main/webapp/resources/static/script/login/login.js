$(document).ready(function(){
    $(window).resize(function () {
        window.location.href = window.location.href;
    });
});

//是否开启验证码登录
var openVerifyCode = false;

//是否开启ajax登录
var openAjaxLogin = true;

$(document).keyup(function(event) {
    if (event.keyCode == 13) {
        $("#loginLink").trigger("click");
    }
});

function reset(){
    $("#userName").val("");
    $("#password").val("");
    $("#userName").focus();
}

//客户端校验
function check() {
    if ($("#userName").val() == "") {
        $.message({
            message:"请输入账户名",
            type:'info'
        });
        $("#userName").focus();
        return false;
    } else {
        $("#userName").val(jQuery.trim($('#userName').val()));
    }

    if ($("#password").val() == "") {
        $.message({
            message:"请输入密码",
            type:'info'
        });
        $("#password").focus();
        return false;
    }
    return true;
}

//服务器校验
function severCheck(){
    if(check()){
        //使用ajax登录
        if(openAjaxLogin){
            var userName = $("#userName").val();
            var password = $("#password").val();

            $.ajax({
                type: "post",
                url: $("#loginUrl").val(),
                data: {"userName" : userName, "password" : password , "openAjaxLogin" : openAjaxLogin},
                dataType:'json',
                cache: false,
                success: function(data){
                    if(200 == data.code){
                        window.location.href="/";
                    }else if("usererror" == data.msg){
                        $.message({
                            message:"用户名或密码错误",
                            type:'error'
                        });
                        $("#userName").focus();
                    }else{
                        $.message({
                            message:data.msg,
                            type:'error'
                        });
                        $("#userName").focus();
                    }
                }
            });
        }
    }
}

/**
 * 检测登录页面是否显示在了ifram中，需要将顶层的url变成登录页面的地址
 */
if(top.location != this.location){
    window.parent.location.href = "/login/toLogin";
}