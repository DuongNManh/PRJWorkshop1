<%-- 
    Document   : welcome
    Created on : May 10, 2024, 8:19:30 AM
    Author     : Luu Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <body>
        <%
            String ms = (String) request.getAttribute("success");
            String wc = (String) session.getAttribute("us");
        %>

        <style>
            .h33 {
                margin-bottom: 20px;
            }

            h1 {
                font-size: 24px;
            }

            p {
                font-size: 18px;
            }

            form {
                margin-top: 20px;
            }

            input[type="checkbox"] {
                margin-bottom: 10px;
            }

            input[type="submit"] {
                margin-top: 10px;
            }
        </style>

        <div class="h33">
            <h1 style="color: orange"><%= ms%></h1> <br>
        </div>  
        <div class="h33">
            <p style="color: brown">The time of the server is: <%= new java.util.Date()%></p>
        </div>
        
            <jsp:forward page="ProductServlet"/>

            <form action="MainController" method="post" class="wrap-login100">
                <input type="submit" name="action" value="Logout"/>
                
            </form>

    </body>
</html>
