/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import controller.ProductServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author hd
 */
public class ProductDAO {

    private static final String SEARCH = "SELECT * FROM UserManagement.dbo.tblProducts";

    public List<ProductDTO> getListProducts(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                //ptm.setString(1, "%" + search + "%");
                // what is this code do?
                // ptm.setString(1, "%" + search + "%");
                // this code is used to search for a product by its name
                // if the search is "" then it will return all products 
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String SKU = rs.getString("SKU");
                    String Name = rs.getString("Name");
                    double Price = rs.getDouble("Price");
                    String Description = rs.getString("Description");
                    int Quantity = rs.getInt("Quantity");
                    list.add(new ProductDTO(SKU, Name, Price, Description, Quantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public static void main(String[] args) {
        System.out.println("List of Product");
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> productList;
        try {
            productList = dao.getListProducts("");
            for (ProductDTO productDTO : productList) {
                    System.out.println(productDTO.toString());
                }
        } catch (SQLException ex) {
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }

//    public boolean delete(String userID) throws SQLException {
//        boolean checkDelete = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(DELETE);
//                ptm.setString(1, userID);
//                checkDelete = ptm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return checkDelete;
//    }
//
//    public boolean update(UserDTO user) throws SQLException {
//        boolean checkUpdate = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(UPDATE);
//                ptm.setString(1, user.getFullName());
//                ptm.setString(2, user.getRoleID());
//                ptm.setString(3, user.getUserID());
//                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return checkUpdate;
//    }
//
//    public boolean checkDuplicate(String userID) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(CHECK_DUPLICATE);
//                ptm.setString(1, userID);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    check = true;
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
//
//    public boolean insert(UserDTO user) throws SQLException {
//        boolean checkInsert = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(INSERT);
//                ptm.setString(1, user.getUserID());
//                ptm.setString(2, user.getFullName());
//                ptm.setString(3, user.getRoleID());
//                ptm.setString(4, user.getPassword());
//                checkInsert = ptm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return checkInsert;
//    }
//
//    public boolean insertV2(UserDTO user) throws ClassNotFoundException, SQLException {
//        boolean checkInsert = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(INSERT);
//                ptm.setString(1, user.getUserID());
//                ptm.setString(2, user.getFullName());
//                ptm.setString(3, user.getRoleID());
//                ptm.setString(4, user.getPassword());
//                checkInsert = ptm.executeUpdate() > 0 ? true : false;
//            }
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return checkInsert;
//    }

}
