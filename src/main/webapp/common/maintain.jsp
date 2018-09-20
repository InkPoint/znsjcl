<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
  <head>
      <title>功能维护页面</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"  rel="stylesheet"/>
  </head>
  <body>
      <div style="text-align: center;">
          <img src="${ctx}/v20/images/time.jpg"  height="90%">
      </div>
      <div style="text-align: center;">
          <button onclick="javascript:history.go(-1);" type="button" class="btn btn-info" style="width: 2cm">返回</button>
      </div>
  </body>
</html>
<script>


</script>