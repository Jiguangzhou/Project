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
              <a href=""> 系统账户列表</a>  /  新增账号
            </span>
                </div>
                <div class="box-body form">
                    <form action="" method="post" id="addForm">
                        <label>员工姓名</label>
                        <input type="text" id="name" name="realname">
                        <label>账号 <span class="muted">(用于登录系统)</span></label>
                        <input type="text" id="account" name="username">
                        <label>密码 <span class="muted">(默认123456)</span></label>
                        <input type="text" id="password" class="form-control" name="password" value="123456">
                        <label>联系电话</label>
                        <input type="text" id="tel" name="tel">
                        <label>请选择角色</label>
                        <select class="form-control" name="role.id">
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.id}">${role.rolename}</option>
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
<script>
        //添加用户
        $("#addForm").validate({
            errorClass:"text-danger",
            errorElement:"span",
            rules:{
                username:{
                    required:true,
                    rangelength:[3,20],
                    remote:"/admin/user/checkusername"
                },
                password:{
                    required:true,
                    rangelength:[6,18]
                },
                realname:{
                    required:true,
                    rangelength:[2,20]
                },
                tel:{
                    required:true,
                    rangelength:[7,20]
                }
            },
            messages:{
                username:{
                    required:"请输入账号",
                    rangelength:"账号长度3-20位",
                    remote:"该账号已被占用"
                },
                password:{
                    required:"请输入密码",
                    rangelength:"密码长度6-18位"
                },
                realname:{
                    required:"请输入姓名",
                    rangelength:"姓名长度2-20位"
                },
                tel:{
                    required:"请输入电话",
                    rangelength:"电话长度7-20位"
                }
            }
        });
    $(function () {
        $("#saveBtn").click(function () {
            $("#addForm").submit();
        });
    });
</script>
</body>
</html>
