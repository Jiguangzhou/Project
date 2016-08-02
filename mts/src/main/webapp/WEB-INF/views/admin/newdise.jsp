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
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="system"/>
</jsp:include>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href=""> 病种列表</a>  /  新增疾病
            </span>
                </div>
                <div class="box-body form">
                    <form action="" method="post">
                        <label>疾病名称</label>
                        <input type="text" name="disname">
                        <label>所属科室</label>
                        <select id="dept" name="dept.id">
                            <c:forEach items="${deptList}" var="dept">
                            <option value="${dept.id}">${dept.deptname}</option>
                            </c:forEach>
                        </select>
                        <div class="form-actions">
                            <button type="submit" id="saveBtn" class="button button-flat-action button-pill">保存</button>
                        </div>
                    </form>
                </div>
            </div>


        </div>

    </div>
</div>



<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugins/jQuery/jquery.validate.min.js"></script>
<script src="/static/plugins/select2/select2.js"></script>
<script>
    $(function () {
            $("#saveBtn").click(function () {
                $("#addForm").submit();
            });
    });
</script>
</body>
</html>
