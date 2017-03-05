/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package professionalbean;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;


/**
 *
 * @author admin
 */
public class Update_Product implements Serializable {
   
                Connection con;
                PreparedStatement pst;
                                
                private String id;
                private String pnm;
                private double purchase;
                private double selling;
                private double stock;
                private String unit;
                
                public Update_Product() {
                    id = "Not Found";
                    pnm = "Not Found";
                    purchase = 0.0;
                    selling = 0.0;
                    stock = 0.0;
                    unit = "Not Found";
                }

    public void setId(String id) {
        this.id = id;
    }

    public void setPnm(String pnm) {
        this.pnm = pnm;
    }

    public void setPurchase(double purchase) {
        this.purchase = purchase;
    }

    public void setSelling(double selling) {
        this.selling = selling;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }

    public void setUnit(String unit) {
        this.unit = unit;
        onDataChanged();
    }
                
                

    private void onDataChanged() {
        try {

                    Class.forName("com.mysql.jdbc.Driver");

                    DBConnector dbc = new DBConnector();
                    con = dbc.getDbconnection();

                    pst=con.prepareStatement("update products set purchase_price = ? , selling_price = ? , stock = ? , unit = ? where usr_id = ? and prod_name = ?;");
                    pst.setDouble(1,purchase);
                    pst.setDouble(2,selling);
                    pst.setDouble(3,stock);
                    pst.setString(4,unit);
                    pst.setString(5,id);
                    pst.setString(6,pnm);

                    pst.executeUpdate();
                    
                    
                }
                catch(Exception e){
                    pnm = e.getMessage();
                }
    }
                
                

}
