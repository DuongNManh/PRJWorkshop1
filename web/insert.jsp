<%-- 
    Document   : insert
    Created on : May 27, 2024, 5:24:17 PM
    Author     : lmao
--%>

<%@page import="user.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Insert Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRoleID() != 1)) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>

        Welcome: <h1><%= loginUser.getFullName()%></h1>
        <a href="./manager.jsp">back</a>
        <form action="MainController" method="post">

            <input type="text" name="mobileID" placeholder="mobileID" required="">

            <input type="text" name="mobileName" placeholder="mobileName" required="">

            <input type="number" step="any" name="Price" placeholder="Price" required="" min="0">

            <input type="number" name="quantity" placeholder="quantity" required="" min="0">

            <input type="text" name="Description" placeholder="Description" required="">

            <input type="number" name="notSale" placeholder="notSale" required="" min="0">

            <input type="number" name="YearOfProduction" placeholder="YearOfProduction" required="" min="0">

            <input type="submit" name="action" value="Insert">
        </form>
        <div>
            <c:if test="${not empty SUCCESS}">
                <p>SUCCESS: ${SUCCESS}</p>
            </c:if>
            <c:if test="${not empty ERROR}">
                <p>Error: ${ERROR}</p>
            </c:if>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
    </body>
</html>
