<%-- 
    Document   : index
    Created on : Oct 7, 2017, 3:27:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="page" tagdir="/WEB-INF/tags" %>
<jsp:include page="handler/authorize.jsp" />
<jsp:include page="handler/user-delete.jsp" />
<c:set var="content">
    <jsp:useBean id="webUser" scope="session" class="com.shag.webuser.WebUser" />
    <% if(!webUser.isAuthorized()) { %>
        <jsp:include page="mdl/signup-form.jsp" />
    <% } else { %>
        <jsp:include page="mdl/users-list.jsp" />
    <% } %>
</c:set>
        
<page:template>
    <jsp:body>
        ${content}
    </jsp:body>
</page:template>

<jsp:include page="handler/shutdown.jsp" />