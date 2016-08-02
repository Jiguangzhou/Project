<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <jsp:param name="menu" value="visit"/>
</jsp:include>
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
                        <li><a href="new-patient.html"><i class="fa fa-file-word-o"></i> 导出</a></li>
                        <li><a href="new-patient.html"><i class="fa fa-smile-o"></i> 出院</a></li>
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

            <div class="box form">
                <div class="box-header">
                    <span class="title"><i class="fa fa-stethoscope"></i> 病情简介</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="new-patient.html"><i class="fa fa-edit"></i> 修改</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <tr>
                            <td width="100"><strong>科室</strong></td>
                            <td width="300">内科</td>
                            <td width="100"><strong>病种</strong></td>
                            <td width="100">流感</td>
                            <td width="100"><strong>管床医生</strong></td>
                            <td width="300">艾莉婕</td>
                            <td width="100"><strong>创建时间</strong></td>
                            <td>2014-07-10</td>
                        </tr>
                        <tr>
                            <td><strong>初步诊断</strong></td>
                            <td colspan="7">着凉引起的流行性感冒</td>
                        </tr>
                        <tr>
                            <td colspan="8">相关病史</td>
                        </tr>
                        <tr>
                            <td colspan="8"></td>
                        </tr>
                        <tr>
                            <td colspan="8">下次复诊时间</td>
                        </tr>
                        <tr>
                            <td colspan="8">2014-08-01</td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-building"></i> 就诊记录</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="new-patient.html"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body form">

                    <div class="box">
                        <div class="box-header">
                            <span class="title"><i class="fa fa-calendar"></i> 2014-07-11</span>
                            <ul class="unstyled inline pull-right">
                                <li><a href="new-patient.html"><i class="fa fa-edit"></i> 修改</a></li>
                                <li><a href="new-patient.html"><i class="fa fa-times"></i> 删除</a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <table class="table">
                                <tr>
                                    <td>主要症状</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>治疗方案</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>阳性体征</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>检查结果</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>影像资料</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- N次就诊记录end -->
                    <div class="box">
                        <div class="box-header">
                            <span class="title"><i class="fa fa-calendar"></i> 2014-07-18</span>
                            <ul class="unstyled inline pull-right">
                                <li><a href="new-patient.html"><i class="fa fa-edit"></i> 修改</a></li>
                                <li><a href="new-patient.html"><i class="fa fa-times"></i> 删除</a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <table class="table">
                                <tr>
                                    <td>主要症状</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>治疗方案</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>阳性体征</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>检查结果</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>影像资料</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- N次就诊记录end -->
                    <div class="box">
                        <div class="box-header">
                            <span class="title"><i class="fa fa-calendar"></i> 2014-07-27</span>
                            <ul class="unstyled inline pull-right">
                                <li><a href="new-patient.html"><i class="fa fa-edit"></i> 修改</a></li>
                                <li><a href="new-patient.html"><i class="fa fa-times"></i> 删除</a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <table class="table">
                                <tr>
                                    <td>主要症状</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>治疗方案</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>阳性体征</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>检查结果</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>影像资料</td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- N次就诊记录end -->

                </div>
            </div>
            <!-- box end -->
        </div>

    </div>
</div>



</body>
</html>