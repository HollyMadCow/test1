<%--
  Created by IntelliJ IDEA.
  User: CowBoy
  Date: 2017/2/7
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String clientrequest=(String)request.getAttribute("request");
String id=(String)request.getAttribute("id");
String caseid = (String) request.getAttribute("caseid");
String casename=(String) request.getAttribute("casename");
String casedetail=(String) request.getAttribute("casedetail");
String caseregno =(String) request.getAttribute("caseregno");
String caseregfilename=(String) request.getAttribute("caseregfilename");
String area=(String) request.getAttribute("area");
String caseby=(String) request.getAttribute("caseby");
String officerphone=(String) request.getAttribute("officerphone");
String state=(String) request.getAttribute("state");
String sumbitdate=(String) request.getAttribute("sumbitdate");
String handlesir=(String) request.getAttribute("handlesir");;
String respone=(String) request.getAttribute("respone");
String detailfrom=(String) request.getAttribute("detailfrom");
String sumbitto=(String) request.getAttribute("sumbitto");
String sumbitbyid=(String) request.getAttribute("sumbitbyid");
String host="http://172.16.210.251/uploadimage/";
String usertypefromsession=(String) session.getAttribute("usertype");
String useridfromsession=(String)session.getAttribute("useridfromdatabase");
String areafromsession = (String) session.getAttribute("area");
String departmentfromsess =(String) session.getAttribute("department");


%>


<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/casedetailcss.css">
    <link rel="stylesheet" href="/js/dist/css/lobibox.min.css">
    <link media="all" rel="stylesheet" type="text/css" href="/fileinput/css/fileinput.min.css">

    <script src="/fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
    <script src="/fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
    <script src="/fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>

    <script src="/fileinput/js/fileinput.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/dist/js/lobibox.min.js"></script>
    <script type="text/javascript" src="/js/dist/js/messageboxes.min.js"></script>
    <script type="text/javascript" src="/js/dist/js/notifications.min.js"></script>
    <script src="/fileinput/themes/fa/theme.js"></script>
    <script src="/fileinput/js/locales/zh.js"></script>
    <script src="/js/jquery.form.js"></script>
</head>
<script>
    function in_array(needle, haystack) {
        var i = 0, n = haystack.length;

        for (;i < n;++i)
            if (haystack[i] === needle)
                return true;

        return false;
    }
</script>
<script>
    function listuser() {
        var sumbitto="<%=sumbitto%>";
        var list;
        list="<select name=\"userarea\" size=\"1\" id=\"listuser\">";
        $.get("/servlet/ndp/listuser.do?sumbitto="+sumbitto,function (data) {
                //console.log(eval(data));
                //获取可配侦人员名单，并插入到网页
                var array=eval(data);
                for(var i=0;i<array.length;i++)
                {
                    //console.log(array[i]);
                    for(var k in array[i])
                    {
                        list+="<option value=\""+array[i][k]+"\">"+array[i][k]+"</option>";
                        //console.log(array[i][k]);
                    }
                }
                list+="</select>";


                //console.log(data);
            });
        $( "#statestage5" ).html(list);
        //console.log(list);

    }

