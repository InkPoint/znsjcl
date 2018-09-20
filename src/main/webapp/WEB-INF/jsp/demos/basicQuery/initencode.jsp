<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>字符串编码转化</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>




</head>
<body>
        解码内容：<div id="encodestr"></div>
        输入要转码的文字：<input id="mystr" style="width:200px;"> <input type="button" onclick="decodestr()" value="发送">
</body>
</html>
<script>


    $(function(){
        $.ajax({
            url: '${pageContext.request.contextPath}/demos/basicQuery/urlencode',
            type: 'post',
            success: function (data) {
                  $("#encodestr").html(decodeURIComponent(data));
            }
        });
    });
    //转码发送到后台
    function decodestr(){
        var mystrss=encodeURI($("#mystr").val(),'UTF-8');
        console.log("mystrss:",mystrss);
        $.ajax({
            url: '${pageContext.request.contextPath}/demos/basicQuery/urldecode',
            type: 'post',
            data:{mystr:mystrss},
            success: function (data) {
                alert("发送成功"+data);
            }
        });
    }

</script>
