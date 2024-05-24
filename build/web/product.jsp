<%-- 
    Document   : product
    Created on : May 12, 2024, 10:23:25 PM
    Author     : lmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/table.css"/>
        <link rel="stylesheet" href="css/util.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Product</title>
    </head>
    <body>
        <div class="flex-col">
            <div>
                <form action="MainController" method="post">
                    <table border="1" class="table">
                        <thead>
                            <tr>
                                <th scope="col">mobileID</th>
                                <th scope="col">mobileName</th>
                                <th scope="col">Price</th>
                                <th scope="col">description</th>
                                <th scope="col">yearOfProduction</th>
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
                                <<td>${product.getYearOfProduction()}</td>
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
            </div
                
            <div>
                <form action="MainController" method="post">
                    <input type="submit" name="action" value="ViewProduct">
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
