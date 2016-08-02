<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>凯盛医疗</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/plugins/datatables/css/dataTables.bootstrap.min.css">
</head>
<body>


<jsp:include page="../include/navbar.jsp">
    <jsp:param name="menu" value="patient"/>
</jsp:include>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title">搜索</span>
                </div>
                <div class="box-body search-box">
                    <form action="" class="form-search">
                        <input type="text" placeholder="姓名">
                        <input type="text" placeholder="身份证号">
                        <input type="text" placeholder="电话">
                        <button class="button button-flat-primary button-pill"><i class="fa fa-search"></i> 搜索</button>
                    </form>
                </div>
            </div>


            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-building"></i> 患者列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/patient/new"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="20">
                                <input type="checkbox" name="">
                            </th>
                            <th width="100">姓名</th>
                            <th width="50">性别</th>
                            <th width="150">电话</th>
                            <th width="200">医保类型</th>
                            <th>地址</th>
                            <th width="50">状态</th>
                            <th width="100">创建日期</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${patientList}" var="patient">
                            <tr>
                                <td>
                                    <input type="checkbox" name="" >
                                </td>
                                <td><a href="/patient/${patient.id}">${patient.name}</a></td>
                                <td>${patient.sex}</td>
                                <td>${patient.tel}</td>
                                <td>${patient.insurance.insname}</td>
                                <td>${patient.address}</td>
                                <td>${patient.status}</td>
                                <td><fmt:formatDate value="${patient.createtime}" pattern="y-MM-dd"/></td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>


<script src="/static/plugins/validate/jquery.validate.min.js"></script>
<script>

    $(function () {


    });
</script>


</body>
</html>