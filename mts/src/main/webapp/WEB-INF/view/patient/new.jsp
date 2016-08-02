<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/js/simditor/styles/simditor.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/select2/3.4.8/select2.css">
    <link rel="stylesheet" href="/static/css/style.css">
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
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="patient-list.html"> 患者列表</a>  /  新增患者
            </span>
                </div>
                <div class="box-body form">
                    <form method="post" id="newPatientForm">
                        <label><strong>姓名:</strong></label>
                        <input type="text" name="name" id="name">
                        <label><strong>性别:</strong></label>
                        <select name="sex" id="sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <label><strong>身份证号:</strong></label>
                        <input type="text" name="idnum" id="idnum">
                        <label><strong>年龄:</strong></label>
                        <input type="text" name="age" id="age">
                        <label><strong>电话:</strong></label>
                        <input type="text" name="tel" id="tel">
                        <label><strong>医保类型:</strong></label>
                        <select name="insurance.id" id="yb">
                            <option value="">无</option>
                            <option value="2">市医保</option>
                            <option value="1">新农合</option>
                        </select>
                        <label><strong>住址:</strong></label>
                        <input type="text" name="address" id="address">
                        <label><strong>过敏史:</strong></label>
                        <textarea  class="editor1" style="height:50px" name="allergicHistory" id="allergicHistory"></textarea>
                        <label><strong>备注:</strong></label>
                        <textarea  class="editor2" name="remark" id="remark"></textarea>
                        <div class="form-actions">
                            <button class="button button-flat-action button-pill" id="saveBtn">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- jQuery 2.2.0 -->
<script src="/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/js/simditor/scripts/js/simditor-all.min.js"></script>
<script src="http://cdn.staticfile.org/select2/3.4.8/select2.min.js"></script>
<script src="/static/plugins/moment/moment.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.min.js"></script>
<script>
    $(function(){

        var editor = new Simditor({
            toolbar:['title','bold','italic','underline','strikethrough','ol','ul','blockquote','table','link','hr','indent','outdent'],
            textarea: $('.editor1')
        });
        var editor2 = new Simditor({
            toolbar:['title','bold','italic','underline','strikethrough','ol','ul','blockquote','table','link','hr','indent','outdent'],
            textarea: $('.editor2')
        });
        $("#yb").select2({
            placeholder: "请选择医保类型",
            width:'220px'
        });

        $("#saveBtn").click(function(){

            $("#newPatientForm").submit();
        });
        $("#newPatientForm").validate({
            errorElement: 'span',
            errorClass: 'text-danger',
            rules: {
                name: {
                    required: true
                },
                idnum: {
                    required: true,
                    rangelength:[18,18]
                },
                tel: {
                    required: true
                },
                address: {
                    required: true
                }
            },
            messages: {
                name: {
                    required: "*请输入病人姓名"
                },
                idnum: {
                    required: "*请输入病人身份证号码",
                    rangelength:"*身份证长度为18位"
                },
                tel: {
                    required: "*请输入病人联系电话"
                },
                address: {
                    required: "*请输入病人居住地址"
                }
            }
        });


        document.querySelector("[name=idnum]").onchange = function () {
            var num = this.value;

            $.get("/patient/getAge",{num:num},function(result){
                if (result!=""){

                    $("#age").val(moment(result, "YYYYMMDD").fromNow().substring(0,2));
                }
            });
        }
    });
</script>

</body>
</html>