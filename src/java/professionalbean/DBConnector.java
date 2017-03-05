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
public class DBConnector implements Serializable {
    
   private Connection dbconnection;

   public DBConnector(){
       try {     
           Class.forName("com.mysql.jdbc.Driver");
           dbconnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/billingdb?user=root&password=mustafa11&useSSL=false");           
       }
       catch(Exception e){
           System.out.println(e);
       }
   }

   public Connection getDbconnection() {
       return(dbconnection);
   }
}
