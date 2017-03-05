/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import professionalbean.DBConnector;

/**
 *
 * @author admin
 */
public class AddExpenses extends HttpServlet {

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
        
        HttpSession session=request.getSession(true);
        
        String id=String.valueOf(session.getAttribute("usr_id"));
        String enm = request.getParameter("enm");
        double price=Double.parseDouble(request.getParameter("price"));
        String date = request.getParameter("date");
        
        try {
            /* TODO output your page here. You may use following sample code. */
           
            Connection con;           
            PreparedStatement pst;
          
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();
            
          
            pst=con.prepareStatement("insert into expenses values(?,?,?,?);");

            pst.setString(1,id);
            pst.setString(2,enm);
            pst.setDouble(3,price);
            pst.setString(4,date);

            pst.executeUpdate();


            out.println("<h2>"+enm+ " Added Successfully.</h2>");
            out.println("<br><a href='User.jsp'>Home</a>");

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
