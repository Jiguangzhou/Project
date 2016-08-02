<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>科室信息修改</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="">科室信息修改</a>
            </span>
                </div>
                <div class="box-body form">
                    <form action="" method="post">
                        <input type="hidden" name="id" value="${dept.id}">
                        <div class="form-group">
                            <label>科室名称</label>
                            <input type="text" name="deptname" value="${dept.deptname}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>负责人</label>
                            <input type="text" name="principal" value="${dept.principal}" class="form-control">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


</div>


<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
