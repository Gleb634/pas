<#-- @ftlvariable name="user" type="alekmia.work.domain.User" -->
<#-- @ftlvariable name="message" type="java.lang.String" -->
<#import "/spring.ftl" as spring/>
<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Password Manager</title>
    <link rel="icon" type="image/png" href="<@spring.url '/favicon.png'/>" />
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/form.css'/>">
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/datatable.css'/>">
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/article.css'/>">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<@spring.url '/js/notify.js'/>"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@500&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="enter-or-register-box">
        <#if user??>
            ${user.login}
            |
            <a href="<@spring.url '/logout'/>">Logout</a>
        <#else>
            <a href="<@spring.url '/enter'/>">Log in</a>
            |
            <a href="<@spring.url '/register'/>">Sign Up</a>
        </#if>
    </div>
    <nav>
        <ul>
            <#if user??>
                <li><a href="<@spring.url '/myAccounts'/>">My Accounts</a></li>
                <li><a href="<@spring.url '/addAccount'/>">Add An Account</a></li>
                <li><a href="<@spring.url '/removeAccount'/>">Remove An Account</a></li>
            <#else>
                <li><a href="<@spring.url '/'/>">Home</a></li>
            </#if>
        </ul>
    </nav>
</header>
<div class="middle">
    <aside>
    </aside>
    <main>
        <#nested/>
    </main>
</div>
<footer>
    <a href="<@spring.url '/'/>">Password Manager</a> &copy; 2023
</footer>
</body>
<script>
    <#--noinspection JSUnresolvedFunction-->
    $(function () {
        <#if message??>
            $.notify("${message?js_string}", {className: "success", position: "bottom right"});
        </#if>
    })
</script>
</html>
</#macro>

<#macro error field>
    <@spring.bind field/>
    <#if spring.status.errorMessage??>
        <div class="error">${spring.status.errorMessage}</div>
    </#if>
</#macro>
