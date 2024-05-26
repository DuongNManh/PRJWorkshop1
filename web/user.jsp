<%-- 
    Document   : user
    Created on : Sep 28, 2022, 5:10:19 PM
    Author     : hd
--%>

<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || loginUser.getRoleID() != 2) {
                response.sendRedirect("login.jsp");
                return;
            }
            String min = request.getParameter("min");
            if (min == null) {
                min = "";
            }
            String max = request.getParameter("max");
            if (max == null) {
                max = "";
            }
            
        %>
        <div>Welcome: <h1><%= loginUser.getFullName() %></h1></div>
        
        <div>
            <form action="MainController" method="post">
                <input type="number" name="min">
                <input type="number" name="max">
                <input type="submit" name="action" value="ViewProduct">
            </form>
            <form action="MainController" method="post">
                <table border="1">
                    <thead>
                        <tr>
                            <th >mobileID</th>
                            <th >mobileName</th>
                            <th >Price</th>
                            <th >description</th>
                            <th >yearOfProduction</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                        <form action="MainController" method="post">
                            <td>${product.getMobileID()}</td>
                            <td>${product.getMobileName()}</td>
                            <td>${product.getPrice()}</td>
                            <td>${product.getDescription()}</td>
                            <td>${product.getYearOfProduction()}</td>
                            <td>
                                <select name="select">
                                    <option value="1">1</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                </select>

                            </td>
                            <td>
                                <input type="hidden" name="sku" value="${product.getMobileID()}">
                                <input type="submit" name="action" value="Add">
                            </td>
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>  

                <div>
                    <form action="MainController" method="post">

                        <input type="submit" name="action" value="ViewCart">
                        <input type="submit" name="action" value="Logout">
                    </form> 
                </div>

        </div>

    </form>



    <%
        String message = (String) request.getAttribute("MESSAGE");
        if (message == null) {
            message = "";
        }
    %>
    <%= message%>
</body>
</html>
