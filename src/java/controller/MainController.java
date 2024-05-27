/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hd
 */
@WebServlet(name = "MainController", urlPatterns = "/MainController")
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginServlet";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "./register.jsp";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchServlet";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteServlet";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateServlet";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutServlet";
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "RegisterServlet";
    private static final String ADD = "Add";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartServlet";
    private static final String VIEW = "ViewCart";
    private static final String VIEW_CART = "viewCart.jsp";
    private static final String CHANGE = "Change";
    private static final String CHANGE_CONTROLLER = "ChangeServlet";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveServlet";
    private static final String PRODUCT = "ViewProduct";
    private static final String VIEW_PRODUCT = "ProductServlet";
    private static final String INSERT_PAGE = "InsertPage";
    private static final String GO_INSERT_PAGE = "GoToInsertPage";
    private static final String INSERT = "Insert";
    private static final String INSERT_CONTROLLER = "InsertServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String action = request.getParameter("action");
            switch (action) {
                case LOGIN:
                    url = LOGIN_CONTROLLER;
                    break;
                case REGISTER:
                    url = REGISTER_CONTROLLER;
                    break;
                case SEARCH:
                    url = SEARCH_CONTROLLER;
                    break;
                case DELETE:
                    url = DELETE_CONTROLLER;
                    break;
                case UPDATE:
                    url = UPDATE_CONTROLLER;
                    break;
                case LOGOUT:
                    url = LOGOUT_CONTROLLER;
                    break;
                case CREATE:
                    url = CREATE_CONTROLLER;
                    break;
                case ADD:
                    url = ADD_TO_CART_CONTROLLER;
                    break;
                case VIEW:
                    url = VIEW_CART;
                    break;
                case CHANGE:
                    url = CHANGE_CONTROLLER;
                    break;
                case REMOVE:
                    url = REMOVE_CONTROLLER;
                    break;
                case PRODUCT:
                    url = VIEW_PRODUCT;
                    break;
                case INSERT_PAGE:
                    url = GO_INSERT_PAGE;
                    break;
                case INSERT:
                    url = INSERT_CONTROLLER;
                    break;
                default:
                    request.setAttribute("ERROR", "Action is not supported");
                    break;
            }
        } catch (Exception e) {
            log("ERROR at MainController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        processRequest(request, response);
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
