<!DOCTYPE html>
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
    /*分别定义HTML中和标记之的距离样式*/
    html, body, h1, form, fieldset, legend, ol, li {
        margin: 0;
        padding: 0;
    }
    textarea{resize:none;}
    /*定义<body>标记样式*/
    body {
        background: #ffffff;
        color: #111111;
        /*font-family: Georgia, "Times New Roman", Times, serif;*/
        padding-left: 20px;

    }
    /*定义付费内容的样式*/
    form#addcase {
        background: #ffffff;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        padding: 20px;
        width: 600px;
        margin:auto;
    }
    form#addcase fieldset {
        border: none;
        margin-bottom: 10px;
    }
    form#addcase fieldset:last-of-type { margin-bottom: 0; }
    form#addcase legend {
        color: #384313;
        font-size: 16px;
        font-weight: bold;
        padding-bottom: 10px;
        text-shadow: 0 1px 1px #ffffff;
    }
    /*form#payment > fieldset > legend:before {*/
    /*content: "Step " counter(fieldsets) ": ";*/
    /*counter-increment: fieldsets;*/
    /*}*/
    form#addcase fieldset fieldset legend {
        color: #111111;
        font-size: 13px;
        font-weight: normal;
        padding-bottom: 0;
    }
    form#addcase ol li {
        background: #ffffff;
        background: rgba(255, 255, 255, .3);
        border-color: #e3ebc3;
        border-color: rgba(255, 255, 255, .6);
        border-style: solid;
        border-width: 2px;
        -webkit-border-radius: 5px;
        line-height: 30px;
        list-style: none;
        padding: 5px 10px;
        margin-bottom: 2px;
    }
    form#addcase ol ol li {
        background: none;
        border: none;
        float: left;
    }
    form#addcase label {
        float: left;
        font-size: 13px;
        width: 110px;
    }
    form#addcase fieldset fieldset label {
        background: none no-repeat left 50%;
        line-height: 20px;
        padding: 0 0 0 30px;
        width: auto;
    }
    form#addcase fieldset fieldset label:hover { cursor: pointer; }
    form#addcase input:not([type=radio]), form#addcase textarea {
        background: #ffffff;
        border: #16ff39 solid 1px;
        -webkit-border-radius: 3px;
        /*font: italic 13px Georgia, "Times New Roman", Times, serif;*/
        outline: none;
        padding: 5px;
        width: 300px;
    }
    form#addcase input:not([type=submit]):focus, form#addcase textarea:focus {
        background: #eaeaea;
        border: #F00 solid 1px;
    }
    form#addcase input[type=radio] {
        float: left;
        margin-right: 5px;
    }

</style>
<head>
    <title>提交配侦</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link media="all" rel="stylesheet" type="text/css" href="/fileinput/css/fileinput.min.css">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
    <script src="/fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
    <script src="/fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>

    <script src="/fileinput/js/fileinput.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script src="/fileinput/themes/fa/theme.js"></script>
    <script src="/fileinput/js/locales/zh.js"></script>

    <script type="text/javascript">
        function initFileInput(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);
            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl : uploadUrl,
                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
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
                alert(value);
//                console.dir(array);
//                alert(array);
//                alert('文件上传成功！'+data.response);

            }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
                alert('文件上传失败！'+data.id);
        })
        }
        //初始化控件initFileInput(id,uploadurl)控件id，与上传路径
        initFileInput("caseregfile", "/servlet/uploadimg");

//        $("#caseregfile").fileinput({
//            language: 'zh', //设置语言
//            uploadUrl: "http://192.168.2.114/servlet/uploadimg", //上传的地址
//            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
//            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
//            uploadAsync: true, //默认异步上传
//            showUpload: true, //是否显示上传按钮
//            showRemove : true, //显示移除按钮
//            showPreview : true, //是否显示预览
//            showCaption: false,//是否显示标题
////            browseClass: "btn btn-primary", //按钮样式
//            dropZoneEnabled: false,//是否显示拖拽区域
//            //minImageWidth: 50, //图片的最小宽度
//            //minImageHeight: 50,//图片的最小高度
//            //maxImageWidth: 1000,//图片的最大宽度
//            //maxImageHeight: 1000,//图片的最大高度
//            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
//            //minFileCount: 0,
//            maxFileCount: 1, //表示允许同时上传的最大文件个数
//            enctype: 'multipart/form-data',
//            validateInitialCount:true,
//            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
//            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
//        });
//
//            $("#caseregfile").on("fileuploaded", function(event, data,previewId, index) {
//            if(data.response)
//            {
//                alert('处理成功');
//            }
////            $("#excelImport").modal("hide");
//            //后台处理后返回的经纬度坐标json数组，
//            var array = data.response;
////            console.dir(array);
//            alert(array);
            <%--//jquery循环取经纬度坐标--%>
            <%--&lt;%&ndash;$.each(array,function(index,latAndLon){&ndash;%&gt;--%>
                <%--&lt;%&ndash;var lon = latAndLon.lon;&ndash;%&gt;--%>
                <%--&lt;%&ndash;var lat = latAndLon.lat;&ndash;%&gt;--%>
                <%--&lt;%&ndash;var point =  new Point(lon, lat, map.spatialReference);&ndash;%&gt;--%>
                <%--&lt;%&ndash;var symbol = new esri.symbol.SimpleMarkerSymbol().setStyle(&ndash;%&gt;--%>
                    <%--&lt;%&ndash;SimpleMarkerSymbol.STYLE_CIRCLE).setColor(&ndash;%&gt;--%>
                    <%--&lt;%&ndash;new Color([255,255,0,0.5]));&ndash;%&gt;--%>
                <%--&lt;%&ndash;var attr = {"address": "addressName" };&ndash;%&gt;--%>
                <%--&lt;%&ndash;var infoTemplate = new esri.InfoTemplate("标题", "地址 :${address}");&ndash;%&gt;--%>
                <%--&lt;%&ndash;var graphic = new Graphic(point,symbol,attr,infoTemplate);&ndash;%&gt;--%>
                <%--&lt;%&ndash;map.graphics.add(graphic);&ndash;%&gt;--%>
            <%--&lt;%&ndash;});&ndash;%&gt;--%>

//        });

//        $("caseregfile").on('filesuccessremove', function(event, id) {
//            if (some_processing_function(id)) {
//                console.log('Uploaded thumbnail successfully removed');
//            } else {
//                return false; // abort the thumbnail removal
//            }
//        });

    </script>

</head>
<body>

<form id="addcase">
    <fieldset>
        <legend>案件信息</legend>
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
                <label for="caseregfile">上传文书:</label>
                <%--<input id="caseregfile" type="file" class="file-loading" multiple accept="image/*" required>--%>
                <input id="caseregfile" name="caseregfile" type="file" data-show-caption="true" multiple accept="image/*" required>

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
                    <option value="网警大队">网警大队</option>
                    <option value="玉城所">玉城所</option>
                    <option value="坎门所">坎门所</option>
                    <option value="楚门所">楚门所</option>
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
                    <option value="1">办案民警</option>
                    <option value="2">办案单位配侦审批人员</option>
                    <option value="3">网警配侦审批人员</option>
                    <option value="4">网警配侦人员</option>
                    <option value="5">局审批人员</option>
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
        <button type="submit" class="center-block" onclick="sumbit()" >注  册</button>
    </fieldset>
</form>

</body>
</html>
