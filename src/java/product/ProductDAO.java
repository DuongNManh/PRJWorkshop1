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

    private static final String SEARCH = "SELECT * FROM MobileManagement.dbo.tbl_Mobile";
    private static final String SEARCH_ID = "SELECT * FROM MobileManagement.dbo.tbl_Mobile WHERE (mobileID like ?)";
    private static final String SEARCH_NAME = "SELECT * FROM MobileManagement.dbo.tbl_Mobile WHERE (mobileName like ?)";
    private static final String DELETE = "DELETE MobileManagement.dbo.tbl_Mobile WHERE (mobileID = ?)";
    private static final String UPDATE = "UPDATE MobileManagement.dbo.tbl_Mobile SET description=?, price=?,"
            + " yearOfProduction=? , notSale=? WHERE mobileID=?";
    private static final String CHECK_DUPLICATE = "SELECT mobileID FROM MobileManagement.dbo.tbl_Mobile WHERE mobileID=?  ";
    private static final String INSERT = "INSERT INTO tbl_Mobile (mobileId, description, price, mobileName, yearOfProduction, quantity, noSale) "
            + "                         VALUES(?,?,?,?,?,?,?)";

    public List<ProductDTO> getListProducts(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String mobileID = rs.getString("mobileID");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String mobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int Quantity = rs.getInt("Quantity");
                    int notSale = rs.getInt("noSale");
                    list.add(new ProductDTO(mobileID, description, price, mobileName, yearOfProduction,
                            Quantity, notSale));
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

    public List<ProductDTO> getListProducts(int min, int max) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(SEARCH);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String mobileID = rs.getString("mobileID");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        String mobileName = rs.getString("mobileName");
                        int yearOfProduction = rs.getInt("yearOfProduction");
                        int Quantity = rs.getInt("Quantity");
                        int notSale = rs.getInt("noSale");
                        if (price >= min && price <= max) {
                            list.add(new ProductDTO(mobileID, description, price, mobileName, yearOfProduction,
                                    Quantity, notSale));
                        }
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
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductDTO> getListProducts(String search, String searchType) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql;
                if ("ID".equals(searchType)) {
                    sql = SEARCH_ID;
                } else {
                    sql = SEARCH_NAME;
                }
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String mobileID = rs.getString("mobileID");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String mobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int Quantity = rs.getInt("Quantity");
                    int notSale = rs.getInt("noSale");
                    list.add(new ProductDTO(mobileID, description, price, mobileName, yearOfProduction,
                            Quantity, notSale));
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

    public boolean delete(String userID) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                checkDelete = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            // Log the exception
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Exception while deleting user", e);
        } finally {
            // Close resources
            if (ptm != null) {
                try {
                    ptm.close();
                } catch (SQLException e) {
                    Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Exception while closing PreparedStatement", e);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Exception while closing Connection", e);
                }
            }
        }
        return checkDelete;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getDescription());
                ptm.setString(2, String.valueOf(product.getPrice()));
                ptm.setString(3, String.valueOf(product.getYearOfProduction()));
                ptm.setString(4, String.valueOf(product.getNotSale()));
                checkUpdate = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkUpdate;
    }
    
    public boolean checkDuplicate(String mobileID) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, mobileID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    check= true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    
    public boolean insertV2(ProductDTO product) throws ClassNotFoundException, SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
             
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(INSERT);
                ptm.setString(1, product.getMobileID());
                ptm.setString(2, product.getDescription());
                ptm.setString(3, String.valueOf(product.getPrice()));
                ptm.setString(4, product.getMobileName());
                ptm.setString(5, String.valueOf(product.getYearOfProduction()));
                ptm.setString(6, String.valueOf(product.getQuantity()));
                ptm.setString(7, String.valueOf(product.getNotSale()));
                checkInsert= ptm.executeUpdate()>0;
            }
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
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

}
