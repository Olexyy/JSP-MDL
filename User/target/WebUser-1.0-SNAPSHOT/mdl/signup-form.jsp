<%-- 
    Document   : login-form
    Created on : Oct 9, 2017, 10:51:16 PM
    Author     : Admin
--%>

<div class="mdl-grid">
    <div class="mdl-cell mdl-cell--12-col">
        <form action="index.jsp" style="display: flex; justify-content: center">
            <div class="demo-card-square mdl-card mdl-shadow--2dp">
              <div class="mdl-card__title mdl-card--expand">
                <h2 class="mdl-card__title-text">Sign up</h2>
              </div>
              <div class="mdl-card__supporting-text">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" name="Email" type="text" id="Email">
                  <label class="mdl-textfield__label"  for="Email">Email...</label>
                </div>
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" name="FirstName" type="text" id="FirstName">
                  <label class="mdl-textfield__label"  for="FirstName">FirstName...</label>
                </div>    
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" name="LastName" type="text" id="LastName">
                  <label class="mdl-textfield__label"  for="LastName">LastName...</label>
                </div>
              </div>
                <div class="mdl-card__actions mdl-card--border" style="text-align: center;">
                  <input type="submit" value="Sign up" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" />
              </div>
            </div>
        </form>
    </div>
</div>