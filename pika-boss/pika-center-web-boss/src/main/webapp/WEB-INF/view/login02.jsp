<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<title>分布式系统管理中心 - 登录</title>
	<link href="${_cdnStaticResourcesPath}/resources/static/other/login-01/bootstrap.min.css" rel="stylesheet">
	<link href="${_cdnStaticResourcesPath}/resources/static/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
	<link href="${_cdnStaticResourcesPath}/resources/static/other/login-01/style.min.css" rel="stylesheet">
	<link href="${_cdnStaticResourcesPath}/resources/static/other/login-01/login.min.css" rel="stylesheet">
	<style type="text/css">
		/*解决谷歌浏览器文本框黄色背景的问题 -->*/
		input:-webkit-autofill {
			-webkit-box-shadow: 0 0 0px 1000px white inset !important;
		}
		.login-error{font-size: 12px;color:red;}
	</style>

	<style media="screen" type="text/css">
		img { display: none; }
		body { overflow: hidden; }
		#canvas { position: absolute; top: 0px; left: 0px; }
	</style>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script src="${_cdnStaticResourcesPath}/resources/static/js/plugins/other/rainyday.js" type="text/javascript"></script>
	<script type="text/javascript">
		/**雨滴背景*/
        function rainyday() {
            var engine = new RainyDay('canvas','bg1', window.innerWidth, window.innerHeight);
            engine.gravity = engine.GRAVITY_NON_LINEAR;
            engine.trail = engine.TRAIL_DROPS;
            engine.rain([
                engine.preset(3, 3, 0.88),
                engine.preset(5, 5, 0.9),
                engine.preset(6, 2, 1),
            ], 30);
        }

        $(document).ready(function(){
            $(window).resize(function () {
                window.location.href = window.location.href;
            });
        });
	</script>
</head>
<!--class="signin" -->
<body>
<img id="bg1" src="${_cdnStaticResourcesPath}/resources/static/images/login-bg02.jpg" />
<div id="cholder">
	<canvas id="canvas"></canvas>
</div>
<div class="signinpanel">
	<div class="row">
		<div class="col-sm-12" style="z-index: 9999;font-weight: bold;height: 80px;">
			<h2>[ 分布式系统管理中心 ]</h2>
			<div class="signup-footer">
				<%--<div class="pull-left"></div>--%>
			</div>
		</div>
		<div class="col-sm-7" style="z-index: 9999;">
			<div class="signin-info">
				<%--<div class="logopanel m-b">
					<h1>[ 分布式系统管理中心 ]</h1>
				</div>--%>
				<h4>最近更新于 <strong>2018-01-10 </strong></h4>
				<ul class="m-b" style="margin: 0px;">
					<li style="padding-top:5px;"><i class="fa fa-check-square-o m-r-xs"></i> 1、新增【在线聊天室】功能</li>
				</ul>
				<br/><br/>
				<h4>上次更新于 <strong>2017-12-26 </strong></h4>
				<ul class="m-b" style="margin: 0px;">
					<li style="padding-top:5px;"><i class="fa fa-check-square-o m-r-xs"></i> 1、新增【web版在线资源管理器】功能</li>
					<li style="padding-top:5px;"><i class="fa fa-check-square-o m-r-xs"></i> 2、新增【分布式任务调度管理平台】功能</li>
					<li style="padding-top:5px;"><i class="fa fa-check-square-o m-r-xs"></i> 3、新增【定时任务列表】功能</li>
					<li style="padding-top:5px;"><i class="fa fa-check-square-o m-r-xs"></i> 4、新增【代码生成器】功能</li>
					<li style="padding-top:5px;"><i class="fa fa-check-square-o m-r-xs"></i> 5、界面显示部分优化</li>
				</ul>
				<br/>
				<h4>新功能持续更新中，敬请期待。</h4>
			</div>
		</div>
		<div class="col-sm-5" style="z-index: 9999;margin-top:10px;">
			<form method="post" action="#">
				<p class="m-t-md">登录到系统</p>
				<input type="text" class="form-control uname" name="userName" id="userName" value="admin" placeholder="用户名" />
				<input type="password" class="form-control pword m-b" name="password" id="password" value="123456" placeholder="密码" style="margin-bottom:25px;" />
				<span style="padding-top: 10px;">账户：admin &nbsp;&nbsp;密码：123456 &nbsp;</span>
				<button class="btn btn-success btn-block" type="button" onclick="severCheck();" id="loginLink">登&nbsp;&nbsp;录</button>
			</form>
		</div>
		<div class="col-sm-12" style="z-index: 9999;font-weight: bold;">
			<div class="signup-footer">
				<div class="pull-left">
					&copy; 2018 www.2b2b92b.com
				</div>
			</div>
		</div>
	</div>
	<%--<div class="signup-footer">
		<div class="pull-left">
			&copy; 2017 www.2b2b92b.com
		</div>
	</div>--%>
</div>
<input type="hidden" id="loginUrl" value="${ctx}/login/login"/>
</body>
</html>


<script src="${_cdnStaticResourcesPath}/resources/static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<link href="${_cdnStaticResourcesPath}/resources/static/js/plugins/message/message.css" type="text/css" rel="stylesheet" />
<script src="${_cdnStaticResourcesPath}/resources/static/js/plugins/message/message.js"></script>
<script type="text/javascript">
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
</script>