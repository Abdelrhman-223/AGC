<%-- 
    Document   : login
    Created on : May 18, 2023, 6:59:00 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="styleSheets/StyleSheet.css">
        <title>Login</title>
    </head>
    <body class="loginPage">
        <div class="loginPageBody">
            <img src="assets/Images/Logo.png" alt="Logo" class="loginLogo alignCenter">
            <div class="loginForm">
                <input id="UserID" class="textBox alignCenter" placeholder="User ID" value="">
                <input id="Password" class="textBox alignCenter" placeholder="Password" type="password" value="">
                <button id="loginButton" class="button alignCenter" onclick="loginButton()">Login</button><!-- formaction="htmlPages/employee.html" -->
            </div>
        </div>

        <script src="Js/jsScript.js"></script>
        <script src="Js/employeeScript.js"></script>
    </body>
</html>
