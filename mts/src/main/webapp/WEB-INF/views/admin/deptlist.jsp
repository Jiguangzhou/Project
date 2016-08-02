<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<%@include file="../include/header.jsp" %>

<div class="box">
    <div class="box-header">
        <span class="title"><i class="fa fa-sitemap"></i> 科室列表</span>
        <ul class="unstyled inline pull-right">
            <li><a href="/admin/add/dept" ><i class="fa fa-plus"></i> 新建</a></li>
        </ul>
    </div>
    <div class="box-body">
        <table class="table">
            <thead>
            <tr>
                <th width="200">科室名称</th>
                <th width="200">负责人</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${deptList}" var="dept">
                <tr>
                    <td>${dept.deptname}</td>
                    <td>${dept.principal}</td>
                    <td>
                        <a href="/admin/dept/${dept.id}/edit" class="btn btn-primary">修改</a>
                        <a href="javascript:;" rel="${dept.id}" class="delLink btn btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugins/jQuery/jquery.validate.min.js"></script>
<script>

    $(function () {
        $(".delLink").click(function () {
            var id = $(this).attr("rel");
            if (confirm("确定删除么")) {
                window.location.href = "dept/"+id + "/del"
            }
        });
    });
</script>
</body>
</html>