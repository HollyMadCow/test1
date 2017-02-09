<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="X-UA-Compatible" content="IE=9" />


<%
    String userid = (String) session.getAttribute("userid");
%>
<html>
<style type="text/css">
    select#state {
        height: 25px;
    }
    select#usertype {
        height: 25px;
    }
</style>
<%--<script>--%>
    <%--$(document).ready(function () {--%>
        <%--alert("ok,<%=userid%>");--%>
    <%--})--%>
<%--</script>--%>

<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <lengend>过滤项目：</lengend>
            <ol>
                <li>
                    <label >案件状态:</label>
                    <select name="state" id="state" size="1" required>
                        <option value="1">办案民警</option>
                        <option value="2">办案单位审批人员</option>
                        <option value="3">网警配侦审批人员</option>
                        <option value="4">网警配侦人员</option>
                        <option value="5">局审批人员</option>
                    </select>
                    <label >简要案情:</label>
                    <select name="usertype" id="usertype" size="1" required>
                        <option value="1">办案民警</option>
                        <option value="2">办案单位审批人员</option>
                        <option value="3">网警配侦审批人员</option>
                        <option value="4">网警配侦人员</option>
                        <option value="5">局审批人员</option>
                    </select>
                </li>


            </ol>

        </div>
    </div>
</div>

<table class="table">
    <%--<caption>上下文表格布局</caption>--%>
    <thead>
    <tr>
        <%--<th style="text-align: center">案件编号</th>--%>
        <%--<th style="text-align: center">案件名称</th>--%>
        <%--<th style="text-align: center">办案人员</th>--%>
        <%--<th style="text-align: center">侦办单位</th>--%>
        <%--<th style="text-align: center">日    期</th>--%>
        <%--<th style="text-align: center">详    情</th>--%>
            <th>案件编号</th>
            <th>案件名称</th>
            <th>办案人员</th>
            <th>侦办单位</th>
            <th>提交日期</th>
            <th>案件详情</th>
    </tr>
    </thead>
    <tbody>
    <tr class="active">

        <td>23/11/2手动阀手动阀手动阀手动阀手动阀是013</td>
        <td>待发货梵蒂冈地方官地方的官方的</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="javascript:void(0)" onclick="mybusiness()">详细</a></td>
        <%--<td><button type="button" class="btn btn-default">详情</button></td>--%>

    </tr>
    <tr class="success">
        <td>产品2</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="warning">
        <td>产品3</td>
        <td>20/10/2013</td>
        <td>待确认</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
    </tr>
    <tr  class="danger">
        <td>产品4</td>
        <td>20/10/2013</td>
        <td>已退货</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
    </tr>
    <tr  class="danger">
        <td>产品4</td>
        <td>20/10/2013</td>
        <td>已退货</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
    </tr>
    <tr  class="danger">
        <td>产品4</td>
        <td>20/10/2013</td>
        <td>已退货</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
    </tr>
    <tr  class="danger">
        <td>产品4</td>
        <td>20/10/2013</td>
        <td>已退货</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
    </tr>
    <tr  class="danger">
        <td>产品4</td>
        <td>20/10/2013</td>
        <td>已退货</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
    </tr>
    </tbody>
</table>

<nav style="text-align: center">
    <ul class="pagination" >
        <li ><a href="#">&laquo;</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
    </ul>
</nav>
</body>
</html>