<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>BOSS系统管理中心</title>
    <%@ include file="/WEB-INF/view/common/common.jsp"%>

    <style>
        /*避免被ace.min.css里面的样式影响*/
        .nav-list .open>a,.nav-list .open>a:hover,.nav-list .open>a:focus{
            background-color: #438EB9;
            color: #FFFFFF;
        }
        .nav-list>dt>a:hover{
            background-color: #EDEDED;
        }
        .nav-list dt{
            font-weight : normal;
        }
    </style>
</head>




<body>
<div class="Sellerber" id="Sellerber">
    <!--顶部-->
    <div class="Sellerber_header apex clearfix" id="Sellerber_header" style="background-color: #438EB9;">
        <div class="l_f logo" style="height: 45px;line-height: 45px;margin-left: 10px;"><a style="color: #FFFFFF;font-size: 16px;font-family: 微软雅黑; " href="${ctx}" >BOSS系统管理中心</a></div>
        <div class="r_f Columns_top clearfix">
            <div class="administrator l_f">
                <img src="${_cdnStaticResourcesPath}/resources/static/images/avatar.png"  width="36px"/><span class="user-info">欢迎你 ${userName}</span><i class="glyph-icon fa  fa-caret-down"></i>
                <ul class="dropdown-menu">
                    <%--<li><a href="#"><i class="fa fa-user"></i>个人信息</a></li>
                    <li><a href="#"><i class="fa fa-cog"></i>系统设置</a></li>--%>
                    <li><a href="javascript:void(0)" id="Exit_system"><i class="fa fa-user-times"></i>退出</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- =======================================左侧菜单 start ======================================= -->
    <div class="Sellerber_left menu" id="menuBar">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
        <div class="menu_style" id="menu_style">
            <div class="list_content">
                <dl class="nav nav-list" id="menu_list">
                    <dt class="shop_index" onclick="this.style.borderColor='#F9F9F9';this.style.borderBottom='1px solid #e5e5e5';">
                        <a href="javascript:void(0)" name="${ctx}/main" title=""
                           onmouseout="javascript:this.style.backgroundColor='#f9f9f9';"
                           onmouseover="javascript:this.style.backgroundColor='#EDEDED';"
                           onclick="javascript:this.style.backgroundColor='#F9F9F9';this.style.color='#000';this.style.borderColor='#F9F9F9';">
                            <i class="fa fa-home"></i><span class="menu-text">&nbsp;系统首页</span>
                        </a>
                    </dt>
                    <shiro:hasPermission name="publish:message:view">
                        <dt class="shop_index nav_link " onclick="this.style.borderColor='#F9F9F9';this.style.borderBottom='1px solid #e5e5e5';">
                            <a href="javascript:void(0)" name="${ctx}/message/wall/view" class="iframeurl" title="留言墙"
                               onmouseout="javascript:this.style.backgroundColor='#f9f9f9';"
                               onmouseover="javascript:this.style.backgroundColor='#EDEDED';"
                               onclick="javascript:this.style.backgroundColor='#F9F9F9';this.style.color='#000';this.style.borderColor='#F9F9F9';">
                                <i class="fa fa-pencil-square-o"></i><span class="menu-text">&nbsp;留言墙</span>
                            </a>
                        </dt>
                    </shiro:hasPermission>
                    <dd class="submenu" style="height:0px; border:0px;"></dd>

                    <c:forEach items="${menuList}" var="menu">
                        <shiro:hasPermission name="${menu.permissionCode}">
                            <dt class="nav_link ">
                                <a href="javascript:void(0)" class="dropdown-toggle title_nav"><i class="${menu.icon}"></i><span class="menu-text"> ${menu.name } </span><b class="arrow fa fa-angle-down"></b></a>
                            </dt>
                            <dd class="submenu">
                                <ul>
                                    <c:forEach items="${menu.subMenu}" var="sub">
                                        <shiro:hasPermission name="${sub.permissionCode}">
                                            <li class="home"><a href="javascript:void(0)" name="${ctx}/${sub.url}" title="${sub.name}" class="iframeurl"><i class="fa fa-angle-double-right"></i>${sub.name}</a></li>
                                        </shiro:hasPermission>
                                    </c:forEach>
                                </ul>
                            </dd>
                        </shiro:hasPermission>
                    </c:forEach>
                </dl>
            </div>
        </div>
    </div>
    <!-- =======================================左侧菜单 end ======================================= -->


    <!--内容-->
    <div class="Sellerber_content" id="contents">
        <div class="breadcrumbs" id="breadcrumbs">
            <a id="js-tabNav-prev" class="radius left_roll" href="javascript:;"><i class="fa fa-backward"></i></a>
            <div class="breadcrumb_style clearfix">
                <ul class="breadcrumb clearfix" id="min_title_list">
                    <li class="active home"><span title="我的桌面" data-href="${ctx}/main"><i class="fa fa-home home-icon"></i>首页</span></li>
                </ul>
            </div>
            <a id="js-tabNav-next" class="radius right_roll" href="javascript:;"><i class="fa fa-forward"></i></a>
            <div class="btn-group radius roll-right">
                <a class="dropdown tabClose" data-toggle="dropdown" aria-expanded="false">
                    页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
                    <li><a class="tabReload" href="javascript:void(0);">刷新当前</a></li>
                    <li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li>
                    <li><a class="tabCloseAll" href="javascript:void(0);">全部关闭</a></li>
                    <li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a></li>
                </ul>
            </div>
            <a href="javascript:void(0);" class="radius roll-right fullscreen"><i class="fa fa-arrows-alt"></i></a>
        </div>
        <!--具体内容-->
        <div id="iframe_box" class="iframe_content">
            <div class="show_iframe" id="show_iframe">
                <iframe scrolling="yes" class="simei_iframe" frameborder="0" src="${ctx}/main" name="iframepage" data-href="${ctx}/main"></iframe>
            </div>
        </div>
    </div>
    <!--底部-->
    <div class="Sellerber_bottom info" id="bottom" style="text-align: center;background-color: #f2f2f2;color: #000000;">
        <span>小周Java技术分享 - www.2b2b92b.com</span>
    </div>
