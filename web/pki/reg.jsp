<!DOCTYPE html>
<html lang="cn">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String listdata = request.getParameter("listdata");
    String regname = (String) session.getAttribute("userrealnamefromkey");
    String reguserid = (String) session.getAttribute("userid");
    String userarea = (String) session.getAttribute("area");

%>


<head>
    <title>注册页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/regcss.css">
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <script>
        $(document).ready(function () {
           <%--// console.log(<%=listdata%>);--%>
            var s=null;
            var s1=null;
            var s2=null;
            var obj=<%=listdata%>;
            var userarea="<%=userarea%>";
///           var arealist=obj.arealist;
            var arealistarray=obj.arealist.split(";");
            //console.log(arealistarray);
            //alert(arealistarray.length);
            var stationlist=obj.stationlist.split(";");

            var usertypelist=obj.usertypelist.split(";");
            $("#name").val("<%=regname%>");
            $("#userid").val("<%=reguserid%>");

            for(var i=0;i<arealistarray.length;i++)
            {
                if(arealistarray[i]==userarea)
                {
                    s+="<option value=\""+ arealistarray[i] + "\" selected = \"selected\">"+ arealistarray[i]+ "</option>";
//                    console.log(s)
                }
                else
                {
                    s+="<option value=\""+ arealistarray[i] + "\">"+ arealistarray[i]+ "</option>";
                }
//                s+='<option value="'+arealistarray[i] +'">网警大队</option>'

            }
            for(var i=0;i<stationlist.length;i++)
            {
//                s+='<option value="'+arealistarray[i] +'">网警大队</option>'
                s2+="<option value=\""+ stationlist[i] + "\">"+ stationlist[i]+ "</option>";
            }

            for(var i=0;i<usertypelist.length;i++)
            {
//                s+='<option value="'+arealistarray[i] +'">网警大队</option>'
                s1+="<option value=\""+ i+ "\">"+ usertypelist[i]+ "</option>";
            }
            $( "#area" ).html(s);
            $( "#usertype" ).html(s1);
            $( "#station" ).html(s2);
            <%--var returnlistdata=<%=listdata%>;--%>



            //alert(list);
        });



    </script>
    <%--<script>--%>
<%--//        function sumbit() {--%>
<%--//            alert("hello");--%>
<%--////            var ui =document.getElementById("usernametext");--%>
<%--////            ui.style.display="";//display为空的话会好使，为block会使后边的空间换行--%>
<%--//        }--%>
<%--//    </script>--%>
    <%--<script type="text/javascript">--%>
        <%--window.onload=function () {--%>
            <%--var ui=document.getElementById("usernametext");--%>
            <%--ui.style.display="none";--%>
        <%--}--%>
    <%--</script>--%>
</head>
<body>
<form id="payment" method="post">
    <fieldset>
        <legend>初次使用信息注册</legend>
        <ol>
            <li>
                <label for="name">用户姓名：</label>
                <input id="name" name="name" type="text" placeholder="请输入姓名"  required autofocus>
            </li>
            <li>
                <label for="userid">身份证号：</label>
                <input id="userid" name="userid" type="text" placeholder="例：331021***"  required>
            </li>
            <li>
                <label for="policedid">警  号：</label>
                <input id="policedid" name="policedid" type="text" placeholder="例：33170531" required>
            </li>
            <li>
                <label for="email">邮件地址：</label>
                <input id="email" name="email" type="email" placeholder="例：example@tzs.zj" required>
            </li>
            <li>
                <label for="longnum">长    号：</label>
                <input id="longnum" name="longnum" type="tel" placeholder="例：139***" required>
            </li>
            <li>
                <label for="shortnum">短    号：</label>
                <input id="shortnum" name="shortnum" type="tel" placeholder="例：646110" required>
            </li>
            <%--<li id="usernametext">--%>
                <%--<label for="username">用户名：</label>--%>
                <%--<input id="username" name="username" type="text" placeholder="例：646110" required>--%>
            <%--</li>--%>
        </ol>
    </fieldset>
    <fieldset>
        <legend>单位信息：</legend>
        <ol>
            <li>
                <label for="station">所属分局：</label>
                <select name="station" id="station" size="1" required>
                    <option value="玉环市公安局">玉环市公安局</option>

                </select>
                <%--<textarea id="address" name="address" rows="1" required></textarea>--%>
            </li>
            <li>
                <label for="area">所属单位：</label>
                <select name="area" id="area" size="1" required>
                    <%--<option value="网警大队">网警大队</option>--%>
                    <%--<option value="玉城派出所">玉城派出所</option>--%>
                    <%--<option value="坎门派出所">坎门派出所</option>--%>
                    <%--<option value="楚门派出所">楚门派出所</option>--%>
                    <%--<option value="清港派出所">清港派出所</option>--%>
                    <%--<option value="新城派出所">新城派出所</option>--%>
                    <%--<option value="沙门派出所">沙门派出所</option>--%>
                    <%--<option value="坎门边防派出所">坎门边防派出所</option>--%>
                    <%--<option value="大麦屿派出所">大麦屿派出所</option>--%>
                    <%--<option value="大麦屿边防派出所">大麦屿边防派出所</option>--%>
                    <%--<option value="干江边防派出所">干江边防派出所</option>--%>
                    <%--<option value="刑大直属中队">刑大直属中队</option>--%>
                    <%--<option value="治安大队">治安大队</option>--%>
                    <%--<option value="有组织犯罪">有组织犯罪</option>--%>
                    <%--<option value="禁毒大队">禁毒大队</option>--%>
                </select>
                <%--<textarea id="address" name="address" rows="1" required></textarea>--%>
            </li>

            <%--<li>--%>
                <%--<label for="postcode">邮政编码：</label>--%>
                <%--<input id="postcode" name="postcode" type="text" required>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<label for="country">国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</label>--%>
                <%--<input id="country" name="country" type="text" required>--%>
            <%--</li>--%>
        </ol>
    </fieldset>
    <fieldset>
        <legend>职位信息</legend>
        <ol>
            <%--<li>--%>
                <%--<fieldset>--%>
                    <%--<legend>职位性质</legend>--%>
                    <%--<ol>--%>
                        <%----%>
                    <%--</ol>--%>
                <%--</fieldset>--%>
            <%--</li>--%>
                <li>
                    <label for="usertype">人员角色：</label>
                    <select name="usertype" id="usertype" size="1" required>
                        <%--<option value="1">办案民警</option>--%>
                        <%--<option value="2">办案单位审批人员</option>--%>
                        <%--<option value="3">网警配侦审批人员</option>--%>
                        <%--<option value="4">网警配侦人员</option>--%>
                        <%--<option value="5">局审批人员</option>--%>
                    </select>
                    <%--<textarea id="address" name="address" rows="1" required></textarea>--%>
                </li>
            <%--<li>--%>
                <%--<label for="cardnumber">银行卡号：</label>--%>
                <%--<input id="cardnumber" name="cardnumber" type="number" required>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<label for="secure">验 证 码：</label>--%>
                <%--<input id="secure" name="secure" type="number" required>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<label for="namecard">持 卡 人：</label>--%>
                <%--<input id="namecard" name="namecard" type="text" placeholder="确定是否该卡用户！" required>--%>
            <%--</li>--%>
        </ol>
    </fieldset>
    <fieldset>
        <button type="submit" class="center-block">注  册</button>
    </fieldset>
</form>
</body>
</html>
