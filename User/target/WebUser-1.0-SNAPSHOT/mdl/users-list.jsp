<%-- 
    Document   : users-list
    Created on : Oct 10, 2017, 11:59:13 PM
    Author     : Admin
--%>

<%@page import="com.shag.webuser.WebUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="webUser" scope="session" class="com.shag.webuser.WebUser" />
<div class="mdl-grid">
    <div class="mdl-cell mdl-cell--12-col">
        <div class="flex-wrapper" style="display: flex; justify-content: center">
            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
              <thead>
                <tr>
                  <th class="mdl-data-table__cell--non-numeric"></th>
                  <th class="mdl-data-table__cell--non-numeric">First Name</th>
                  <th class="mdl-data-table__cell--non-numeric">Last Name</th>
                  <th class="mdl-data-table__cell--non-numeric">Email</th>
                  <th class="mdl-data-table__cell--non-numeric"></th>
                </tr>
              </thead>
              <tbody>
                <% for(WebUser user : webUser.getStorage().list()) { %>  
                <tr class="id-<%= user.getId() %>">
                  <td class="mdl-data-table__cell--non-numeric"><i class="material-icons mdl-color-text--grey-400">account_circle</i></td>  
                  <td class="mdl-data-table__cell--non-numeric"><%= user.getFirstName() %></td>
                  <td class="mdl-data-table__cell--non-numeric"><%= user.getLastName() %></td>
                  <td class="mdl-data-table__cell--non-numeric"><%= user.getEmail() %></td>
                  <td class="actions" style="padding: 6px 21px;">
                    <a href="index.jsp?UserDelete=<%= user.getId()%>" class="mdl-button mdl-button--colored mdl-js-button">
                        Delete
                    </a>
                  </td>
                </tr>
                <% } %>
              </tbody>
            </table>      
        </div>
    </div>
</div>