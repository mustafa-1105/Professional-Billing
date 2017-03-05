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
public class UserStatusFinder implements Serializable {
   
private String usr_id;
private String userstatus;

public UserStatusFinder()
{
usr_id="";
userstatus="";
}

public void setUsr_id(String usr_id)
{
this.usr_id=usr_id;
onUsr_idChanged();
}

private void onUsr_idChanged()
{
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/billingdb?user=root&password=mustafa11&useSSL=false");

pst=con.prepareStatement("select * from logindetails where usr_id=?;");
pst.setString(1,usr_id);
rs=pst.executeQuery();

if(rs.next())
userstatus="Not available";
else
userstatus="Available";


con.close();
}
catch(Exception e)
{
userstatus=e.getMessage();
}

}

public String getUserstatus()
{
return(userstatus);
}
}
