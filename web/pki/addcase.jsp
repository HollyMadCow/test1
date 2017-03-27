<!DOCTYPE html>
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    String username =(String) request.getAttribute("username");
//    String userid =(String) request.getAttribute("userid");
    String username =(String) session.getAttribute("username");
    String userid =(String) session.getAttribute("userid");
    String useridfromdatabase=(String) session.getAttribute("useridfromdatabase");
    String cellphone = (String) session.getAttribute("cellphone");
    String area1 = (String) session.getAttribute("area");
    String realname = (String) session.getAttribute("realname");
    String email = (String) session.getAttribute("email");
    String listdata = request.getParameter("listdata");
%>


<head>
    <title>提交配侦</title>
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
    <script type="text/javascript">
        function initFileInput(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);
            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl : uploadUrl,
//                uploadUrl: "/servlet/uploadimg", //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png','zip','rar'],//接收的文件后缀
                //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
                uploadAsync: true, //默认异步上传
                showUpload: true, //是否显示上传按钮
                showRemove : true, //显示移除按钮
                showPreview : true, //是否显示预览
                showCaption: false,//是否显示标题
//            browseClass: "btn btn-primary", //按钮样式
                dropZoneEnabled: false,//是否显示拖拽区域

                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 1, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            }).on('filepreupload', function(event, data, previewId, index) {     //上传中
                var form = data.form, files = data.files, extra = data.extra,
                    response = data.response, reader = data.reader;
                console.log('文件正在上传');
            }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
                var array = data.response;
                var name="result";
                var value=array[name];
                $("#caseregfilename").val(value);
                //alert(value);
//                console.dir(array);
//                alert(array);
//                alert('文件上传成功！'+data.response);

            }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
                alert('文件上传失败！'+data.id);
        })
        }
        //初始化控件initFileInput(id,uploadurl)控件id，与上传路径
        initFileInput("caseregfile", "/servlet/uploadimg.do");


    </script>
    <script>
        $(document).ready(function() {

            var MaxInputs       = 10; //maximum input boxes allowed
            var InputsWrapper   = $("#workdetail"); //Input boxes wrapper ID
            var AddButton       = $("#morerequest"); //Add button ID

            var x = InputsWrapper.length; //initlal text box count
            var FieldCount=1; //to keep track of text box added

            $(AddButton).click(function (e)  //on add input button click
            {

                if(x <= MaxInputs) //max input box allowed
                {

                    FieldCount++; //text box added increment
                    //add input box
                    $(InputsWrapper).append('<div xmlns="http://www.w3.org/1999/html">' +
                        '<select name="addrequestdetail[]" id="addrequestdetail" size="1" required> ' +
                        '<option value="姓名身份证">姓名身份证</option>' +
//                        '<option value="身份证">身份证</option>' +
//                        '<option value="现居住地">现居住地</option>' +
                        '<option value="QQ">QQ</option>' +
                        '<option value="微信">微信</option>' +
                        '<option value="手机号码">手机号码</option>' +
                        '<option value="手机IMSI/IMEI">手机IMSI/IMEI</option>' +
                        '<option value="终端MAC地址">终端MAC地址</option>' +
                        '<option value="陌陌">陌陌</option>' +
                        '<option value="微博">微博</option>' +
                        '<option value="邮箱">邮箱</option>' +
                        '<option value="域名">域名</option>' +
                        '<option value="IP地址">IP地址</option>' +
                        '<option value="ADSL">ADSL</option>' +
                        '<option value="其他">其他</option>' +
                        '</select>&nbsp&nbsp&nbsp&nbsp' +
                        '<input type="text" name="mytext[]" id="field_'+ FieldCount +'" required/><a href="#" class="removeclass" >×</a></br></br></div>');
//                        '<input type="text" name="mytext[]" id="field_'+ FieldCount +'" value="Text '+ FieldCount +'"/><a href="#" class="removeclass">×</a></br></br></div>');
                    x++; //text box increment
                }
                return false;
            });

            $("body").on("click",".removeclass", function(e){ //user click on remove text
                if( x > 1 ) {
                    $(this).parent('div').remove(); //remove text box
                    x--; //decrement textbox
                }
                return false;
            })

        });
    </script>

    <script>
        $(document).ready(function () {
            var s=null;
            var userarea="<%=area1%>";
            var s2=null;
            var obj=<%=listdata%>;
            var s3=null;
            //console.log(obj);
            var arealistarray=obj.arealist.split(";");
            //console.log(arealistarray);
            //alert(arealistarray.length);
            var stationlist=obj.stationlist.split(";");
            var sumbitto=obj.sumbitto.split(";");
            //console.log(obj);
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
            for(var i=0;i<sumbitto.length;i++)
            {
//                s+='<option value="'+arealistarray[i] +'">网警大队</option>'
                s3+="<option value=\""+ sumbitto[i] + "\">"+ sumbitto[i]+ "</option>";
            }

            $( "#area" ).html(s);
            //$( "#usertype" ).html(s1);
            $( "#station" ).html(s2);
            $( "#sumbittodepartement" ).html(s3);
            //var usertypelist=obj.usertypelist.split(";");
            $("#caseby").val('<%=realname%>');
            <%--<!--$('#caseby').attr("value", <%=realname%>);-->--%>
            $("#officerphone").val('<%=cellphone%>');
            <%--$("#area").val('<%=area1%>');--%>
            $("#email").val('<%=email%>');
            //alert(document.getElementById("caseby").value);
        })

    </script>
    <%--<script>--%>
        <%--function adduserinfo() {--%>
            <%--$("#caseby").val('<%=realname%>');--%>
            <%--$("#officerphone").val('<%=cellphone%>');--%>
        <%--}--%>
    <%--</script>--%>

