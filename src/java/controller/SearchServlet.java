/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author hd
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    private static final String ERROR = "manager.jsp";
    private static final String SUCCESS = "manager.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            String searchType = request.getParameter("SearchBy");
            ProductDAO dao = new ProductDAO();
            if (search == null) {
                search = "";
            }
            List<ProductDTO> listProduct = dao.getListProducts(search, searchType);
            if (!listProduct.isEmpty()) {
                request.setAttribute("LIST_PRODUCT", listProduct);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", "No products found");
            }
        } catch (Exception e) {
            log("Error at SearchServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void main(String[] args) {
        String url = ERROR;
        try {
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listProduct = dao.getListProducts("1");
            if (listProduct.size() > 0) {
                for (ProductDTO productDTO : listProduct) {
                    System.out.println(productDTO.toString());
                }
                url = SUCCESS;
            } else {
                System.out.println("No products found");
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
//            request.getRequestDispatcher(url).forward(request, response); 
        }
    }
}
