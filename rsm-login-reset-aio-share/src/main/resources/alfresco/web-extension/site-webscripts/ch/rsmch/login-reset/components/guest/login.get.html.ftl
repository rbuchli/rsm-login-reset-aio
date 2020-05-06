<@markup id="login-reset-css" target="js" action="after">
<#-- CSS Dependencies -->
    <@link href="rsm-login-reset-aio-share/components/LoginReset.css" group="login"/>

    <script type="text/javascript">
        new RSMCH.component.LoginReset("${args.htmlid}-loginReset");
    </script>
</@markup>

<@markup id="login-reset-js">
<#-- JavaScript Dependencies -->
    <@script src="rsm-login-reset-aio-share/components/LoginReset.js" group="login"/>
</@markup>

<@markup id="login-reset" target="buttons" action="after" scope="page">
    <div class="form-field">
        <input type="button" id="${args.htmlid}-loginReset" class="login-button hidden"
               value="${msg("loginPage.forgotButton")}"/>
    </div>
</@>

<#--<@markup id="footer_custom" target="footer" action="replace" scope="page">-->
<#--<div class="copy">${msg("label.copyright")}</div>-->
<#--</@markup>-->