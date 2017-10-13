<%-- 
    Document   : seed
    Created on : Oct 9, 2017, 11:56:33 PM
    Author     : Admin
--%>

<%@page import="com.shag.webuser.WebUser"%>
<%  
    WebUser admin = new WebUser("admin", "admin", "admin@example.com");
    int count = admin.getStorage().where("Email", "admin@example.com").size(); 
    if(count == 0) {
        admin.getStorage().add(admin);
        System.out.println(">>>Created admin@example.com account");
    }
    WebUser user = new WebUser("user", "user", "user@example.com");
    count = user.getStorage().where("Email", "user@example.com").size(); 
    if(count == 0) {
        user.getStorage().add(user);
        System.out.println(">>>Created user@example.com account");
    }
%>
<jsp:forward page="index.jsp" />
