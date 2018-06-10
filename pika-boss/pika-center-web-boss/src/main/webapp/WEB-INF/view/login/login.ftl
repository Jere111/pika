<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>分布式系统管理中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${_cdnStaticResourcesPath}/resources/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${_cdnStaticResourcesPath}/resources/static/x-admin/css/font.css">
    <link rel="stylesheet" href="${_cdnStaticResourcesPath}/resources/static/x-admin/css/xadmin.css">
    <link rel="stylesheet" href="${_cdnStaticResourcesPath}/resources/static/other/login-01/style.css" media="all">
    <script src="${_cdnStaticResourcesPath}/resources/static/layui/layui.all.js" charset="utf-8"></script>
    <script src="${_cdnStaticResourcesPath}/resources/static/js/jquery-1.9.1.min.js" charset="utf-8"></script>

</head>
<body>
    <input type="hidden" id="loginUrl" value="${ctx}/login/login"/>
    <div class="box_login">
        <div class="logo_login"><img src="${_cdnStaticResourcesPath}/resources/static/images/logo_login.png" alt="分布式系统管理中心"/></div>
        <div class="login_menu">
            <ul>
                <li><a class="m_1" href="javascript:void(0)">系统简介</a></li>
                <li><a class="m_2" href="javascript:void(0)">帮助中心</a></li>
                <li><a class="m_3" href="javascript:void(0)">操作手册下载</a></li>
                <li><a class="m_4" href="javascript:void(0)">附件1下载</a></li>
            </ul>
        </div>
        <div class="login_bg1">
            <div class="login_bg2">
                <div class="login_con">
                    <div class="tit">用户登录</div>
                    <form class="layui-form" method="post" action="${ctx}/login/login">
                        <input type="hidden" id="message" value="${message}" />
                        <div class="text mt25">
                            <span class="icon_user"></span>
                            <input type="text" name="userName" id="userName" placeholder="输入用户账号" autocomplete="off" lay-verify="username" class="layui-input" style="margin-left: 50px;margin-top: -37px;"/>
                        </div>
                        <div class="text">
                            <span class="icon_sec"></span>
                            <input type="password" name="password" id="password" placeholder="输入密码" autocomplete="off" lay-verify="password" class="layui-input" style="margin-left: 50px;margin-top: -35px;"/>
                        </div>
                        <div class="jzmm">
                            <input type="checkbox">记住密码
                        </div>
                        <a class="btn_basi5 btn_redr" lay-submit lay-filter="login" href="javascript:void(0);" onclick="severCheck();" id="loginLink">登 录</a>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>
                系统已更新: 该系统主要支持谷歌和火狐浏览器！&nbsp;&nbsp;
                下载地址:
                <a class="blue"><img src="images/icon_chrome.png"/>谷歌浏览器</a>
                <a class="blue"><img src="images/icon_firefox.png"/>火狐浏览器</a>
            </p>
        </div>
    </div>

<link href="${_cdnStaticResourcesPath}/resources/static/js/plugins/message/message.css" type="text/css" rel="stylesheet" />
<script src="${_cdnStaticResourcesPath}/resources/static/js/plugins/message/message.js"></script>
<script src="${_cdnStaticResourcesPath}/resources/static/script/login/login.js"></script>

</body>
</html>
