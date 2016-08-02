<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>凯盛医疗</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>

<jsp:include page="../include/navbar.jsp">
    <jsp:param name="menu" value="patient"/>
</jsp:include>
<c:if test="${not empty message}">
    <div class="alert alert-success"  id="flash">${message}</div>
</c:if>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-info"></i>
              <a href="patient-list.html"> 患者列表</a>  /  患者基本信息
            </span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/patient/${patient.id}/edit"><i class="fa fa-edit"></i> 修改</a></li>
                        <li><a href="new-patient.html"><i class="fa fa-times"></i> 删除</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td width="100"><strong>姓名</strong></td>
                            <td width="300">${patient.name}</td>
                            <td width="100"><strong>性别</strong></td>
                            <td width="300">${patient.sex}</td>
                            <td width="100"><strong>年龄</strong></td>
                            <td width="">${patient.age}</td>
                        </tr>
                        <tr>
                            <td><strong>身份证号</strong></td>
                            <td>${patient.idnum}</td>
                            <td><strong>联系电话</strong></td>
                            <td>${patient.tel}</td>
                            <td><strong>医保类型</strong></td>
                            <td>${patient.insurance.insname}</td>
                        </tr>
                        <tr>
                            <td><strong>地址</strong></td>
                            <td colspan="5">${patient.address}</td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>过敏史</strong></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                ${patient.allergicHistory}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>备注</strong></td>
                        </tr>
                        <tr>
                            <td colspan="6">${patient.remark}</td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>
            <!-- box end -->
            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-stethoscope"></i> 就诊记录</span>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="100">日期</th>
                            <th width="150">科室</th>
                            <th width="200">病种</th>
                            <th>初步诊断</th>
                            <th width="50"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>2014-07-02</td>
                            <td>内科</td>
                            <td>流感</td>
                            <td>流行性感冒</td>
                            <td>
                                <a href="/visit/${patient.id}">详情</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- box end -->
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