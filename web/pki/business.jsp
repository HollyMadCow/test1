<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%
    String userid = (String) session.getAttribute("userid");
%>
<html>
<script>
    $(document).ready(function () {
        alert("ok,<%=userid%>");
    })
</script>

    <script>
    function myinfo() {
        $( "#mainboard" ).load( "/pki/reg.jsp");
    }

</script>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery-3.1.1.min.js"></script>
</head>
<body>
<a href="javascript:void(0)" onclick="myinfo()"> 我的信息</a>
</body>
</html>