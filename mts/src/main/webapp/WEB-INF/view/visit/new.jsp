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
    <link rel="stylesheet" href="http://cdn.staticfile.org/webuploader/0.1.1/webuploader.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>

<jsp:include page="../include/navbar.jsp">
    <jsp:param name="menu" value="visit"/>
</jsp:include>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-info"></i>
              患者基本信息
            </span>
                </div>
                <div class="box-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td width="100"><strong>姓名:</strong></td>
                            <td width="300">

                                <input type="text" name="q_s_like_name" id="name" style="margin:0px">

                            </td>
                            <td width="100"><strong>性别:</strong></td>
                            <td width="300" id="sex"></td>
                            <td width="100"><strong>年龄:</strong></td>
                            <td id="age"></td>
                        </tr>
                        <tr>
                            <td><strong>身份证号:</strong></td>
                            <td id="idnum"></td>
                            <td><strong>联系电话:</strong></td>
                            <td id="tel"></td>
                            <td><strong>医保类型:</strong></td>
                            <td id="insurance"></td>
                        </tr>
                        <tr>
                            <td><strong>地址:</strong></td>
                            <td colspan="5" id="address"></td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>过敏史:</strong></td>
                        </tr>
                        <tr>
                            <td colspan="6" id="history">

                            </td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>备注:</strong></td>
                        </tr>
                        <tr>
                            <td colspan="6" id="remark"></td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>
            <!-- box end -->

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i> 病历信息
            </span>
                </div>
                <div class="box-body form">
                    <form action="">
                        <label>科室</label>
                        <select name="" ></select>
                        <label>病种</label>
                        <select name="" ></select>
                        <label>初步诊断</label>
                        <input type="text" class="span12">
                        <label>主要症状</label>
                        <textarea  class="editor1 "></textarea>
                        <label>相关病史</label>
                        <textarea  class="editor2"></textarea>
                        <label>阳性体征</label>
                        <textarea  class="editor3"></textarea>
                        <label>检查结果</label>
                        <textarea  class="editor4"></textarea>
                        <label>治疗方案</label>
                        <textarea  class="editor5"></textarea>
                        <label>管床医生</label>
                        <input type="text">
                        <label>下次复诊时间</label>
                        <input type="text" id="nextTime">
                        <label>影像资料</label>
                        <div id="picker">选择资料</div>
                        <ul id="fileList" class="thumbnails">
                            <li id="WU_FILE_0" class="span2 upload-state-done uploadfile" >
                                <div class="msg">正在上传...</div>
                                <img src="data:image/jpeg;base64,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">

                            </li>
                        </ul>
                        <div class="form-actions">
                            <button class="button button-flat-action button-pill">保存</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>



<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="/static/js/simditor/scripts/js/simditor-all.min.js"></script>
<script src="http://cdn.staticfile.org/select2/3.4.8/select2.min.js"></script>
<script src="http://cdn.staticfile.org/jquery.devbridge-autocomplete/1.2.7/jquery.devbridge-autocomplete.min.js"></script>
<script src="http://cdn.staticfile.org/webuploader/0.1.1/webuploader.min.js"></script>
<script src="http://cdn.staticfile.org/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<script src="http://cdn.staticfile.org/bootstrap-datepicker/1.3.0/js/locales/bootstrap-datepicker.zh-CN.min.js"></script>

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
        var editor3 = new Simditor({
            toolbar:['title','bold','italic','underline','strikethrough','ol','ul','blockquote','table','link','hr','indent','outdent'],
            textarea: $('.editor3')
        });
        var editor4 = new Simditor({
            toolbar:['title','bold','italic','underline','strikethrough','ol','ul','blockquote','table','link','hr','indent','outdent'],
            textarea: $('.editor4')
        });
        var editor5 = new Simditor({
            toolbar:['title','bold','italic','underline','strikethrough','ol','ul','blockquote','table','link','hr','indent','outdent'],
            textarea: $('.editor5')
        });

        //插件地址 http://www.devbridge.com/sourcery/components/jquery-autocomplete/
        $("#name").autocomplete({
            lookup:['java','javascript','alex','jsp']
        });
        var uploader = WebUploader.create({
            swf: 'http://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
            server: 'http://webuploader.duapp.com/server/fileupload.php',
            pick: '#picker',
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });

        $("#nextTime").datepicker({
            format: "yyyy-mm-dd",
            language: "zh-CN",
            autoclose: true
        });

        document.querySelector("[id=name]").onchange = function () {

            var str = this.value;

            $.get("/patient/get",{str:str},function(result){

                if (result!=""){

                    $("#name").val(result.name);
                     $("#sex").html(result.sex);
                    $("#age").html(result.age);
                    $("#tel").html(result.tel);
                    $("#address").html(result.address);
                    $("#idnum").html(result.idnum);
                    $("#history").html(result.allergicHistory);
                    $("#insurance").html(result.insurance.insname);
                    $("#remark").html(result.remark);
                }
            });
        }
    });
</script>

</body>
</html>