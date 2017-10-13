<%-- 
    Document   : template
    Created on : Oct 9, 2017, 10:03:21 PM
    Author     : Admin
--%>

<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="mdl/head.jsp" />
    <jsp:include page="mdl/layout-begin.jsp" />
        <jsp:include page="mdl/header.jsp" />
            <jsp:include page="mdl/content-begin.jsp" /> 
                <jsp:doBody />
                <jsp:include page="mdl/footer.jsp" />
            <jsp:include page="mdl/content-end.jsp" />        
    <jsp:include page="mdl/layout-end.jsp" />
    <jsp:include page="mdl/sources.jsp" />
</html>
