/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cookie;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nha36
 */
@WebServlet(name = "addToFavorite", urlPatterns = {"/addToFavorite"})
public class addToFavorite extends HttpServlet {

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

        /* TODO output your page here. You may use following sample code. */
        String newProductId = request.getParameter("productId"); // Lấy productId từ request
        String favorites = ""; // Biến lưu trữ ID sản phẩm yêu thích
        boolean isExist = false;
        String account = request.getParameter("account");
        if(account==null){
            account="";
        }
        // Đọc cookie hiện có
        Cookie[] cList = request.getCookies();
        if (cList != null) {
            for (Cookie cookie : cList) {
                if (cookie.getName().equalsIgnoreCase(account+"favorites")) {
                    favorites = cookie.getValue();
                    String[] productArr = favorites.split("-");
                    for (String productId : productArr) {
                        if (productId.equals(newProductId)) {

                            isExist = true; // Sản phẩm đã tồn tại
                            break;
                        }
                    }
                    break; // Thoát khỏi vòng lặp cookie
                }
            }
        }

        // Nếu sản phẩm chưa có trong danh sách yêu thích, thêm vào
        if (!isExist && newProductId!=null) {
            if (!favorites.isEmpty()) {
                favorites += "-";
            }
            favorites += newProductId; // Thêm ID sản phẩm mới
        }
        if (isExist) {
            // Nếu sản phẩm đã có trong danh sách yêu thích
            request.setAttribute("exist", "Product is already in your favorites.");
            request.getRequestDispatcher("view/productList.jsp").forward(request, response);
            return; // Dừng nếu sản phẩm đã tồn tại
        } else {
            // Tạo hoặc cập nhật cookie
            Cookie favoritesCookie = new Cookie(account+"favorites", favorites);
            favoritesCookie.setMaxAge(60 * 60 * 24 * 14); // Thời gian sống cookie 14 ngày
            response.addCookie(favoritesCookie);

            // Chuyển hướng đến trang danh sách yêu thích
            response.sendRedirect(request.getContextPath() + "/view/productList.jsp");
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
