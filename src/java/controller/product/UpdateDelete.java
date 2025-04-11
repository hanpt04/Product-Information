/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccountDTO;
import model.CategoryDTO;
import model.ProductDTO;
import model.dao.AccountDAO;
import model.dao.CategoryDAO;
import model.dao.ProductDAO;

/**
 *
 * @author nha36
 */
public class UpdateDelete extends HttpServlet {

    private final String SUCCESS = "http://localhost:8080/ProductInformation/view/productList.jsp";

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateDelete</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDelete at " + request.getContextPath() + "</h1>");
            String type = request.getParameter("method");
            String productId = request.getParameter("productId");

            
            ProductDAO proDAO = new ProductDAO();
            int rs = 0;

            if (type.equals("update")) {
                String productName = request.getParameter("productName");
                String img = request.getParameter("productImg");
                String brief = request.getParameter("brief");
                Date date = Date.valueOf(request.getParameter("postedDate"));
                String typeid = request.getParameter("type");
                CategoryDAO cateDAO = new CategoryDAO();
                CategoryDTO cateDTO = cateDAO.getById(typeid);
                String account = request.getParameter("account");
                AccountDAO accDAO = new AccountDAO();
                AccountDTO accDTO = accDAO.getById(account);

                String unit = request.getParameter("unit");
                int price = Integer.parseInt(request.getParameter("price"));
                int discount = Integer.parseInt(request.getParameter("discount"));
                ProductDTO product = new ProductDTO(productId, productName, img, brief, date,
                    cateDTO, accDTO, unit, price, discount);
                rs = proDAO.update(product);
      

            } else if (type.equals("delete")) {

                out.println("<h1>Servlet Delete at " + request.getContextPath() + "</h1>");
                ProductDTO product1 = proDAO.getById(productId);
                rs = proDAO.delete(product1);
                out.println("<h1>Servlet Delete at " + rs + "</h1>");
            }

            if (rs > 0) {
                request.getRequestDispatcher("view/productList.jsp").forward(request, response);
            } else {
                out.println("failed!!");
            }
            out.print(rs);
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
