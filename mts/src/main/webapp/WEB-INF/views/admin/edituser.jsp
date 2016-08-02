<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工信息修改</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
<div class="container">
    <div class="page-header">
        <h3>员工信息修改</h3>
    </div>
    <div class="row">
        <div class="col-xs-4">

            <form action="" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <div class="form-group">
                    <label>姓名</label>
                    <input type="text" name="realname" value="${user.realname}" class="form-control">
                </div>
                <div class="form-group">
                    <label>电话</label>
                    <input type="text" name="tel" value="${user.tel}" class="form-control">
                </div>
                <div class="form-group">
                    <label>身份</label>
                    <select class="form-control" name="role.id">
                        <c:forEach items="${roleList}" var="role">
                            <option ${user.role.id == role.id ? 'selected' : ''} value="${role.id}">${role.rolename}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <button  class="btn btn-primary">保存</button>
                </div>
            </form>

        </div>
    </div>


</div>


<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
