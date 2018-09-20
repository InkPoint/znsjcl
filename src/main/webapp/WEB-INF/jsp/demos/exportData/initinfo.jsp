<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>信息导出功能例子</title>
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
<!-- 装载容器开始 -->
<div class="loading-container">
    <div class="loading-progress">
        <div class="rotator">
            <div class="rotator">
                <div class="rotator colored">
                    <div class="rotator">
                        <div class="rotator colored">
                            <div class="rotator colored"></div>
                            <div class="rotator"></div>
                        </div>
                        <div class="rotator colored"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
        <div class="rotator"></div>
    </div>
</div>
<!-- Page Body -->
        <div class="page-body">
            <div id="condition" class="row">
                <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                    <div class="widget">
                        <div class="widget-header bg-blue">
                            <span class="widget-caption">导出数据实例</span>
                            <div class="widget-buttons">
                                <a href="#" data-toggle="maximize">
                                    <i class="fa fa-expand"></i>
                                </a>
                                <a href="#" data-toggle="collapse">
                                    <i class="fa fa-minus"></i>
                                </a>
                                <a href="#" data-toggle="dispose">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                            <!--小部件按钮-->
                        </div>
                        <!--小部件标题-->
                        <div class="widget-body">
                            <table class="table">
                                <tr>
                                    <td style="vertical-align:middle;width: 3cm;">纳税人名称:</td>
                                    <td ><input id="nsrmc" type="text" class="form-control" placeholder="输入纳税人名称" style="width: 200px;"></td>
                                </tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <button type="button" class="btn btn-info" onclick="exportdata()">导出</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!--Widget Body-->
                    </div>
                    <!--Widget-->
                </div>
            </div>

        </div>
</body>
</html>
<script>
      //导出数据
      function   exportdata(){
          window.location.href="${pageContext.request.contextPath}/demos/exportData/list";

      }
    <%
//       out.clear();
//       pageContext.pushBody();
    %>

</script>
