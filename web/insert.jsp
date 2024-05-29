<%-- Document : insert Created on : May 27, 2024, 5:24:17 PM Author : lmao --%>

<%@page import="user.UserDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Insert Page</title>
    </head>

    <body class="back">
        <% UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null
                    || (loginUser.getRoleID() != 1)) {
                response.sendRedirect("login.jsp");
                return;
            }%>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <h2>Welcome:
                    <%= loginUser.getFullName()%>
                    <h2>Insert Product</h2>
                    <form action="MainController" method="post">
                        <button class="btn btn-outline-success"><a href="./manager.jsp">back</a></button>
                        <button class="btn btn-outline-danger" name="action" value="Logout"> LogOut </button>
                    </form>
            </div>
        </nav>


        <div class="container pt-5">
            <form class="row gy-2 gx-3 align-items-center" action="MainController" method="post">

                <div class="row g-3">
                    <div class="col-sm">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="mobileID" placeholder="mobileID" required="">
                            <label for="mobileID">Mobile ID</label>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="mobileName" name="mobileName" placeholder="mobileName" required="">
                            <label for="mobileName">Mobile Name</label>
                        </div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-sm-6">
                        <div class="form-floating">
                            <input type="number" step="any" class="form-control" id="Price" name="Price" placeholder="Price" required="" min="0">
                            <label for="Price">Price</label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="quantity" name="quantity" placeholder="quantity" required="" min="0">
                            <label for="quantity">Quantity</label>
                        </div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-sm">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="Description" name="Description" placeholder="Description" required="">
                            <label for="Description">Description</label>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="notSale" name="notSale" placeholder="notSale" required="" min="0">
                            <label for="notSale">Not Sale</label>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="YearOfProduction" name="YearOfProduction" placeholder="YearOfProduction" required="" min="0">
                            <label for="YearOfProduction">Year Of Production</label>     
                        </div>
                    </div>

                    <button class="btn btn-primary" type="submit" name="action" value="Insert">Submit form</button>
            </form>
            <div>
                <c:if test="${not empty SUCCESS}">
                    <div class="alert alert-success" role="alert">
                        SUCCESS: ${SUCCESS}
                    </div>
                </c:if>
                <c:if test="${not empty ERROR}">
                    <div class="alert alert-danger" role="alert">
                        Error: ${ERROR}
                    </div>
                </c:if>
            </div>
        </div>   
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
    </script>
</body>

</html>