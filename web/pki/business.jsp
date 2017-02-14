<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%
    String userid = (String) session.getAttribute("userid");
    String list=(String) request.getParameter("listcase");
    String p=request.getParameter("page");
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
           var p=<%=p%>;
           var casecount=parseInt(listcase.count) ;
           var casedata = listcase.data;
           var id;
           var caseid;
           var casename;
           var sumbitdate;
           var area;
           var caseby;
           var state;
           var maxpagenum;
//           var request;
           var s=null;
//           var s1=null;
           var s1;
//           var sstart=null;
           var sstart;
//           var send=null;
           var send;
           var sbody="";
//            var sbody
           if (casecount<20){
               maxpagenum=1;
           }
           else if (casecount>20 && casecount/20==0)
           {
                maxpagenum= parseInt(casecount/20);
           }
           else if (casecount>20 && casecount/20!=0){
               maxpagenum=parseInt(casecount/20)+1;
           }
            sstart="<li ><a href=\"javascript:void(0)\" onclick=\"mybusiness(1)\">&laquo;</a></li>";
           send="<li><a href=\"javascript:void(0)\" onclick=\"mybusiness("+maxpagenum+")\">&raquo;</a></li>";
           for (var m=1;m<maxpagenum+1;m++)
           {
               if(m==parseInt(p))
               {
                   sbody+="<li class=\"active\"><a>"+m+"</a></li>";
               }
               else {
                   sbody+="<li><a href=\"javascript:void(0)\" onclick=\"mybusiness("+m+")\">"+m+"</a></li>";
               }

           }
           s1=sstart+sbody+send;
            //console.log(s1);
           //console.log(sstart);
           //console.log(sbody);
           //console.log(send);

           for(var i in casedata){
                id=casedata[i].id;
               var num;
                if(parseInt(p)==1)
                {
                    num=parseInt(i)+1;
                }
                if (parseInt(p)>1)
                {
                    num=parseInt(i)+1+(parseInt(p)-1)*20;
                }

                caseid=casedata[i].caseid;
                casename=casedata[i].casename;
                sumbitdate=casedata[i].sumbitdate;
//                request=casedata[i].request;
               var d = new Date(Date.parse(sumbitdate.replace(/-/g, "/")));

               var d1=formatDate(d);
//               console.log(d1);
//                var d=  (new Date(sumbitdate)).getTime();
              // var time2 = new Date().format("yyyy-MM-dd");
              // console.log(time2);
                area=casedata[i].area;
                caseby=casedata[i].caseby;
                state=casedata[i].state;
                s+="<tr class=\"active\">"+
                    "<td><input type=\"checkbox\"></td>"+
                    "<td>"+num+"</td>"+
                    "<td>"+caseid+"</td>"+
                    "<td>"+casename+"</td>"+
                    "<td>"+caseby+"</td>"+
                    "<td>"+area+"</td>"+
                    "<td>"+d1+"</td>"+
                    "<td>"+state+"</td>"+
//                    "<td><a href=\"/pki/casedetail.jsp?id=" +id+" \" target=\"_blank\">详细</a></td>"+
                    "<td><a href=\"/servlet/ndp/casedetail.do?id=" +id+" \" target=\"_blank\">详细</a></td>"+
                   "</tr>"

               //alert(casedata[i].area)
           }
            $( "#casebody" ).html(s);
            $( "#splitpage" ).html(s1);
            console.log(s1);
//            console.log(request.replace("\\",""));
           //console.log(casedata);
        });
    </script>
</head>
<body>
<%--<div class="container">--%>
    <%--<div class="row clearfix">--%>
        <%--<div class="col-md-12 column">--%>
            <%--<fieldset>--%>
                <%--<legend>过滤项目：</legend>--%>
                <%--<ol>--%>
                    <%--<li>--%>
                        <%--<label >案件状态:</label>--%>
                        <%--<select name="state" id="state" size="1"  required>--%>
                            <%--<option value="1">办案民警</option>--%>
                            <%--<option value="2">办案单位审批人员</option>--%>
                            <%--<option value="3">网警配侦审批人员</option>--%>
                            <%--<option value="4">网警配侦人员</option>--%>
                            <%--<option value="5">局审批人员</option>--%>
                        <%--</select>--%>
                        <%--<label >简要案情:</label>--%>
                        <%--<select name="usertype" id="usertype" size="1" required>--%>
                            <%--<option value="1">办案民警</option>--%>
                            <%--<option value="2">办案单位审批人员</option>--%>
                            <%--<option value="3">网警配侦审批人员</option>--%>
                            <%--<option value="4">网警配侦人员</option>--%>
                            <%--<option value="5">局审批人员</option>--%>
                        <%--</select>--%>
                    <%--</li>--%>


                <%--</ol>--%>
            <%--</fieldset>--%>


        <%--</div>--%>
    <%--</div>--%>
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
            <td width="25%" align="left">案件名称</td>
            <td width="10%" >办案人员</td>
            <td width="10%" align="left">侦办单位</td>
            <td width="10%" align="left">提交日期</td>
            <td width="10%" align="left">案件状态</td>
            <td width="5%" align="left">详情</td>
    </tr>
    </thead>
    <tbody id="casebody">
    <%--<tr class="active">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>1</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="javascript:void(0)" target="_blank">详细</a></td>--%>
        <%--&lt;%&ndash;<td><button type="button" class="btn btn-default">详情</button></td>&ndash;%&gt;--%>

    <%--</tr>--%>
    <%--<tr class="success">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>1</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    <%--<tr  class="warning">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>3</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    <%--<tr  class="danger">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>4</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    <%--<tr  class="danger">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>1</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    <%--<tr  class="danger">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>12</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    <%--<tr  class="danger">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>13</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    <%--<tr  class="danger">--%>
        <%--<td><input type="checkbox"> </td>--%>
        <%--<td>31</td>--%>
        <%--<td>10/11/2013</td>--%>
        <%--<td>发货中</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td>待发货</td>--%>
        <%--<td><a href="/pki/casedetail.jsp" target="_blank">详细</a></td>--%>
    <%--</tr>--%>
    </tbody>
</table>

<nav style="text-align: center">
    <ul class="pagination" id="splitpage">
        <%--<li ><a href="#" onclick="mybusiness(1)">&laquo;</a></li>--%>
        <%--<li class="active"><a>1</a></li>--%>
        <%--<li><a>2</a></li>--%>
        <%--<li><a href="#">3</a></li>--%>
        <%--<li><a href="#">4</a></li>--%>
        <%--<li><a href="#">5</a></li>--%>
        <%--<li><a href="#" onclick="mybusiness()">&raquo;</a></li>--%>
    </ul>
</nav>
</body>
</html>