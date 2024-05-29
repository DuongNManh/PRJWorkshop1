<%-- Document : user Created on : Sep 28, 2022, 5:10:19 PM Author : hd --%>

<%@page import="java.util.List" %>
<%@page import="user.UserDTO" %>
<%@page import="user.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>

    <body class="back">

        <% UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null
                    || loginUser.getRoleID() != 2) {
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
                                }%>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <h2>
                    Welcome: <%= loginUser.getFullName()%>
                </h2>
                <div>
                    <form action="MainController" method="post">
                        <input type="number" step="any" name="min" min="0">
                        <input type="number" step="any" name="max" min="0">
                        <button class="btn btn-outline-success" name="action"
                                value="ViewProduct">
                            Search
                        </button>
                    </form>
                </div>
                <div>
                    <form action="MainController" method="post">
                        <button class="btn btn-outline-primary" name="action" value="ViewCart">
                            View Cart
                        </button>
                        <button class="btn btn-outline-danger" name="action" value="Logout">
                            LogOut
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <div class="container-fluid table-responsive">
            <form action="MainController" method="post">
                <table class="table table-striped table-hover table-bordered align-middle ">
                    <thead>
                        <tr class="table-info">
                            <th>mobileID</th>
                            <th>Mobile Name</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Year Of Production</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="table-light">
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
                                <input type="hidden" name="sku"
                                       value="${product.getMobileID()}">

                                <button class="btn btn-outline-primary" name="action"
                                        value="Add">
                                    Add
                                </button>
                            </td>
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </form>
        </div>

        <% String message = (String) request.getAttribute("MESSAGE");
                                    if (message == null) {
                                        message = "";
                                    }%>
        <%= message%>
    </body>

</html>