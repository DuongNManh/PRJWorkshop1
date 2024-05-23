/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author lmao
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/registerservlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "register.jsp";
        UserDAO dao = new UserDAO();
        UserError userError = new UserError();
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            boolean checkValidation = true;
            if (userID.length() > 50 || userID.length() < 2) {
                userError.setUserID("Useer ID must [2,50]");
                checkValidation = false;
            }
//            boolean checkDuplicate= dao.checkDuplicate(userID);
//            if(checkDuplicate){
//                userError.setUserID("Duplicate userID!");
//                checkValidation= false;
//            }
            if (fullName.length() > 50 || fullName.length() < 5) {
                userError.setFullName("fullName  must [5,50]");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirm("Must be like Password!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password);

                //                boolean checkInsert= dao.insert(user);
                boolean checkInsert = dao.insertV2(user);
                if (checkInsert) {
                    url = "login.jsp";
                }
            } else {
                request.setAttribute("USER_ERROR", userError);

            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserID("ID is duplicate!");
                request.setAttribute("USER_ERROR", userError);
            }

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
