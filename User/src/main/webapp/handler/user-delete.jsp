<%-- 
    Document   : user-delete
    Created on : Oct 11, 2017, 1:06:02 AM
    Author     : Admin
--%>

<%@page import="com.shag.webuser.WebUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="webUser" scope="session" class="com.shag.webuser.WebUser" />
<% 
    if(webUser.isAuthorized()) {
        String userDelete = request.getParameter("UserDelete");
        if(userDelete != null && !userDelete.equals("")) {
            Integer userId = Integer.parseInt(userDelete);
            WebUser user = webUser.getStorage().get(userId);
            if(user != null && !user.getEmail().equals("admin@example.com")) {
                if(user.getId() == webUser.getId()){
                    webUser = new WebUser();
                    session.setAttribute("webUser", webUser);
                    System.out.println(">>>User logged out while deleting.");
                }
                webUser.getStorage().remove(user);
                System.out.println(">>>User deleted.");
            }
        }
    }
%>