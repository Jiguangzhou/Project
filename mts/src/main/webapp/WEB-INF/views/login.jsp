<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录系统</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="container">

    <div class="login_warper">
        <c:if test="${not empty message}">
            <c:choose>
                <c:when test="${message.state == 'success'}">
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                            ${message.message}
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                            ${message.message}
                    </div>
                </c:otherwise>
            </c:choose>

        </c:if>
        <form action="/" method="post" id="login">
            <legend>KaiShengIT</legend>
            <label>账号</label>
            <input type="text" class="form-control" name="username" autofocus placeholder="请输入账号">
            <label>密码</label>
            <input type="password" class="form-control" name="password" placeholder="请输入密码">
            <div class="form-actions">
                <button type="submit" class="button button-flat-action" id="Btn">进入系统</button>
            </div>
        </form>
    </div>

</div>


<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script>
    $(function () {
    $("#Btn").click(function () {
        $("#login").submit();
    });
    });
</script>

</body>
</html>