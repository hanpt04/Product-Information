/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccountDTO;
import model.dao.AccountDAO;

/**
 *
 * @author nha36
 */
public class DanhSachAccount extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DanhSach</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DanhSach at " + request.getContextPath() + "</h1>");
            List<AccountDTO> list = new AccountDAO().getAll();

            out.println("<table border='1'>");
            out.println("<tr>"
                    + "<td>Account</td>"
                    + "<td>Password</td>"
                    + "<td>Last Name</td>"
                    + "<td>First Name</td>"
                    + "<td>Birthday</td>"
                    + "<td>Gender</td>"
                    + "<td>Phone</td>"
                    + "<td>Is Use</td>"
                    + "<td>Role in System</td>"
                    + "</tr>");
            for (AccountDTO account : list) {
                out.println("<tr>");
                out.println("<td>" + account.getAccount() + "</td>");
                out.println("<td>" + account.getPass() + "</td>");
                out.println("<td>" + account.getLastName() + "</td>");
                out.println("<td>" + account.getFirstName() + "</td>");
                out.println("<td>" + account.getBirthday() + "</td>");
                out.println("<td><img src='img/" + (account.isGender() ? "fe" : "") + "male.jpg' alt='' style='width:40px;length:40px;'/></td>");
                out.println("<td>"+ account.getPhone()+"</td>");
                out.println("<td>"+ (account.isIsUse()?"Active":"Active")+"</td>");
                int role = account.getRoleInSystem();
                String roleValue = "";
                if(role==1){
                    roleValue="Aministrator";
                }
                else{
                    roleValue="Staff";
                }
                out.println("<td>"+roleValue+ "</td>");
                out.println("</tr>");
                
            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
        
            () {
        return "Short description";
        }// </editor-fold>

    }
