<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>bootstrap基本信息查询</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/js/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/weather-icons.min.css" />

    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/demo.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/typicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/animate.min.css" />

    <script src="${ctx}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${ctx}/assets/js/beyond.min.js"></script>


</head>
<body>
   <table class="table">
        <tr>
            <td style="vertical-align:middle;width: 3cm;">纳税人名称:</td>
            <td ><input id="nsrmc" type="text" class="form-control" placeholder="输入纳税人名称" style="width: 200px;"></td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <button type="button" class="btn btn-info">执行查询</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-info btn-block" onclick="gobacks()" style="width: 2cm;">返&nbsp;&nbsp;回</button>
            </td>
        </tr>
  </table>
</body>
</html>
<script>



</script>
