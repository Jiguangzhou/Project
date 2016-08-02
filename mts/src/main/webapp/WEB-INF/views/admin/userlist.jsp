<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/plugins/datatables/css/dataTables.bootstrap.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="system"/>
</jsp:include>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-user-md"></i> 系统账号列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/admin/add"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">账户名称</th>
                            <th width="200">员工姓名</th>
                            <th>电话</th>
                            <th>最后登录时间</th>
                            <th>最后登录IP</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userlist}" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.realname}</td>
                            <td>${user.tel}</td>
                            <td>#</td>
                            <td>#</td>
                            <td>
                                <a href="/admin/${user.id}/edit" class="btn btn-primary">修改</a>
                                <a href="javascript:;" rel="${user.id}" class="delLink btn btn-danger">删除</a>
                                <a href="/admin/${user.id}/update" class="btn btn-danger">禁用</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div>
</div>

<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".delLink").click(function () {
            var id = $(this).attr("rel");
            if (confirm("确定删除么")) {
                window.location.href = id + "/del"
                }
            });
    });
</script>

</body>
</html>