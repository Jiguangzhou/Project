<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/datatables/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">修改密码</h3>
        </div>
        <div class="box-body">
            <form method="post" id="changePasswordForm">
                <div class="form-group">
                    <lable>旧密码</lable>
                    <input type="password" class="form-control" name="oldpassword">
                </div>
                <div class="form-group">
                    <lable>新密码</lable>
                    <input type="password" class="form-control" name="newpassword" id="newpassword">
                </div>
                <div class="form-group">
                    <lable>确认新密码</lable>
                    <input type="password" class="form-control" name="replypassword">
                </div>
            </form>
        </div>
        <div class="box-footer">
            <button id="saveBtn" class="btn btn-primary pull-right">保存</button>
        </div>
    </div>

<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugins/jQuery/jquery.validate.min.js"></script>
<script>
    $(function () {

        $("#changePasswordForm").validate({
            errorClass:"text-danger",
            errorElement:"span",
            rules:{
                oldpassword:{
                    required:true,
                    remote:"/user/validate/password"
                },
                newpassword:{
                    required:true,
                    rangelength:[6,18]
                },
                replypassword:{
                    required:true,
                    rangelength:[6,18],
                    equalTo:"#newpassword"
                }
            },
            messages:{
                oldpassword:{
                    required:"请输入旧密码",
                    remote:"旧密码错误"
                },
                newpassword:{
                    required:"请输入新密码",
                    rangelength:"新密码长度为6-18位"
                },
                replypassword:{
                    required:"请再次输入新密码",
                    rangelength:"新密码长度为6-18位",
                    equalTo:"两次输入的密码不一致"
                }
            },
            submitHandler: function (form) {
                var password = $("#newpassword").val();
                $.post("/user/password",{"password":password}).done(function (data) {
                    if (data == "success"){
                        alert("密码修改成功,点击确定重新登录");
                        window.location.href = "/";
                    }
                }).fail(function () {
                    alert("服务器异常");
                });
            }
        });
        $("#saveBtn").click(function () {
            $("#changePasswordForm").submit();
        });
    });
</script>

</body>
</html>
