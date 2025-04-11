<%-- 
    Document   : favorites
    Created on : Oct 30, 2024, 8:19:23 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.ProductDAO"%>
<%@page import="model.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.Cookie"%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Your Favorites</title>
    </head>
    <body>
        <h1>Your Favorites</h1>
        <%
            List<String> productList = (List<String>) request.getAttribute("productList");
            ProductDAO dao = new ProductDAO();


        %>


        <div class="favorites-container">
            <%                if (productList != null) {
                    for (String product : productList) {

                        double price = dao.getById(product).getPrice();
                        double discount = dao.getById(product).getDiscount();
                        double discountedPrice = price - (price * (discount / 100));
            %>
            <div class="favorite-item">
                <h4><%= dao.getById(product).getProductName()%></h4>
                <p><strong>Price:</strong> <%= price%> VND</p>
                <p class="discount"><strong>Discount:</strong> <%= discount%>%</p>
                <p><strong>Discounted Price:</strong> <%= discountedPrice%> VND</p>

                <form action="<%= request.getContextPath()%>/removeFromFavorites" method="post">
                    <input type="hidden" name="productId" value="<%= product%>">
                    <button type="submit" class="btn btn-danger">Remove</button>
                </form>

            </div>
            <%
                    }
                }
            %>
        </div>
        
        <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to Home Page</a>
        
        
    </body>
</html>