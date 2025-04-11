/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AccountDTO;
import model.dao.AccountDAO;

/**
 *
 * @author nha36
 */
public class test extends HttpServlet {

    private final String LOGIN = "view/login.jsp";
    private final String SUCCESS = "view/home.jsp";
    private final String BANNED = "view/banned.html";

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
            out.println("<title>Servlet dn</title>");   
           
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dn at " + request.getContextPath() + "</h1>");
            String account = request.getParameter("account");
            String pass = request.getParameter("pass");
            HttpSession session = request.getSession();
            AccountDTO x = new AccountDAO(getServletContext()).getById(account);
            String path = LOGIN;
            
            if(x!=null && pass.equalsIgnoreCase(x.getPass())){
                session.setAttribute("tt", x);
                session.removeAttribute("soLanSai");
                path=SUCCESS;
            
            }
            else{
                int sls = convertObjToInt(session.getAttribute("soLanSai"));
                sls++;
                session.setAttribute("soLanSai", sls);
                request.getSession().setAttribute("ERROR", "INVALID ACCOUNT OR PASSWORD !!!");
                if(sls > 2){
                    path=BANNED;
                }
                
            }
//           request.getRequestDispatcher(path).forward(request, response);
response.sendRedirect(path);
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public int convertObjToInt(Object x){
        int kq=0;
        
        try {
            kq=Integer.parseInt(x.toString());
        } catch (Exception e) {
        }
        
        return kq;
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
