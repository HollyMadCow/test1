<!DOCTYPE html>
<html lang="cn">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
//    String username =(String) request.getAttribute("username");
//    String userid =(String) request.getAttribute("userid");
    //String username =(String) session.getAttribute("username");
   // String realname =(String) session.getAttribute("realname");
    String userrealnamefromkey= (String) session.getAttribute("userrealnamefromkey");
    String userid = (String) session.getAttribute("userid");
    String useridfromdatabase=(String) session.getAttribute("useridfromdatabase");

%>

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/bootstrap.min.js"></script>

    <script>//
    function mysearch() {
        if (document.getElementById("searchfiled").value != "")
        {
           var keyword = document.getElementById("searchfiled").value;
           $.get("/servlet/ndp/search",{"keyword":keyword},function (data) {
               $("#mainboard").load("/pki/search.jsp",{"return":data})
           });
            document.getElementById("searchfiled").value = "";
        }
    }
    </script>
    <%--<script>//--%>
    <%--function mysearch() {--%>
        <%--var s="test";--%>
        <%--$( "#mainboard" ).html(s);--%>
    <%--}--%>
    <%--</script>--%>
    <script>
        function mybusiness() {
            $.get("/servlet/ndp/business",function (data) {
                //console.log(data);
                $("#mainboard").load("/pki/business.jsp",{"listcase":data})
            });
            <%--$( "#mainboard" ).load("/pki/business.jsp",{"userid":'<%=userid%>'});--%>
        }
    </script>
    <script>
        function myinfo() {
//            $( "#mainboard" ).load( "/pki/reg.jsp");
            $.get("/servlet/ndp/reguser",function (data) {
                //console.log(data);
                $("#mainboard").load("/pki/reg.jsp",{"listdata":data})
            });


        }

    </script>
    <script>
        function addcase() {
            $( "#mainboard" ).load( "/pki/addcase.jsp");
        }
        <%--window.onload=function () {--%>
            <%--var firstregcheck=<%=userid%>;--%>
            <%--if(firstregcheck == null)--%>
            <%--{--%>
                <%--$( "#mainboard" ).load( "/pki/reg.jsp");--%>
            <%--}--%>

        <%--}--%>
    </script>
    <script>
        $(document).ready(function () {
            var firstregcheck =<%=useridfromdatabase%>;
            if (firstregcheck==null)
            {
                $.get("/servlet/ndp/reguser",function (data) {
                    //console.log(data);
                    $("#mainboard").load("/pki/reg.jsp",{"listdata":data})
                });
            }
        })
    </script>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <%--<a class="navbar-brand" href=""><%=request.getHeader("SSL_CLIENT_S_DN_O")%>，您好！</a>--%>
                    <a class="navbar-brand" href=""><%=userrealnamefromkey%>，您好！</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="javascript:void(0)" onclick="mybusiness()">您目前尚有<%=userid%>件事务等待处理，点击查看。</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input class="form-control" type="text" id="searchfiled" placeholder="任意关键字全文搜索"/>
                        </div>
                        <button type="button" class="btn btn-default" onclick="mysearch()" id="search">搜索</button>
                    </form>

                    <ul class="nav navbar-nav navbar-right">

                    </ul>
                </div>

            </nav>
        </div>
    </div>
    <div class="row clearfix" id="wrap">
        <div class="col-md-2 column"  id="left">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        我的事务
                    </h3>
                </div>

                <ul class="list-group">
                    <li class="list-group-item" style=""><a href="javascript:void(0)" onclick="mybusiness()"> 我的事务</a></li>
                    <li class="list-group-item" style=""><a href="javascript:void(0)" onclick="addcase()"> 提交配侦</a></li>
                    <li class="list-group-item" ><a href="javascript:void(0)" onclick="mysearch()"> 搜    索</a></li>
                    <li class="list-group-item" ><a href="javascript:void(0)" onclick="myinfo()"> 我的信息</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 column" id="right">
            <div id="mainboard">

                    <%--<script>--%>
                        <%--$( "#mainboard" ).load( "welcome.jsp");--%>
                    <%--</script>--%>
            </div>
        </div>
    </div>
    <div class="row clearfix" id="footer">
        <div class="col-md-4 column">
            <h2>
                Heading
            </h2>
            <p>
                1
            </p>
            <p>
                <a class="btn" href="#">View details »</a>
            </p>
        </div>
        <div class="col-md-4 column">
            <h2>
                Heading
            </h2>
            <p>
                2
            </p>
            <p>
                <a class="btn" href="#">View details »</a>
            </p>
        </div>
        <div class="col-md-4 column">
            <h2>
                Heading
            </h2>
            <p>
                3
            </p>
            <p>
                <a class="btn" href="#">View details »</a>
            </p>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
        </div>
    </div>
</div>
</body>
</html>