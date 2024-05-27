<%-- 
    Document   : insert
    Created on : May 27, 2024, 5:24:17 PM
    Author     : lmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Insert</title>
    </head>
    <body>
        <form action="MainController" method="post">

            <input type="text" name="mobileID" value="${product.getMobileID()}" required="">


            <input type="text" name="mobileName" value="${product.getMobileName()}" required="">


            <input type="text" name="Price" value="${product.getPrice()}" required="">


            <input type="text" name="quantity" value="${product.getQuantity()}" required="">


            <input type="text" name="Description" value="${product.getDescription()}" required="">


            <input type="text" name="notSale" value="${product.getNotSale()}" required="">


            <input type="text" name="YearOfProduction" value="${product.getYearOfProduction()}" required="">
            
            <input type="submit" name="action" value="Insert">
        </form>
    </body>
</html>
