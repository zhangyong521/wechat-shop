<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>微信商城后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=path%>/main/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/main/layuiadmin/style/admin.css" media="all">
    <script type="text/javascript">
        var username = '${username}';
        if (username == '') {
            window.location.href = 'main/views/login.jsp'
        }
    </script>
</head>
<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="http://www.layui.com/admin/" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search"
                           layadmin-event="serach" lay-action="template/search.html?keywords=">
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item" lay-unselect>
                    <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
                        <i class="layui-icon layui-icon-notice"></i>

                        <!-- 如果有新消息，则显示小圆点 -->
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>${admin.username}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="set/user/info.html">基本资料</a></dd>
                        <dd><a lay-href="views/setpwd.jsp">修改密码</a></dd>
                        <hr>
                        <dd lay-href="<%=path%>/admin/loginOut.action" style="text-align: center;"><a>退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="about"><i
                            class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="home/console.html">
                    <span>layuiAdmin</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                    lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="主页" lay-direction="2">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>主页</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console" class="layui-this">
                                <a lay-href="home/console.html">控制台</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="component" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="商品管理" lay-direction="2">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>商品管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="component/grid/list.html">分类查看</a></dd>
                            <dd data-name="mobile"><a lay-href="component/grid/mobile.html">商品查看</a></dd>
                        </dl>
                    </li>
                    <li data-name="template" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="轮播图管理" lay-direction="2">
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>轮播图管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="template/personalpage.html">轮播图查看</a></dd>
                        </dl>
                    </li>
                    <li data-name="app" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="导航管理" lay-direction="2">
                            <i class="layui-icon layui-icon-app"></i>
                            <cite>导航管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="app/message/index.html">导航查看</a></dd>
                        </dl>
                    </li>
                    <li data-name="senior" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="搜索管理" lay-direction="2">
                            <i class="layui-icon layui-icon-senior"></i>
                            <cite>搜索管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="app/message/index.html">搜索查看</a></dd>
                        </dl>
                    </li>
                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="运费管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>运费管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="list"><a lay-href="component/grid/list.html">运费查看</a></dd>
                            <dd data-name="mobile"><a lay-href="component/grid/mobile.html">快递查看</a></dd>
                        </dl>
                    </li>
                    <li data-name="youhui" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="营销活动" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>营销活动</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="user/user/list.html">优惠卷查看</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="order" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="订单管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>订单管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="user/user/list.html">订单查看</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="people" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="会员管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>会员管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="user/user/list.html">查看会员</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="wx" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="公众号管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>公众号管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="user/user/list.html">菜单管理</a></dd>
                            <dd><a lay-href="user/user/list.html">参数设置</a></dd>
                            <dd><a lay-href="user/user/list.html">关注回复</a></dd>
                            <dd><a lay-href="user/user/list.html">回复事件</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i
                            class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="home/console.html" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script src="<%=path%>/main/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '<%=path%>/main/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
</body>
</html>


