<%-- 
    Document   : register
    Created on : May 14, 2024, 10:28:22 PM
    Author     : lmao
--%>

<%@page import="user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Register</title>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>

        <div>
            <!-- Login form -->
            <div>

                <div>
                    <div>
                        <H1>
                            REGISTER</H1>
                    </div>
                    <form action="MainController" method="POST">
                        <div>
                            <label>
                                <p>UserName: </p><input type="text" name="userID" required="" placeholder="UserName"/>
                                <% if (!userError.getUserID().isEmpty()) {
                                %> 
                                <br> <p style="color: red">
                                    <%= userError.getUserID()%>
                                </p>
                                <%
                                    }
                                %>
                            </label>

                        </div>

                        <div>
                            <label> 
                                <p>Full Name: </p><input type="text" name="fullName" required="" placeholder="Full Name"/>
                                <% if (!userError.getFullName().isEmpty()) {
                                %> 
                                <br> <p style="color: red">
                                    <%= userError.getFullName()%>
                                </p>
                                <%
                                    }
                                %>
                            </label>
                        </div> 

                        <div>
                            <label>
                                <p>Role ID: </p><input type="text" name="roleID" value="US" readonly="" placeholder="Role ID"/>
                            </label> 
                        </div>

                        <div>
                            <label> 
                                <p>Password: </p> <input type="password" name="password" required="" placeholder="Password"/>
                            </label> 
                        </div>

                        <div>
                            <label> 
                                <p>Confirm: </p> <input type="password" name="confirm" required="" placeholder="Confirm"/>
                                <% if (!userError.getConfirm().isEmpty()) {
                                %> 
                                <br> <p style="color: red">
                                    <%= userError.getConfirm()%>
                                </p>
                                <%
                                    }
                                %>
                            </label>

                        </div>
                        <input" type="submit" name="action" value="Create"/> <br />
                        <input" type="reset"  value="Reset"/> <br />
                        <button> <a href="./login.jsp">Back to Login</a> </button>

                    </form>
                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
    </body>
</html>
