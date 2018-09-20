<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>大数据量信息导出</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.js"></script>
    <script src="${ctx}/assets/js/bootstrap-editable.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
    <script src="${ctx}/static/js/jquery.ts.js"></script>
    <script src="${ctx}/assets/js/util.js"></script>

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

    <div>
         版本1：<input type="button" onclick="exportdata()"  value="导出纳税人基本信息表数据（版本1）"/>
    </div>


    <div>
        版本2：<input type="button" onclick="exportdata2()"  value="导出纳税人基本信息表数据（版本2）"/>
    </div>


    <div>
        版本3：<input type="button" onclick="exportdata3()"  value="导出纳税人基本信息表数据（版本3）"/>
    </div>
</body>
</html>
<script>

 //导出数据
 function exportdata(){
       window.location.href="${pageContext.request.contextPath}/demos/basicQuery/exportBigData";
 }

 //导出数据
 function exportdata2(){
     window.location.href="${pageContext.request.contextPath}/demos/basicQuery/exportBigData2";
 }

 //导出数据
 function exportdata3(){
     window.location.href="${pageContext.request.contextPath}/demos/basicQuery/exportBigData3";
 }

</script>