</head>
<script>

    function savereport() {
// jquery 表单提交
        $("#addcase").ajaxSubmit(function(message) {
// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容
//            alert("案件提交成功！")
//            Lobibox.confirm({
//                msg: "你确认提交这个案件配侦信息吗？",
//                button:{
//                    yes: {
//                        'class': 'lobibox-btn lobibox-btn-yes',
//                        text: '是',
//                        closeOnClick: true
//                    },
//                    no: {
//                        'class': 'lobibox-btn lobibox-btn-no',
//                        text: '否',
//                        closeOnClick: true
//                    }
//                },
//                callback:function (lobibox, type) {
//                    if (type === 'yes'){
//                        $( "#mainboard" ).load( "/pki/addcase.jsp");
//                        Lobibox.alert("success",{msg:"案件提交成功！"});
//                        return false;
//                    }
//                }
//            });
           //
//            Lobibox.alert("success",{msg:"案件提交成功！"});
             alert("案件提交成功！");
//             $( "#mainboard" ).load( "/pki/business.jsp");
            $.get("/servlet/ndp/mybusiness.do?page=1&rows=20",function (data) {
                //console.log(data);
                $("#mainboard").load("/pki/business.jsp",{"listcase":data,"page":"1"});
                //console.log(data);
            });

        });

        return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
    }
</script>
<body>

<form id="addcase" method="post" action="/servlet/ndp/addcase.do" onsubmit="return savereport();">
    <fieldset>
        <legend>案件信息:</legend>
        <ol>
            <li>
                <label for="caseid">案件编号：</label>
                <input id="caseid" name="caseid" type="text" placeholder="案件编号" required autofocus>
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
                <label for="caseregfile">立案决定书:</label>
                    <%--<label>上传文书:</label>--%>
                <%--<input id="caseregfile" type="file" class="file-loading" multiple accept="image/*" required>--%>
                <input id="caseregfile"  name="caseregfile" type="file" data-show-caption="true" multiple accept="*">
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
        <legend>配侦受理单位:</legend>
        <ol>
            <li>
                <label for="sumbittodepartement">配侦受理单位:</label>
                <select name="sumbittodepartement" id="sumbittodepartement" size="1" required>

                </select>

            </li>
        </ol>
    </fieldset>

    <fieldset>
        <legend>提交配侦单位信息:</legend>
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
