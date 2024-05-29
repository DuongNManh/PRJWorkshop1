<%-- Document : login Created on : May 10, 2024, 8:08:33 AM --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Login</title>
    </head>

    <body class="back">
        <div class="container">
            <div class="container h-100 ">
                <div class="row justify-content-center align-items-center mt-5">
                    <div class="col-md-6">
                        <div class="card p-4">
                            <h1 class="text-center"
                                style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">
                                LOGIN</h1>
                            <form action="MainController" method="POST">
                                <div class="form-group">
                                    <label for="user">Enter username:</label>
                                    <input type="text" class="form-control" id="user" name="user"
                                           placeholder="UserName">
                                </div>

                                <div class="form-group">
                                    <label for="pass">Enter password:</label>
                                    <input type="password" class="form-control" id="pass" name="pass"
                                           placeholder="Password">
                                </div>
                                <div class="btn-group-vertical d-flex justify-content-around mt-3">
                                    <button type="submit" class="btn btn-primary" name="action"
                                            value="Login">Login</button>
                                    <button type="reset" class="btn btn-secondary">Reset</button>
                                    <button type="submit" class="btn btn-success" name="action"
                                            value="Register">Register</button>
                                </div>

                                <% String error = (String) request.getAttribute("error");
                                        if (error != null
                                                && !error.isEmpty()) {%>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <%= error%>
                                </div>
                                <% }%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous">
        </script>
    </body>


</html>