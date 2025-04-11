<%-- 
    Document   : productByCate
    Created on : Nov 6, 2024, 11:17:05 AM
    Author     : nha36
--%>

<%@page import="model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="model.CategoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List By Category</title>
    </head>
    <body>
        <form  action="<%= request.getContextPath()%>/SearchByCate" method="post">
            <label for="type" >Category:</label>
            <div >
                <select id="type" name="type" placeholder="Enter Category">
                    <option value="">Select a Category</option>
                    <%
                        for (CategoryDTO cate : new CategoryDAO().getAll()) {
                    %>
                    <option value="<%=cate.getTypeld()%>"><%= cate.getCategoryName()%></option>
                    <%
                        }
                    %>
                </select>
                <button type="submit">Search</button>
            </div>
        </form>
        
        <%
            if (request.getAttribute("list") != null) {
                List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("list");
                for (ProductDTO product : list) {
                    double price = product.getPrice();
                    double discount = product.getDiscount();
                    double discountedPrice = price - (price * (discount / 100));
        %>
        
        <div class="product-card">
            <img src="<%= product.getProductImage()%>" style="width: 200px; height: 200px;" alt="<%= product.getProductName()%>" />
            <div class="product-details">
                <h4><%= product.getProductName()%></h4>
                <p><strong>Original Price:</strong> <%= price%> VNĐ</p>
                <p class="discount"><strong>Discount:</strong> <%= discount%>%</p>
                <p><strong>Discounted Price:</strong> <%= discountedPrice%> VNĐ</p>
                <p><strong>Posted Date:</strong> <%= product.getPostedDate()%></p>
                <p><strong>Unit:</strong> <%= product.getUnit()%></p>


                <p><strong>Brief:</strong> <%= product.getBrief()%></p>



                <%
                        }
                    }
                %>
                </body>
                </html>
