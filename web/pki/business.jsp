<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%
    String userid = (String) session.getAttribute("userid");
    String list=(String) request.getParameter("listcase");
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
<script>
    var formatDate = function (date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? '0' + m : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        return y + '-' + m + '-' + d;
    };
</script>
    <script>
        $(document).ready(function () {
           var listcase=<%=list%>;
           var casecount=listcase.count;
           var casedata = listcase.data;
           var id;
           var caseid;
           var casename;
           var sumbitdate;
           var area;
           var caseby;
           var state;
           var s;

           for(var i in casedata){
                id=casedata[i].id;
                var num=parseInt(i)+1;
                caseid=casedata[i].caseid;
                casename=casedata[i].casename;
                sumbitdate=casedata[i].sumbitdate;
//               var d = new Date(Date.parse(sumbitdate.replace(/-/g, "/")));
//               var d1=formatDate(d);
//               console.log(d1);
//                var d=  (new Date(sumbitdate)).getTime();
              // var time2 = new Date().format("yyyy-MM-dd");
              // console.log(time2);
                area=casedata[i].area;
                caseby=casedata[i].caseby;
                state=casedata[i].state
                s+="<tr class=\"active\">"+
                    "<td><input type=\"checkbox\"> </td>"+
                    "<td>"+num+"</td>"+
                    "<td>"+caseid+"</td>"+
                    "<td>"+casename+"</td>"+
                    "<td>"+caseby+"</td>"+
                    "<td>"+area+"</td>"+
                    "<td>"+sumbitdate+"</td>"+
                    "<td><a href=\"/pki/casedetail.jsp?id=" +id+" \"target=\"_blank\">详细</a></td>"+
                   "</tr>"

               //alert(casedata[i].area)
           }
            $( "#casebody" ).html(s);
           //console.log(casedata);
        });
    </script>
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

            <%--<th>案件编号</th>--%>
            <%--<th>案件名称</th>--%>
            <%--<th>办案人员</th>--%>
            <%--<th>侦办单位</th>--%>
            <%--<th>提交日期</th>--%>
            <%--<th>案件详情</th>--%>
            <td width="5%" align="left">选择</td>
            <td width="5%" align="left">序号</td>
            <td width="20%" align="left">案件编号</td>
            <td width="30%" align="left">案件名称</td>
            <td width="10%" >办案人员</td>
            <td width="15%" align="left">侦办单位</td>
            <td width="10%" align="left">提交日期</td>
            <td width="5%" align="left">详情</td>
    </tr>
    </thead>
    <tbody id="casebody">
    <tr class="active">
        <td><input type="checkbox"> </td>
        <td>1</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="javascript:void(0)" target="_blank">详细</a></td>
        <%--<td><button type="button" class="btn btn-default">详情</button></td>--%>

    </tr>
    <tr class="success">
        <td><input type="checkbox"> </td>
        <td>1</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="warning">
        <td><input type="checkbox"> </td>
        <td>3</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="danger">
        <td><input type="checkbox"> </td>
        <td>4</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="danger">
        <td><input type="checkbox"> </td>
        <td>1</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="danger">
        <td><input type="checkbox"> </td>
        <td>12</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="danger">
        <td><input type="checkbox"> </td>
        <td>13</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    <tr  class="danger">
        <td><input type="checkbox"> </td>
        <td>31</td>
        <td>10/11/2013</td>
        <td>发货中</td>
        <td>待发货</td>
        <td>待发货</td>
        <td>待发货</td>
        <td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>
    </tr>
    </tbody>
</table>

<nav style="text-align: center">
    <ul class="pagination" >
        <li ><a href="#">&laquo;</a></li>
        <li class="active"><a>1</a></li>
        <li><a>2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
    </ul>
</nav>
</body>
</html>