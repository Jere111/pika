var layer;
$(function () {
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        form.verify({
            username: function (v) {
                if (v.trim() == '') {
                    return "用户账号不能为空";
                }
            }
            , password: function (v) {
                if (v.trim() == '') {
                    return "密码不能为空";
                }
            }, code: function (v) {
                if (v.trim() == '') {
                    return '验证码不能为空';
                }
            }
        });

        form.render();
    });
    layer = layui.layer;
    var msg = $('#message').val();
    if (msg.trim() != "") {
        layer.msg(msg, {icon: 5, anim: 6, offset: 't'});
    }
})

if (window != top)
    top.location.href = location.href;