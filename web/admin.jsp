<%-- 
    Document   : admin
    Created on : Sep 28, 2022, 5:10:03 PM
    Author     : hd
--%>

<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/table.css"/>
        <link rel="stylesheet" href="css/util.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome: <h1><%= loginUser.getFullName()%></h1>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="action" value="Search"/>

        </form>
        <%
            List<UserDTO> listUser = (List) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="1" class="container">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="userID" value="<%= user.getUserID()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                    </td>
                    <td><%= user.getPassword()%></td>
                    <!--detele o day ne-->
                    <td>
                        <a href="MainController?userID=<%= user.getUserID()%>&action=Delete&search=<%= search%>">Delete</a>
                    </td>
                    <!--update i day ne-->  
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>

        </tbody>
    </table>
    <%
        String success = (String) request.getAttribute("success");
        if (success == null) {
            success = "";
        }
    %>
    <%= success%>
    <%
            
        
    %>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>
    <%
        }
}
    
    %>
</body>
</html>
