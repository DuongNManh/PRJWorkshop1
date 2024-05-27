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
import javax.servlet.http.HttpSession;
import product.ProductDAO;
import product.ProductDTO;
import user.UserDTO;

/**
 *
 * @author lmao
 */
@WebServlet(name = "InsertServlet", urlPatterns = { "/InsertServlet" })
public class InsertServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        String mobileID = request.getParameter("mobileID");
        String mobileName = request.getParameter("mobileName");
        String description = request.getParameter("Description");
        float price = Float.parseFloat(request.getParameter("Price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int notSale = Integer.parseInt(request.getParameter("notSale"));
        int yearOfProduction = Integer.parseInt(request.getParameter("YearOfProduction"));

        if (loginUser != null && loginUser.getRoleID() == 1){
            try {
                ProductDTO productDTO = new ProductDTO(mobileID, description, price, mobileName, yearOfProduction, quantity,
                        notSale);
                ProductDAO dao = new ProductDAO();
                // check duplicate mobileID before inserting
                if (dao.checkDuplicate(mobileID)) {
                    request.setAttribute("ERROR", "Duplicate mobileID!");
                    request.getRequestDispatcher("insert.jsp").forward(request, response);
                } else {
                    boolean check = dao.insertV2(productDTO);
                    if (check) {
                        request.setAttribute("SUCCESS", "Insert Success!");
                    } else {
                        request.setAttribute("ERROR", "Insert fail!");
                    }
                }
    
            } catch (Exception e) {
                log("ERROR at InsertServlet: " + e.getMessage());
            } finally {
                request.getRequestDispatcher("insert.jsp").forward(request, response);
            }
        }
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
