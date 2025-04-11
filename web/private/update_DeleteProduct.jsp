<%-- 
    Document   : updateProduct
    Created on : Oct 16, 2024, 9:57:31 AM
    Author     : nha36
--%>

<%@page import="model.ProductDTO"%>
<%@page import="model.dao.ProductDAO"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            h1{
                font-family: serif;
                font-size: 35px;
                font-weight: bolder;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        
        <%@include file="../view/header.jspf" %>
        <div class="container">
            <h1 class="text-center">Product List</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th class="title">No.</th>
                        <td>Product ID</td>
                        <td>Product Name</td>
                        <td>Product Image</td>
                        <td>Brief</td>
                        <td>Posted Date</td>
                        <td>Type ID</td>
                        <td>Account</td>
                        <td>Unit</td>
                        <td>Price</td>
                        <td>Discount</td>
                    </tr>
                </thead>
                <tbody>
                    <%  ProductDAO pro = new ProductDAO();
                        int index = 1;
                        for (ProductDTO i : pro.getAll()) {
                    %>
                    <tr>
                        <td class="content"><%= index++%></td>
                        <td><%= i.getProductId()%></td>
                        <td><%= i.getProductName()%></td>
                        <td><img style="height: 70px;width: 70px;" src="<%= i.getProductImage()%>" /></td>
                        <td><%= i.getBrief()%></td>
                        <td><%= i.getPostedDate()%></td>
                        <td><%= i.getType().getTypeld()%></td>
                        <td><%= i.getAccount().getAccount()%></td>
                        <td><%= i.getUnit()%></td>
                        <td><%= i.getPrice()%></td>
                        <td><%= i.getDiscount()%></td>




                        <td>
                            <a href="<%=request.getContextPath()%>/private/updateProductForm.jsp?productId=<%=i.getProductId()%>" class="btn btn-danger btn-sm">Update</a>
                        </td>
                        <td>
                            <a href="<%=request.getContextPath()%>/UpdateDelete?productId=<%=i.getProductId()%>&method=delete" class="btn btn-danger btn-sm">Delete</a>

                        </td>

                    </tr>


                    <%
                        }
                    %>
                </tbody>
            </table>
            <a href="../view/home.jsp" class="btn btn-primary">Back to Home</a>
        </div>
        <%@include file="../view/footer.jspf" %>
    </body>
</html>