</script>
<script>
$(document).ready(function () {
    <%--var caseid="<%=caseid%>";--%>
    var clientrequest=<%=clientrequest%>;
    var id=<%=id%>;
    var state="<%=state%>";
    var sumbitbyid="<%=sumbitbyid%>";
    var area="<%=area%>";
    var sumbitto="<%=sumbitto%>";
    //console.log(sumbitto);
    var usertypefromsess="<%=usertypefromsession%>";
    var useridfromsess="<%=useridfromsession%>";
    var areafromsess="<%=areafromsession%>";
    var departmentfromsess="<%=departmentfromsess%>";
    var s2="";


    if (state==="提交")
    {
        s2="等待办案单位领导审核";
        $( "#casestate" ).html(s2);
        if(area === areafromsess && usertypefromsess==="办案单位审核人员")
        {
            var s3=null;
            s3="<label >办案单位领导审批:</label>"+ "<a>未审核</a>"+
                "&nbsp&nbsp&nbsp"+
                "<a href=\"javascript:void(0)\"  class=\"btn btn-info\" onclick=\"notify(1)\">同意</a>"+
                " &nbsp&nbsp&nbsp"+
                "<a href=\"javascript:void(0)\"  class=\"btn btn-danger\" onclick=\"notify(2)\">通知补充资料</a>";
            $( "#statestage1" ).html(s3);
        }

    }
    if (state==="待受初审")
    {
        s2="等待受理单位初审";
        $( "#casestate" ).html(s2);
        var s3=null;
        s3="<label >办案单位领导审批:</label>"+ "<a>已审核</a>";
        $( "#statestage1" ).html(s3);
        if(sumbitto === areafromsess && usertypefromsess==="受理单位审核人员")
        {

            var s4=null;
            s4="<label >受理单位初审:</label>"+
                "<a>未审核</a>"+
                "&nbsp&nbsp&nbsp"+
                "<a href=\"javascript:void(0)\" class=\"btn btn-info\" onclick=\"notify(3)\">同意</a>"+
                "&nbsp&nbsp&nbsp"+
                "<a href=\"javascript:void(0)\"  class=\"btn btn-danger\" onclick=\"notify(4)\">通知补充资料</a>";
            $( "#statestage2" ).html(s4);

        }


    }
    if (state==="待局审")
    {
        s2="等待局领导审核";
        $( "#casestate" ).html(s2);

        s3="<label >办案单位领导审批:</label>"+ "<a>已审核</a>";
        $( "#statestage1" ).html(s3);
        s4="<label >受理单位领导审批:</label>"+ "<a>已审核</a>";
        $( "#statestage2" ).html(s4);
        var areaarry;
        areaarry=departmentfromsess.split(";");
        console.log(areaarry);
        if (in_array(sumbitto,areaarry) && usertypefromsess ==="局审核人员"){
            var s5="<label >分管领导审核:</label>"+
                "<a>未审核</a>"+
                "&nbsp&nbsp&nbsp"+
                "<a href=\"javascript:void(0)\" class=\"btn btn-info\" onclick=\"notify(5)\">同意</a>"+
                "&nbsp&nbsp&nbsp"+
                "<a href=\"javascript:void(0)\"  class=\"btn btn-danger\" onclick=\"notify(6)\">通知补充资料</a>";
            $( "#statestage3" ).html(s5);
        }




    }
    if (state==="待分民警") {
        s2 = "等待分配到配侦民警";
        $("#casestate").html(s2);
        s3 = "<label >办案单位领导审批:</label>" + "<a>已审核</a>";
        $("#statestage1").html(s3);
        s4 = "<label >受理单位领导审批:</label>" + "<a>已审核</a>";
        $("#statestage2").html(s4);
        s5 = "<label >分管领导审批:</label>" + "<a>已审核</a>";
        $("#statestage3").html(s5);
//        if(sumbitto == areafromsess && usertypefromsess=="受理单位审核人员")
//        {
//
//            var s6="<label >受理单位分配:</label>"+
//                "<a>待分配</a>"+
//                "&nbsp&nbsp&nbsp"+
//                    "<a href=\"javascript:void(0)\" onclick=\"listuser()\" class=\"btn btn-danger\">点击分配</a>";
//            $( "#statestage4" ).html(s6);
//        }
//        console.log(areafromsess);
        var s6;
        if(sumbitto === areafromsess && usertypefromsess ==="受理单位审核人员")
        {


            s6="<label >受理单位分配:</label>"+
                "<a>待分配</a>"+
                "&nbsp&nbsp&nbsp"+
                "<select name=\"userarea\" size=\"1\" id=\"listuser\">";

            $.get("/servlet/ndp/listuser.do?sumbitto="+sumbitto,function (data) {
                //console.log(eval(data));
                //获取可配侦人员名单，并插入到网页
                var array=eval(data);
                for(var i=0;i<array.length;i++)
                {
                    //console.log(array[i]);
                    for(var k in array[i])
                    {
                        s6+="<option value=\""+array[i][k]+"\">"+array[i][k]+"</option>";
                        //console.log(array[i][k]);
                    }
                }
                s6+="</select>";
                s6+="&nbsp&nbsp&nbsp";
                s6+="<a href=\"javascript:void(0)\" class=\"btn btn-danger\" id=\"disbtn\" onclick=\"distribute()\">分配</a>";
                //console.log(s6);

                //console.log(data);
                $( "#statestage4" ).html(s6);
            });




    }


    }
    if (state==="配侦中")
    {
        //var s6;
        s2="正在配侦中";
        $("#casestate").html(s2);
        s3 = "<label >办案单位领导审批:</label>" + "<a>已审核</a>";
        $("#statestage1").html(s3);
        s4 = "<label >受理单位领导审批:</label>" + "<a>已审核</a>";
        $("#statestage2").html(s4);
        s5 = "<label >分管领导审批:</label>" + "<a>已审核</a>";
        $("#statestage3").html(s5);
        $.get("/servlet/ndp/getdissir.do?id="+id,function (data) {
            //var array=data;
            //console.log(data);
            s6="<label >配侦人员分配:</label>" + "<a>已分配给："+data+"</a>";
            $("#statestage4").html(s6);
        });

        if(sumbitto === areafromsess && usertypefromsess ==="受理单位审核人员")
        {
            var s8="<label >人员分配更改:</label>"+
                "&nbsp&nbsp&nbsp"+
                "<select name=\"userarea\" size=\"1\" id=\"listuser\">";

            $.get("/servlet/ndp/listuser.do?sumbitto="+sumbitto,function (data) {
                //console.log(eval(data));
                //获取可配侦人员名单，并插入到网页
                var array=eval(data);
                for(var i=0;i<array.length;i++)
                {
                    //console.log(array[i]);
                    for(var k in array[i])
                    {
                        s8+="<option value=\""+array[i][k]+"\">"+array[i][k]+"</option>";
                        //console.log(array[i][k]);
                    }
                }
                s8+="</select>";
                s8+="&nbsp&nbsp&nbsp";
                s8+="<a href=\"javascript:void(0)\" class=\"btn btn-danger\" id=\"disbtn\" onclick=\"distribute()\">分配</a>";

                $( "#statestage6" ).html(s8);
            });
        }

        if(sumbitto === areafromsess)
        {
            var s7="<label >配侦完毕通知:</label>"+"<a href=\"javascript:void(0)\" class=\"btn btn-danger\" onclick=\"notify(7)\">配侦完毕点击通知侦办民警</a>";
            $("#statestage5").html(s7);
        }
            //console.log(id);

    }

    if (state==="已配侦")
    {
        s2="已配侦，请联系配侦民警。";
        $("#casestate").html(s2);
        s3 = "<label >办案单位领导审批:</label>" + "<a>已审核</a>";
        $("#statestage1").html(s3);
        s4 = "<label >受理单位领导审批:</label>" + "<a>已审核</a>";
        $("#statestage2").html(s4);
        s5 = "<label >分管领导审批:</label>" + "<a>已审核</a>";
        $("#statestage3").html(s5);
        $.get("/servlet/ndp/getdissir.do?id="+id,function (data) {
            //var array=data;
            //console.log(data);
            s6="<label >配侦人员分配:</label>" + "<a>已分配给："+data+"</a>";
            $("#statestage4").html(s6);
        });


    }
//    if (state=="已反馈")
//    {
//        s2="办案单位已反馈";
//
//
//    }
//
//    if (state=="已关闭")
//    {
//        s2="该案件已办结关闭";
//
//
//    }


///输出配侦请求中添加的如QQ等东西
    var s="";
    for(var k in clientrequest) {

        s+="<label>"+k+":</label>"+"<p>"+clientrequest[k]+"</p>";
        console.log(k);
        console.log(clientrequest[k]);

    }
    $( "#workdetail" ).html(s);


})
</script>
<script>
    function distribute() {
        var id=<%=id%>;
        var obj = document.getElementById("listuser");
        //var objbtn = document.getElementById("disbtn");
//        document.getElementById("disbtn").disabled=true;
        var index = obj.selectedIndex;
        var value = obj.options[index].value;
        $.get("/servlet/ndp/distributecase.do?id="+id+"&handlesir="+value,function (data) {
            //var array=data;
            //console.log(data);
            console.log(id);
            console.log(value);
            alert("已经分配");
            window.location.reload();
            //document.getElementById("disbtn").style.display="none";

//            console.log(data);
        });


    }
