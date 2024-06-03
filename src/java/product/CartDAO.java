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
public class CartDAO {

    private static final String SEARCH = "SELECT m.mobileID, m.mobileName, m.price, up.quantity FROM user_product up JOIN tbl_Mobile m ON up.mobileID = m.mobileID WHERE up.userID = ?";

    private static final String DELETE = "DELETE MobileManagement.dbo.user_product WHERE (userID= ? AND mobileID = ?)";
    private static final String UPDATE = "UPDATE MobileManagement.dbo.user_product SET quantity=? WHERE (userID= ? AND mobileID = ?)";
    private static final String CHECK_DUPLICATE = "SELECT * FROM MobileManagement.dbo.user_product WHERE (userID= ? AND mobileID = ?)";
    private static final String INSERT = "INSERT INTO MobileManagement.dbo.user_product (userID, mobileID, quantity) VALUES(?,?,?)";

    public void addToCart(CartDTO cart) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                PreparedStatement stmt = conn.prepareStatement(INSERT);
                stmt.setString(1, cart.getUserID());
                stmt.setString(2, cart.getMobileID());
                stmt.setInt(3, cart.getQuantity());
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public boolean removeFromCart(CartDTO cart) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        int rs;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                PreparedStatement stmt = conn.prepareStatement(DELETE);
                stmt.setString(1, cart.getUserID());
                stmt.setString(2, cart.getMobileID());
                rs = stmt.executeUpdate();
                if (rs == 1) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean checkDuplicate(CartDTO cart) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, cart.getUserID());
                ptm.setString(2, cart.getMobileID());
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
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
        return false;
    }

    public List<CartDTO> getCartDetails(String userID) throws SQLException {
        List<CartDTO> cartDetails = new ArrayList<>();
        Connection conn = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                PreparedStatement stmt = conn.prepareStatement(SEARCH);
                stmt.setString(1, userID);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    CartDTO cart = new CartDTO();
                    cart.setUserID(userID);
                    cart.setMobileID(rs.getString("mobileID"));
                    cart.setQuantity(rs.getInt("quantity"));
                    // add product details to ProductDTO
                    ProductDTO product = new ProductDTO();
                    product.setMobileID(rs.getString("mobileID"));
                    product.setMobileName(rs.getString("mobileName"));
                    product.setPrice(rs.getFloat("price"));
                    cart.setMobile(product);
                    cartDetails.add(cart);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return cartDetails;
    }
    
    public boolean update(CartDTO cart) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        int rs = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setInt(1, cart.getQuantity());
                ptm.setString(2, cart.getUserID());
                ptm.setString(3, cart.getMobileID());
                rs = ptm.executeUpdate();
                if (rs == 1) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
         Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, "duong");
                ptm.setString(2, "M001");
                rs = ptm.executeQuery();
                if (rs.next()) {
                    System.out.println("true");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
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
        System.out.println("false");

    }

}
