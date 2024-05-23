<%-- 
    Document   : login
    Created on : May 10, 2024, 8:08:33 AM
    Author     : Luu Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" />

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
        <title>JSP Login</title>
    </head>
    <body>

        <div class="limiter">
            <!-- Login form -->
            <div class="container-login100">

                <div class="wrap-login100v2">
                    <div>
                        <H1 class="login100-form-title">
                            LOGIN</H1>
                    </div>
                        <form class="wrap-child" action="MainController" method="POST">
                            <div class="wrap-input100 ">
                                <label>
                                    <p>Enter username: </p><input type="text" name="user">
                                </label> <br /><!-- comment -->
                            </div>

                            <div class="wrap-input100 ">
                                <label>
                                    <p>Enter password: </p><input type="password" name="pass">
                                </label> <br />
                            </div>
                            <input class="login100-form-btn" type="submit" name="action" value="Login"> <br />
                            <input class="login100-form-btn" type="reset" value="Reset"/> <br />
                            <input class="login100-form-btn" type="submit" name="action" value="Register"/>
                            <button> <a href="ProductServlet" class="txt2">Click here to buy products</a></button>
                            <% String error = (String) request.getAttribute("error");
                                if (error != null
                                        && !error.isEmpty()) {%>
                            <div class="h33">
                                <p style="color: red">
                                    <%= error%>
                                </p>
                            </div>
                            <% }%>
                        </form>
                    </div>
                </div>
            </div>

    </body>


</html>
