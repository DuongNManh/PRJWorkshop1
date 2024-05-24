<%-- 
    Document   : user
    Created on : Sep 28, 2022, 5:10:19 PM
    Author     : hd
--%>

<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Hello User!</h1>
        <% 
            UserDTO loginUser= (UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser== null || loginUser.getRoleID() != 0){
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        User ID:<h1><%= loginUser.getUserID()%></h1>
        Full Name:<h1><%= loginUser.getFullName()%></h1>
        Role ID:<h1><%= loginUser.getRoleID()%></h1>
        Password:<h1><%= loginUser.getPassword()%></h1>
    </body>
</html>
