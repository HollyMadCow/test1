<%--
  Created by IntelliJ IDEA.
  User: CowBoy
  Date: 2017/2/7
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/addcasecss.css">
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
<body>

<form id="addcase" method="post" action="/servlet/ndp/addcase" onsubmit="return savereport();">
    <fieldset>
        <legend>案件信息:</legend>
        <ol>
            <li>
                <label for="caseid">案件编号：</label>
                <input id="caseid" name="caseid" type="text" readonly placeholder="案件编号" required autofocus>
            </li>
            <li>
                <label for="casename">案件名称:</label>
                <input id="casename" name="casename" type="text" placeholder="案件名称" required>
            </li>
            <li>
                <label for="casedetail">简要案情:</label>
                <textarea id="casedetail" cols="50" name="casedetail" rows="10" placeholder="简要案情" required></textarea>
            </li>
            <li>
                <label for="caseregno">立案决定书：</label>
                <input id="caseregno" name="caseregno" type="text" placeholder="文书编号" required>
            </li>
            <li>
                <label for="caseregfile">上传文书:</label>
                <%--<label>上传文书:</label>--%>
                <%--<input id="caseregfile" type="file" class="file-loading" multiple accept="image/*" required>--%>
                <input id="caseregfile"  name="caseregfile" type="file" data-show-caption="true" multiple accept="image/*">
                <%--<input type="file" data-show-caption="true" multiple accept="image/*">--%>
                <input type="text" style="visibility: hidden" id="caseregfilename" name="caseregfilename">

            </li>

        </ol>
    </fieldset>
    <fieldset>
        <legend>配侦详情:</legend>
        <%--<button type="button" class="center-block" id="morerequest" onclick="add()">添加配侦内容</button>--%>
        <a href="#" id="morerequest" class="btn btn-info">添加配侦线索</a></span></p><p style="color: red">最多添加10个</p>
        <ol id="workdetail">

        </ol>

    </fieldset>
    <fieldset>
        <legend>线索来源:</legend>
        <ol>
            <li>
                <label for="detailfrom">线索来源:</label>
                <textarea id="detailfrom" cols="50" name="detailfrom" rows="3" placeholder="请填写线索来源"></textarea>
                <p style="color: red">未填写或不能通过审核</p>
            </li>
        </ol>
    </fieldset>
    <fieldset>
        <legend>单位信息:</legend>
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
                    <option value="网警大队">网警大队</option>
                    <option value="玉城所">玉城所</option>
                    <option value="坎门所">坎门所</option>
                    <option value="楚门所">楚门所</option>
                    <option value="刑大直属中队">刑大直属中队</option>
                </select>
                <%--<textarea id="address" name="address" rows="1" required></textarea>--%>
            </li>

        </ol>
    </fieldset>
    <fieldset>
        <legend>职务信息:</legend>
        <ol>

            <li>
                <label for="caseby">经办民警:</label>
                <input id="caseby" name="caseby" type="text" placeholder="姓名" required>
            </li>
            <li>
                <label for="officerphone">联系号码:</label>
                <input id="officerphone" name="officerphone" type="text" placeholder="长号/短号" required>
            </li>
            <li>
                <label for="email">内网邮箱:</label>
                <input id="email" name="email" type="text" placeholder="内网邮箱" required>
                <p style="color: red">向邮箱发送案件审核、配侦进度，邮箱与手机绑定可获得短信通知</p>
            </li>

            <%--<li>--%>
            <%--<label for="usertype">人员角色：</label>--%>
            <%--<select name="usertype" id="usertype" size="1" required>--%>
            <%--<option value="1">办案民警</option>--%>
            <%--<option value="2">办案单位配侦审批人员</option>--%>
            <%--<option value="3">网警配侦审批人员</option>--%>
            <%--<option value="4">网警配侦人员</option>--%>
            <%--<option value="5">局审批人员</option>--%>
            <%--</select>--%>
            <%--&lt;%&ndash;<textarea id="address" name="address" rows="1" required></textarea>&ndash;%&gt;--%>
            <%--</li>--%>

        </ol>
    </fieldset>
    <fieldset>
        <button type="submit" class="center-block">提交案件</button>
    </fieldset>
</form>

</body>
</html>
