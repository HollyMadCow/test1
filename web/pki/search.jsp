<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%
    String keyword = request.getParameter("return");

%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script>
        function searchdetail() {
//        $( "#mainboard" ).load( "business.jsp");
            window.open("searchdetail.jsp");
        }
    </script>
</head>
<body>

<table class="table">
    <%--<caption>上下文表格布局</caption>--%>
    <thead>
    <tr>
        <th>案件编号</th>
        <th>案件名称</th>
        <th>办案人员</th>
        <th>侦办单位</th>
        <th>日    期</th>
        <th>详    情</th>
    </tr>
    </thead>
    <tbody>
    <tr class="active">
        <td><%=keyword%></td>
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
