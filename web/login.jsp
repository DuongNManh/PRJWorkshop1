<%-- 
    Document   : login
    Created on : May 10, 2024, 8:08:33 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Login</title>
    </head>
    <body class="main-bg">

        <div class="container">
            <div class="row justify-content-center mt-5">

            </div>
        </div>
        <H1>
            LOGIN</H1>
        <form action="MainController" method="POST">
            <div>
                <label>
                    <p>Enter username: </p><input type="text" name="user" placeholder="UserName">
                </label> <br /><!-- comment -->
            </div>

            <div>
                <label>
                    <p>Enter password: </p><input type="password" name="pass" placeholder="Password">
                </label> <br />
            </div>
            <input type="submit" name="action" value="Login"> <br />
            <input type="reset" value="Reset"/> <br />
            <input type="submit" name="action" value="Register"/>
            <% String error = (String) request.getAttribute("error");
                if (error != null
                        && !error.isEmpty()) {%>
            <div>
                <p style="color: red">
                    <%= error%>
                </p>
            </div>
            <% }%>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>

</body>


</html>
