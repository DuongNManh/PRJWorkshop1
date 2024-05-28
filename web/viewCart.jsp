<%-- 
    Document   : viewCart
    Created on : Oct 15, 2022, 4:36:03 PM
    Author     : hd
--%>

<%@page import="product.ProductDTO"%>
<%@page import="product.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đồ Sơ Sinh Page</title>
    </head>
    <body>
        <h1>Bạn đã chọn những sản phẩm này nè:</h1>
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1" class="container">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Change</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (ProductDTO p : cart.getCart().values()) {
                        total += p.getPrice() * p.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td> 
                        <input type="text" name="id" value="<%= p.getMobileID()%>" readonly=""/>
                    </td>
                    <td><%= p.getMobileName()%></td>
                    <td>
                        <input type="number" min="1" name="quantity" value="<%= p.getQuantity()%>" required=""/>
                    </td>
                    <td><%= p.getPrice()%>$</td>
                    <td><%= p.getPrice() * p.getQuantity()%>$</td>
                    <td>
                        <input type="submit" name="action" value="Change"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                </tr>
            </form>

            <%
                }
            %>

        </tbody>
    </table>

    <h1>Total:<%= total%> $  </h1>      
    <%
        }
    %>
    </br>
    <a href="ProductServlet">Add more</a>
</body>
</html>
