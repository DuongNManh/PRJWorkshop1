/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.*;

/**
 *
 * @author Luu Minh Quan
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/loginservlet"})
public class LoginServlet extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String US = "US";
    private static final String USER_PAGE = "product.jsp";
    private static final String MN = "manager.jsp";
    private static final String MANAGER_PAGE = "manager.jsp";

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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String url= ERROR;
        try {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(user, pass);           
            String ms = "";
            // xac thuc trong database
            if (loginUser != null) {
                System.out.println("user: "+loginUser.getUserID()+ " pass: "+loginUser.getPassword());
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
//              phan quyen
                int roleID = loginUser.getRoleID();
                switch (roleID) {
                    case 0:
                        url = ADMIN_PAGE;
                        break;
                    case 1: 
                        url = MANAGER_PAGE;
                        break;
                    case 2:
                        url = USER_PAGE;
                        break;                    
                    default:
                        request.setAttribute("ERROR", "Your role is not support!");
                        break;
                }
            } else {
                String msg = "username or password incorect";
                request.setAttribute("error", msg);
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);

            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
            request.setAttribute("error", "Internal server error");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }finally{
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
