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
import javax.servlet.http.HttpSession;
import product.ProductDAO;
import product.ProductDTO;
import user.UserDTO;

/**
 *
 * @author hd
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    private static final String ERROR = "SearchServlet";
    private static final String SUCCESS = "SearchServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

        if (loginUser != null && loginUser.getRoleID() == 1) {
            try {
                String mobileID = request.getParameter("mobileID");
                System.out.println("Updating product with mobileID: " + mobileID);
                String mobileName = request.getParameter("mobileName");
                System.out.println("Updating product with mobileName: " + mobileName);
                float Price = Float.parseFloat(request.getParameter("Price"));
                System.out.println("Updating product with mobileName: " + Price);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                System.out.println("Updating product with mobileName: " + quantity);
                String Description = request.getParameter("Description");
                int notSale = Integer.parseInt(request.getParameter("notSale"));
                int YearOfProduction = Integer.parseInt(request.getParameter("YearOfProduction"));
                ProductDTO product = new ProductDTO(mobileID, Description, Price, mobileName, YearOfProduction, quantity, notSale);
                ProductDAO productDAO = new ProductDAO();

                boolean checkUpdate = productDAO.update(product);
                if (checkUpdate) {
                    System.out.println("update success!");
                    request.setAttribute("SUCCESS", "Update Success!");
                    url = SUCCESS;
                } else {
                    System.out.println("update fail!");
                    request.setAttribute("ERROR", "Update fail!");
                }

            } catch (Exception e) {
                log("Error at UpdateController: " + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
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
