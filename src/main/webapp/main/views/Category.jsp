<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>静态表格</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=path%>/src/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/src/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">主页</a>
        <a><cite>组件</cite></a>
        <a><cite>静态表格</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>缩略图</th>
                            <th>是否显示</th>
                            <th>分类排序</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>贤心</td>
                            <td>汉族</td>
                            <td>1989-10-14</td>
                            <td>人生似修行</td>
                            <td>1989-10-14</td>
                            <td>人生似修行</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=path%>/src/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '<%=path%>/src/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index']);

    //请求登入接口
    $.ajax({
      type: "GET",
      url: '<%=path%>/main/ctgList.action',
      data: obj.field,
      dataType: "json",
      success: function (data) {
        if (data.code == 200) {

        } else {
          layer.msg(data.msg, {icon: 2});
        }
      },
      error: function () {
        layer.msg('网络连接异常，请检查网络是否稳定', {icon: 2});
      }
    });
</script>

</body>
</html>