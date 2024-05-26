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
        <title>JSP Login</title>
    </head>
    <body>

                        <H1>
                            LOGIN</H1>
                        <form action="MainController" method="POST">
                            <div>
                                <label>
                                    <p>Enter username: </p><input type="text" name="user">
                                </label> <br /><!-- comment -->
                            </div>

                            <div>
                                <label>
                                    <p>Enter password: </p><input type="password" name="pass">
                                </label> <br />
                            </div>
                            <input type="submit" name="action" value="Login"> <br />
                            <input type="reset" value="Reset"/> <br />
                            <input type="submit" name="action" value="Register"/>
                            <% String error = (String) request.getAttribute("error");
                                if (error != null
                                        && !error.isEmpty()) {%>
                            <div>
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
