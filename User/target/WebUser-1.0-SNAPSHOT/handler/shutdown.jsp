<%-- 
    Document   : shutdown
    Created on : Oct 13, 2017, 7:22:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="webUser" scope="session" class="com.shag.webuser.WebUser" />
<% 
    webUser.getStorage().shutdown();
%>