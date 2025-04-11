package cookie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccountDTO;

@WebServlet(name = "removeFromFavorites", urlPatterns = {"/removeFromFavorites"})
public class removeFromFavorites extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String productIdToRemove = request.getParameter("productId");
        AccountDTO accountDTO = (AccountDTO) request.getSession().getAttribute("tt");
        String account = accountDTO != null ? accountDTO.getAccount() : "";
        String favorites = "";
        List<String> productArr = new ArrayList<>();

        // Retrieve favorites from cookie
        Cookie[] cList = request.getCookies();
        if (cList != null) {
            for (Cookie cookie : cList) {
                if (cookie.getName().equalsIgnoreCase(account + "favorites")) {
                    favorites = cookie.getValue();
                    productArr = new ArrayList<>(Arrays.asList(favorites.split("-")));
                    break;
                }
            }
        }

        
        if (productArr.contains(productIdToRemove)) {
            productArr.remove(productIdToRemove);
            favorites = String.join("-", productArr); 
        }

        // Update 
        Cookie favoritesCookie = new Cookie(account + "favorites", favorites);
        favoritesCookie.setMaxAge(favorites.isEmpty() ? 0 : 60 * 60 * 24 * 14); 
        response.addCookie(favoritesCookie);

        
        response.sendRedirect(request.getContextPath() + "/Favorites");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Removes a product from favorites";
    }
}
