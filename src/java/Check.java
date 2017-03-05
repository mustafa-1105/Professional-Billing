/*
  * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import professionalbean.*;


/**
 *
 * @author admin
 */
public class Check extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String id,ps,typ="";
        
        id=request.getParameter("uid");
        ps=request.getParameter("psw");
       
        try{
            /* TODO output your page here. You may use following sample code. */
          Connection con;            
          PreparedStatement pst;
          ResultSet rs;
          
          DBConnector dbc = new DBConnector();
          con = dbc.getDbconnection();
              
          pst=con.prepareStatement("select usr_type from logindetails where usr_id=? and usr_pswd=?;");
          pst.setString(1,id);
          pst.setString(2,ps);

          rs=pst.executeQuery();

          if(rs.next()) {
              HttpSession ses=request.getSession(true);
              ses.setAttribute("usr_id",id);

              typ=rs.getString("usr_type");
              ses.setAttribute("usr_type",typ);

              if(typ.equals("Admin")) {
                  response.sendRedirect("Admin.jsp");
              }
              else if(typ.equals("User")) {
                  response.sendRedirect("User.jsp");
              }
          }
          else {
              out.println("<h2>Sorry Authentication Failed</h2>");
          }
          con.close();
        }
        catch(Exception e){
            out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
