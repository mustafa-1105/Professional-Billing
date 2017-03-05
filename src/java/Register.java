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
import professionalbean.*;

/**
 *
 * @author admin
 */
public class Register extends HttpServlet {

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
        
            String uid,psw,mob,email,type;
        
            PrintWriter out = response.getWriter();
           
            uid=request.getParameter("uid");
            psw=request.getParameter("psw");
            mob=request.getParameter("mob");
            email=request.getParameter("email");
            type=request.getParameter("type");
        try {
            /* TODO output your page here. You may use following sample code. */
                       
            Connection con;           
            PreparedStatement pst;
          
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();
          
            pst=con.prepareStatement("insert into logindetails values(?,?,?,?,?);");

            pst.setString(1,uid);
            pst.setString(2,mob);
            pst.setString(3,email);
            pst.setString(4,psw);
            pst.setString(5,type);

            pst.executeUpdate();


            out.println("<h2>Registration Successful</h2>");
            out.println("<br><a href='index.html'>Login Now</a>");

            con.close();
        }
        catch(Exception e) {
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
