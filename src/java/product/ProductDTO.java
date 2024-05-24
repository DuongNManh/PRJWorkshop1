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
public class ProductDTO {

    String mobileID;
    String description;
    float price;
    String mobileName;
    int yearOfProduction;
    int Quantity;
    int noSale;

    public ProductDTO() {
    }

    public ProductDTO(String mobileID, String description, float price, String mobileName, int yearOfProduction, int Quantity, int noSale) {
        this.mobileID = mobileID;
        this.description = description;
        this.price = price;
        this.mobileName = mobileName;
        this.yearOfProduction = yearOfProduction;
        this.Quantity = Quantity;
        this.noSale = noSale;
    }

    public String getMobileID() {
        return mobileID;
    }

    public void setMobileID(String mobileID) {
        this.mobileID = mobileID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getMobileName() {
        return mobileName;
    }

    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getNotSale() {
        return noSale;
    }

    public void setNotSale(int notSale) {
        this.noSale = notSale;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "mobileID=" + mobileID + ", description=" + description + ", price=" + price + ", mobileName=" + mobileName + ", yearOfProduction=" + yearOfProduction + ", Quantity=" + Quantity + ", notSale=" + noSale + '}';
    }
    
    

    
}
