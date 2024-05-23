<%-- 
    Document   : register
    Created on : May 14, 2024, 10:28:22 PM
    Author     : lmao
--%>

<%@page import="user.UserError"%>
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
        <title>JSP Register</title>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>

        <div class="limiter">
            <!-- Login form -->
            <div class="container-login100">

                <div class="wrap-login100v2">
                    <div>
                        <H1 class="login100-register-title">
                            REGISTER</H1>
                    </div>
                    <form class="wrap-child" action="MainController" method="POST">
                        <div class="wrap-input100">
                            <label>
                                <p>Enter  User ID: </p><input type="text" name="userID" required=""/>
                                <% if (!userError.getUserID().isEmpty()) {
                                %> 
                                <br> <p style="color: red">
                                    <%= userError.getUserID()%>
                                </p>
                                <%
                                    }
                                %>
                            </label>

                        </div>

                        <div class="wrap-input100">
                            <label> 
                                <p>Full Name: </p><input type="text" name="fullName" required=""/>
                                <% if (!userError.getFullName().isEmpty()) {
                                %> 
                                <br> <p style="color: red">
                                    <%= userError.getFullName()%>
                                </p>
                                <%
                                    }
                                %>
                            </label>
                        </div> 

                        <div class="wrap-input100">
                            <label>
                                <p>Role ID: </p><input type="text" name="roleID" value="US" readonly=""/>
                            </label> 
                        </div>

                        <div class="wrap-input100">
                            <label> 
                                <p>Password: </p> <input type="password" name="password" required=""/>
                            </label> 
                        </div>

                        <div class="wrap-input100">
                            <label> 
                                <p>Confirm: </p> <input type="password" name="confirm" required=""/>
                                <% if (!userError.getConfirm().isEmpty()) {
                                %> 
                                <br> <p style="color: red">
                                    <%= userError.getConfirm()%>
                                </p>
                                <%
                                    }
                                %>
                            </label>

                        </div>
                        <input class="login100-form-btn" type="submit" name="action" value="Create"/> <br />
                        <input class="login100-form-btn" type="reset"  value="Reset"/> <br />
                        <button class="login100-form-btn"> <a href="./login.jsp">Back to Login</a> </button>

                    </form>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
