<!DOCTYPE html>
<html lang="cn">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>玉环网警配侦系统</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery-3.1.1.min.js"></script>
</head>
<script>
  function pkilogin() {
      alert("test");
  }
</script>
<style>
  body{
    margin-left:auto;
    margin-right:auto;
    margin-TOP:400PX;
    width:23em;
  }
</style>
<body>
<!--下面是用户名输入框-->
<div class="input-group">
  <h1 class="text-center">
    玉环网警配侦系统
  </h1>
</div>
<br>
<!--下面是用户名输入框-->
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">@</span>
  <input id="userName" type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
</div>
<br />
<!--下面是密码输入框-->
<div class="input-group">
  <span class="input-group-addon" id="basic-addon2">@</span>
  <input id="passWord" type="text" class="form-control" placeholder="密码" aria-describedby="basic-addon1">
</div>
<br>
<!--下面是登陆按钮,包括颜色控制-->
<div class="input-group">
  <a href="http://172.16.210.251/nopki/main.jsp" style="width:280px" class="btn btn-default">登  录</a>
</div>
<br>
<!--下面是登陆按钮,包括颜色控制-->
<!--<button type="submit" style="width:280px;" class="btn btn-success">PKI 登 录</button>-->
<%--<a href="https://192.168.2.114/servlet/pkilogin" style="width:280px" class="btn btn-success">PKI登录</a>--%>
<a href="javascript:void(0)" id="pkilogin" onclick="pkilogin()" style="width:280px" class="btn btn-success">PKI登录</a>
</body>
</html>