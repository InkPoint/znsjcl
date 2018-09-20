<%@ page import="java.util.Enumeration" %>
<%
    Enumeration<String> en = request.getParameterNames();
    String url = "";
    String param = "";
    while (en.hasMoreElements()) {
        String key = en.nextElement();
        if (key.equals("url")) {
            url = request.getParameter(key);
        } else {
            if (!key.equals("_")) {
                param = param + "&" + key + "=" + request.getParameter(key);
            }
        }
    }
    url = url + param;
//    System.out.println(url + param);
    if (!url.toLowerCase().startsWith("http://")) {
        if (url.startsWith("/")) {
            url = "http://" + request.getServerName() + ":" + request.getServerPort() + url;
        } else {
            url = "http://" + request.getServerName() + ":" + request.getServerPort() + "/" + url;
        }
    }
//    System.out.println(url);
//    if (url.indexOf("?") != -1) {
//        url = url + "&" + AclConstants.PERMISSIONSESSION + "=" + session.getId();
//    } else {
//        url = url + "?" + AclConstants.PERMISSIONSESSION + "=" + session.getId();
//    }
    response.sendRedirect(url);
%>