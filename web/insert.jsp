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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Insert</title>
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

            <input type="text" name="Price" placeholder="Price" required="">

            <input type="text" name="quantity" placeholder="quantity" required="">

            <input type="text" name="Description" placeholder="Description" required="">

            <input type="text" name="notSale" placeholder="notSale" required="">

            <input type="text" name="YearOfProduction" placeholder="YearOfProduction" required="">

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
    </body>
</html>
