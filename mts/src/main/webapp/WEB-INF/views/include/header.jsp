
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<div class="navbar navbar-static-top">
    <div class="navbar-inner">
        <a class="brand" href="#">凯盛医疗</a>
        <ul class="nav">
            <li class="active"><a href="/home"><i class="fa fa-home"></i> 首页</a></li>
            <li class=""><a href=""><i class="fa fa-building"></i> 病人档案</a></li>
            <li><a href=""><i class="fa "></i>  就诊记录</a></li>
            <li><a href=""><i class="fa fa-bell-o"></i> 复诊提醒</a></li>
            <li><a href=""><i class="fa fa-bar-chart-o"></i> 数据统计</a></li>
            <li class="dropdown">
                <a href="" class="dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cogs"></i> 系统设置 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="admin/dept"><i class="fa fa-sitemap"></i> 科室设置</a></li>
                    <li><a href="admin/disease"><i class="fa fa-medkit"></i> 病种设置</a></li>
                    <li><a href="/insurance"><i class="fa fa-bars"></i> 医保类型设置</a></li>
                    <li class="divider"></li>
                    <li><a href="admin/user"><i class="fa fa-user-md"></i> 账号设置</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav pull-right">
            <li class="divider-vertical"></li>
            <li class="dropdown">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="hidden-xs">个人设置</span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/user/password">修改密码</a></li>
                    <li><a href="/user/log">登录日志</a></li>
                    <li class="divider"></li>
                    <li><a href="/logout">安全退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
