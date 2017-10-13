<%-- 
    Document   : menu
    Created on : Oct 7, 2017, 3:24:41 PM
    Author     : Admin
--%>
<jsp:useBean class="com.shag.webuser.WebUser" id="webUser" scope="session" />
  <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <i class="material-icons">supervisor_account</i>
      <!-- Title -->
      <span class="mdl-layout-title">&nbsp;Web users</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link" href="">Link</a>
        <a class="mdl-navigation__link" href="">Link</a>
      </nav>
        <jsp:include page="login-form.jsp" />
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <div class="mdl-layout-title"><i class="material-icons">supervisor_account</i>&nbsp;Web users</div>
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link" href="">Link</a>
      <a class="mdl-navigation__link" href="">Link</a>
    </nav>
  </div>

