<%-- 
    Document   : viewCart
    Created on : Oct 15, 2022, 4:36:03 PM
    Author     : hd
--%>

<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.CartDTO"%>
<%@page import="product.CartDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body class="back">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null
                    || loginUser.getRoleID() != 2) {
                response.sendRedirect("login.jsp");
                return;
            }
            String userID = (String) loginUser.getUserID();
            CartDAO cartDAO = new CartDAO();
            List<CartDTO> cartDetails = cartDAO.getCartDetails(userID);
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <h2>Welcome: <%= loginUser.getFullName()%></h2>
                <h2>Your Cart</h2>
                <button class="btn btn-outline-success">
                    <a href="ProductServlet" style="text-decoration: none">Add more</a>
                </button>
            </div>

        </nav>

        <div class="container-fluid table-responsive mt-5">
            <table class="table table-striped table-hover table-bordered align-middle ">
                <thead>
                    <tr class="table-info">
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody class="table-light">
                    <%
                        int count = 1;
                        double total = 0;
                        for (CartDTO cart : cartDetails)  {
                            total += cart.getMobile().getPrice() * cart.getQuantity();
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td> <%= cart.getMobileID()%>
                            <input type="hidden" name="id" value="<%= cart.getMobileID()%>" readonly=""/>
                        </td>
                        <td><%= cart.getMobile().getMobileName()%></td>
                        <td>
                            <input type="number" min="1" name="quantity" value="<%= cart.getQuantity()%>" required=""/>
                        </td>
                        <td><%= cart.getMobile().getPrice()%>$</td>
                        <td><%= cart.getMobile().getPrice() * cart.getQuantity()%>$</td>
                        <td>
                            <button class="btn btn-outline-primary" name="action" value="Change">
                                Change
                            </button>
                            <button class="btn btn-outline-danger" name="action" value="Remove">
                                Remove
                            </button>
                        </td>
                    </tr>
                </form>

                <%
                    }
                %>

                </tbody>
            </table>
        </div>
        <div class="alert alert-success" role="alert">
            <h3 class="text-center">Total: <%= total%>$  </h3> 
        </div>
        </br>

    </body>
</html>
