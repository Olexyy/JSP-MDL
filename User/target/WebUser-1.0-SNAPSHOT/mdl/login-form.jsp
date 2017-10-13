<%-- 
    Document   : login-form
    Created on : Oct 9, 2017, 10:51:16 PM
    Author     : Admin
--%>

<jsp:useBean id="webUser" scope="session" class="com.shag.webuser.WebUser" />
<% if (webUser.getEmail() != null) { %>
<nav class="mdl-navigation__link">
    <i class="material-icons">account_box</i> <%= webUser.getEmail() %>
    <a class="mdl-button mdl-js-button mdl-color-text--white" href="index.jsp?Logout=true">Log out</a>
</nav>    
<% } else { %>
<form action="index.jsp">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                  mdl-textfield--floating-label mdl-navigation__link"> Login
        <label class="mdl-button mdl-js-button mdl-button--icon" for="Email">
            <i class="material-icons">person_outline</i>
        </label>
        <div class="mdl-textfield__expandable-holder">
            <input class="mdl-textfield__input" type="text" name="Email" id="Email" />
        </div>
    </div>
  <!--div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
      <input class="mdl-textfield__input" name="Email" type="text" id="Email">
    <label class="mdl-textfield__label mdl-color-text--white" for="Email">Email...</label>
  </div>
    <input type="submit" value="Login" class="mdl-button mdl-js-button mdl-color-text--white" /-->
</form>
<% } %>