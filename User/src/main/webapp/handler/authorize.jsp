<%-- 
    Document   : session
    Created on : Oct 10, 2017, 7:00:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.shag.webuser.WebUser"%>
<jsp:useBean id="webUser" scope="session" class="com.shag.webuser.WebUser" />
<% 
    // Handle login
    if(!webUser.isAuthorized()) {
        String email = request.getParameter("Email");
        if(email != null && !email.equals("")) {
            List<WebUser> result = webUser.getStorage().where("Email", email);
            if(result.size() > 0) {
                webUser = webUser.getStorage().where("Email", email).get(0);
                session.setAttribute("webUser", webUser);
                System.out.println(">>>Existing user logged in.");
            }
            // Handle sign up
            String firstName = request.getParameter("FirstName");
            String lastName = request.getParameter("LastName");
            if(firstName != null && !firstName.equals("")) {
                if(lastName != null && !lastName.equals("")) {
                    webUser.initialize(firstName, lastName, email);
                    webUser.getStorage().add(webUser);
                    session.setAttribute("webUser", webUser);
                    System.out.println(">>>New user created an logged in.");
                }
            }
        }
    }
    else {
        // Handle logout
        String logout = request.getParameter("Logout");
        if(logout != null && logout.equals("true")) {
            webUser = new WebUser();
            session.setAttribute("webUser", webUser);
            System.out.println(">>>Existing user logged out.");
        }
    }
%>