</script>
<script>
    function notify(n) {
        var s="/servlet/ndp/notify.do?state="+n;
//            $.get("/servlet/ndp/mybusiness.do?page=1&rows=20",function (data) {
        $.get(s,function (data) {
            window.location.reload();
            //console.log(data);
            //$("#mainboard").load("/pki/business.jsp",{"listcase":data,"page":p});
            //console.log(data);
        });
        <%--$( "#mainboard" ).load("/pki/business.jsp",{"userid":'<%=userid%>'});--%>

    }
</script>
<body>

<%--<form id="showcasedetail" method="post" action="" onsubmit="">--%>
<form id="showcasedetail">
    <fieldset>
        <legend>案件信息:</legend>
        <ol id="caseinfo">
            <li>
                <%--<label for="caseid">案件编号：</label>--%>
                <label>案件编号：</label>
                <p><%=caseid%></p>
                <%--<input id="caseid" name="caseid" type="text" value="<%=caseid%>" readonly>--%>
            </li>
            <li>
                <%--<label for="casename">案件名称:</label>--%>
                <label>案件名称:</label>
                    <p><%=casename%></p>
                <%--<input id="casename" name="casename" type="text" value="<%=casename%>" readonly>--%>
            </li>
            <li>
                <%--<label for="casedetail">简要案情:</label>--%>
                <label>简要案情:</label>
                    <p><%=casedetail%></p>
                <%--<textarea id="casedetail" cols="50" name="casedetail" rows="10"  readonly><%=casedetail%></textarea>--%>
            </li>
            <li>
                <label>立案决定书：</label>
                <%--<p><%=caseregno%></p>--%>
                <%--<label for="caseregno">立案决定书：</label>--%>
                <%--<input id="caseregno" name="caseregno" type="text" value="<%=caseregno%>" readonly>--%>
                <%--<a href="<%=host%><%=caseregfilename%>" id="caseregnofile" class="btn btn-info" target="_blank">点击查看文书</a>--%>
                <a href="<%=host%><%=caseregfilename%>" target="_blank"><%=caseregno%></a>
            </li>
            <%--<li>--%>
                <%--<label for="caseregfile">上传文书:</label>--%>
                <%--&lt;%&ndash;<label>上传文书:</label>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<input id="caseregfile" type="file" class="file-loading" multiple accept="image/*" required>&ndash;%&gt;--%>
                <%--<input id="caseregfile"  name="caseregfile" type="file" data-show-caption="true" multiple accept="image/*">--%>
                <%--&lt;%&ndash;<input type="file" data-show-caption="true" multiple accept="image/*">&ndash;%&gt;--%>
                <%--<input type="text" style="visibility: hidden" id="caseregfilename" name="caseregfilename">--%>

            <%--</li>--%>

        </ol>
    </fieldset>
    <fieldset>
        <legend>配侦详情:</legend>
        <%--<button type="button" class="center-block" id="morerequest" onclick="add()">添加配侦内容</button>--%>
        <%--<a href="#" id="morerequest" class="btn btn-info">添加配侦线索</a></span></p><p style="color: red">最多添加10个</p>--%>
        <ol>
            <li id="workdetail">

            </li>
        </ol>

    </fieldset>
    <fieldset>
        <legend>线索来源:</legend>
        <ol>
            <li>
                <label>线索来源:</label>
                <p><%=casedetail%></p>
                <%--<label for="detailfrom">线索来源:</label>--%>
                <%--<textarea id="detailfrom" cols="50" readonly name="detailfrom" rows="3"><%=casedetail%></textarea>--%>

            </li>
        </ol>
    </fieldset>
    <fieldset>
        <legend>受理配侦单位:</legend>
        <ol>
            <li>
                <label>受理配侦单位:</label>
                <p><%=sumbitto%></p>
                <%--<label for="sumbittodepartment">受理配侦单位:</label>--%>
                <%--<textarea id="sumbittodepartment" cols="50" readonly name="sumbittodepartment" rows="3"><%=sumbitto%></textarea>--%>

            </li>
        </ol>
    </fieldset>
    <fieldset>
        <legend>单位信息:</legend>
        <ol>
            <li>
                <label for="station">所属分局：</label>
                <%--<label for="station">所属分局：</label>--%>
                <%--<select name="station" id="station" size="1" required>--%>
                <select name="station" id="station" size="1" required>
                    <option value="玉环市公安局">玉环市公安局</option>
                </select>
                <%--<textarea id="address" name="address" rows="1" required></textarea>--%>
            </li>
            <li>
                <label>所属单位：</label>
                <p><%=area%></p>
                <%--<textarea id="address" name="address" rows="1" required></textarea>--%>
            </li>

        </ol>
    </fieldset>
    <fieldset>
        <legend>经办信息:</legend>
        <ol>

            <li>
                <label>经办民警:</label>
                <p><%=caseby%></p>
                <%--<label for="caseby">经办民警:</label>--%>
                <%--<input id="caseby" name="caseby" type="text" readonly value="<%=caseby%>" >--%>
            </li>
            <li>
                <label>民警电话:</label>
                <p><%=officerphone%></p>
                <%--<label for="officerphone">民警电话:</label>--%>
                <%--<input id="officerphone" name="caseby" type="text" readonly value="<%=officerphone%>" >--%>
            </li>

        </ol>
    </fieldset>
    <fieldset>
        <legend>案件状态：</legend>
        <ol>
            <li>
                <label>审批状态:</label>
                <a id="casestate"><%=state%></a>
            </li>
            <li id="statestage1">

            </li>
            <li id="statestage2">

            </li>
            <li id="statestage3">

            </li>
            <li id="statestage4">

            </li>
            <li id="statestage5">

            </li>
            <li id="statestage6">

            </li>
            <li id="statestage7">

            </li>
            <li>
                <label for="accesscode">审批码:</label>
                <input id="accesscode" name="accesscode" type="text" placeholder="输入4位授权码" >
                <a href="javascript:void(0)" class="btn btn-info">应用授权码</a>
                <p style="color: red">在每一级的审核中，都会有一个相应授权码发送到该次审核人员处</p>
            </li>
        </ol>
    </fieldset>
    <fieldset>
        <%--<button type="button" class="center-block">提交案件</button>--%>
            <%--&nbsp&nbsp&nbsp--%>
            <%--<a href="javascript:void(0)" disabled="true" class="btn btn-info">同意</a>--%>
            <%--&nbsp&nbsp&nbsp--%>
            <%--<a href="javascript:void(0)" disabled="true" class="btn btn-danger">退回补充资料</a>--%>
    </fieldset>
</form>

</body>
</html>
