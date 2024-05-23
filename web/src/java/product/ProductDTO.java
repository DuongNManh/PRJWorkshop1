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
    String SKU;
    String Name;
    double Price;
    String Description;
    int Quantity;

    public ProductDTO() {
    }

    public ProductDTO(String SKU, String Name, double Price, String Description, int Quantity) {
        this.SKU = SKU;
        this.Name = Name;
        this.Price = Price;
        this.Description = Description;
        this.Quantity = Quantity;
    }
    
    public ProductDTO(String SKU, String Name, double Price, String Description) {
        this.SKU = SKU;
        this.Name = Name;
        this.Price = Price;
        this.Description = Description;
    }
    
    public ProductDTO(String SKU, String Name, double Price, int Quantity) {
        this.SKU = SKU;
        this.Name = Name;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public String getSKU() {
        return SKU;
    }

    public void setSKU(String SKU) {
        this.SKU = SKU;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "SKU=" + SKU + ", Name=" + Name + ", Price=" + Price + ", Description=" + Description + ", Quantity=" + Quantity + '}';
    }

    
}
