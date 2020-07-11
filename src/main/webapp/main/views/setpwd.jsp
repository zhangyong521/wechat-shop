<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>设置我的密码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=path%>/main/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/main/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">当前用户</label>
                            <div class="layui-input-inline">
                                <input type="text" name="oldPassword" lay-verify="required" lay-verType="tips" class="layui-input" value="${username}" readonly="readonly">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password" lay-verify="required" lay-verType="tips" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password2" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="setmypass">确认修改</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=path%>/main/layuiadmin/layui/layui.js"></script>
<script>

    layui.config({
        base: '<%=path%>/main/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user'], function () {
        var $ = layui.$
            , form = layui.form

        //提交
        form.on('submit(setmypass)', function (obj) {
            //请求登入接口
            $.ajax({
                type: "POST",
                url: '<%=path%>/admin/update.action',
                data: obj.field,
                dataType: "json",
                success: function (rs) {
                    if (rs == 1) {
                        alert("修改成功！请重新登录！");
                        window.location.href = 'login.jsp';
                    } else {
                        alert("旧密码错误！");
                    }
                },
            });
            return false;
        });
    });
</script>
</body>
</html>