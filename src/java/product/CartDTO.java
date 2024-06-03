/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author hd
 */
public class CartDTO {

    private String userID;
    private String mobileID;
    private int quantity;
    private ProductDTO mobile;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getMobileID() {
        return mobileID;
    }

    public void setMobileID(String mobileID) {
        this.mobileID = mobileID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ProductDTO getMobile() {
        return mobile;
    }

    public void setMobile(ProductDTO mobile) {
        this.mobile = mobile;
    }
    
    
    
    public CartDTO() {
    }

    public CartDTO(String userID, String mobileID, int quantity) {
        this.userID = userID;
        this.mobileID = mobileID;
        this.quantity = quantity;
    }

    public CartDTO(String userID, String mobileID, int quantity, ProductDTO mobile) {
        this.userID = userID;
        this.mobileID = mobileID;
        this.quantity = quantity;
        this.mobile = mobile;
    }

    @Override
    public String toString() {
        return "CartDTO{" + "userID=" + userID + ", mobileID=" + mobileID + ", quantity=" + quantity + ", mobile=" + mobile + '}';
    }
    
    
}
