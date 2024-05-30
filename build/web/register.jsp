<%-- Document : register Created on : May 14, 2024, 10:28:22 PM Author : lmao --%>

<%@page import="user.UserError" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Register</title>
    </head>

    <body class="back">
        <% UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            } %>

        <div class="container">
            <!-- Login form -->
            <div class="container h-100 ">
                <div class="row justify-content-center align-items-center mt-5">
                    <div class="col-md-6"> 
                        <div class="card p-4">
                            <H1 class="text-center"
                                style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">
                                REGISTER</H1>
                            <form action="MainController" method="POST">
                                <div class="form-group">
                                    <label for="user">UserName</label>
                                    <input type="text" class="form-control" id="user" name="userID" required=""
                                           placeholder="UserName" />
                                    <% if (!userError.getUserID().isEmpty()) {%>
                                    <div class="alert alert-danger mt-3" role="alert">
                                        <%= userError.getUserID()%>
                                    </div>
                                    <% } %>
                                </div>

                                <div class="form-group">
                                    <label for="fullName"> Full Name</label>
                                    <input type="text" class="form-control" id="fullName"
                                           name="fullName" required="" placeholder="Full Name" />
                                    <% if (!userError.getFullName().isEmpty()) {%>
                                    <div class="alert alert-danger mt-3" role="alert">
                                        <%= userError.getFullName()%>
                                    </div>
                                    <% } %>
                                </div>

                                <div class="form-group">
                                    <label for="role"> Full Name</label>
                                    <input type="text" id="role" name="roleID" value="US" readonly=""
                                           placeholder="Role ID" />
                                </div>

                                <div class="form-group">
                                    <label for="pass"> Password </label>
                                    <input type="password" id="pass" name="password" required=""
                                           placeholder="Password" />

                                </div>

                                <div class="form-group">
                                    <label for="confirm"> Confirm </label>
                                    <input type="password" id="confirm" name="confirm" required=""
                                           placeholder="Confirm" />
                                    <% if (!userError.getConfirm().isEmpty()) {%>
                                    <div class="alert alert-danger mt-3" role="alert">
                                        <%= userError.getConfirm()%>
                                    </div>
                                    <% }%>
                                </div>

                                <div class="btn-group-vertical d-flex justify-content-around mt-3">
                                    <button class="btn btn-primary mt-3" name="action" value="Create">Create</button>
                                    <button class="btn btn-warning mt-3" type="reset" value="Reset"> Reset</button>
                                    <button class="btn btn-success mt-3"> <a href="./login.jsp">Back to Login</a> </button>
                                </div>
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