</div>
</body>
</html>
<script>
    //设置框架
    $(function() {
        $("#Sellerber").frame({
            float : 'left',
            color_btn:'.skin_select',
            header:45,//顶部高度
            bottom:30,//底部高度
            menu:200,//菜单栏宽度
            Sellerber_menu:'.list_content',
            Sellerber_header:'.Sellerber_header',
        });

        /*$(window).bind('beforeunload',function () {
         return '浏览器出口关闭事件回调';
         });*/
    });
    //时间设置
    /*    function currentTime(){
     var weekday=new Array(7)
     weekday[0]="星期一"
     weekday[1]="星期二"
     weekday[2]="星期三"
     weekday[3]="星期四"
     weekday[4]="星期五"
     weekday[5]="星期六"
     weekday[6]="星期日"
     var d=new Date(),str='';
     str+=d.getFullYear()+'年';
     str+=d.getMonth() + 1+'月';
     str+=d.getDate()+'日';
     str+=d.getHours()+'时';
     str+=d.getMinutes()+'分';
     str+= d.getSeconds()+'秒'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
     str+=weekday[d.getDay()-1];
     return str;
     }
     setInterval(function(){$('#time').html(currentTime)},1000);*/
    $('#Exit_system').on('click', function(){
        $('body').dialog({
            type: 'success',
            showBoxShadow: true,
            title : '客官请留步',
            discription : '您确定要退出吗？<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;还请多多关注项目动态哦~功能不定期更新哒^_^',
            animateIn:'fadeInRight-hastrans',
            animateOut:'fadeOutRight-hastrans'
        },function(ret) {
            if(ret.index===0){
                window.location.href="/login/logout";
            }else{
                return false;
            }
        });
    });
</script>
<script type="text/javascript">
    $("#menu_style").niceScroll({
        cursorcolor:"#888888",
        cursoropacitymax:1,
        touchbehavior:false,
        cursorwidth:"5px",
        cursorborder:"0",
        cursorborderradius:"5px"
    });

</script>