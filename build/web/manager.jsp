<%-- 
    Document   : admin
    Created on : Sep 28, 2022, 5:10:03 PM
    Author     : hd
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRoleID() != 1)) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        Welcome: <h1><%= loginUser.getFullName()%></h1>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
            <input type="submit" name="action" value="InsertPage">
        </form>
        <form action="MainController" method="post">
            Search <input type="text" name="search" value="<%= search%>"/>
            <select name="SearchBy">
                <option value="ID">ID</option>
                <option value="NAME">NAME</option>
            </select>
            <input type="submit" name="action" value="Search"/>
        </form>
        <div>
            <form action="MainController" method="post">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>mobileID</th>
                            <th>mobileName</th>
                            <th>Price</th>
                            <th>quantity</th>
                            <th>description</th>
                            <th>yearOfProduction</th>
                            <th>notSale</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                        %>
                        <c:forEach var="product" items="${LIST_PRODUCT}">
                            <tr>
                        <form action="MainController" method="post">
                            <td>
                                <%= count++%>
                            </td>
                            <td>
                                <input type="text" name="mobileID" value="${product.getMobileID()}" readonly="">
                            </td>
                            <td>
                                <input type="text" name="mobileName" value="${product.getMobileName()}" readonly="">
                            </td>
                            <td>
                                <input type="number" step="any" name="Price" value="${product.getPrice()}" required="" min="0">
                            </td>
                            <td>
                                <input type="number" name="quantity" value="${product.getQuantity()}" required="" min="0">
                            </td>
                            <td>
                                <input type="text" name="Description" value="${product.getDescription()}" required="">
                            </td>
                            <td>
                                <input type="number" name="YearOfProduction" value="${product.getYearOfProduction()}" readonly="" min="0">
                            </td>
                            <td>
                                <input type="number" name="notSale" value="${product.getNotSale()}" required="" min="0">
                            </td>
                            <td>
                                <input type="hidden" name="sku" value="${product.getMobileID()}">
                                <input type="submit" name="action" value="Update">
                                <input type="submit" name="action" value="Delete">
                            </td>
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>  
            </form>
        </div>
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

