<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java"
         import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
         pageEncoding="utf-8"%>
<%
    //******************************卓正PageOffice组件的使用*******************************
    //设置PageOffice服务器组件
    PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
    poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须

    //隐藏Office工具条
    poCtrl1.setOfficeToolbars(false);
    //隐藏自定义工具栏
    poCtrl1.setCustomToolbar(false);
    //设置页面的显示标题
    poCtrl1.setCaption("演示：最简单的以只读模式打开Word文档");

    //打开文件
    poCtrl1.webOpen("d:\\王鹏文项目计划.doc", OpenModeType.docReadOnly, "测试好");
%>
<html>
<head>

    <title>文件上传</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>

    <script>
        $(function(){
            $.post("${pageContext.request.contextPath}/demos/fileInfo/mydata","",function(json){
                $("#mydata").html(json);
            });

        });
    </script>

</head>
<body>

      <div style=" width:auto; height:700px;" id="mydata">
      </div>
</body>
</html>
<script>



</script>
