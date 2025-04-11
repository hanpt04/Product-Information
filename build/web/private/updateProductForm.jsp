<%-- 
    Document   : updateProduct
    Created on : Oct 16, 2024, 9:10:57 PM
    Author     : nha36
--%>

<%@page import="model.dao.CategoryDAO"%>
<%@page import="model.CategoryDTO"%>
<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Information Form</title>
        <!-- Bootstrap 3 CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            .container{
                border: 1px solid grey;
                width: 50%; 
                height: 90%;
                margin: 30px auto;
                background-color: #f4f4f4;
            }
            form{
                margin: 10px 20px;
            }
            
        </style>
    </head>
    <body>

        <%@include file="../view/header.jspf" %>
        <div class="container">
            <h1 class="text-center">Product Information Form</h1>

            <form action="<%=request.getContextPath()%>/UpdateDelete?method=update" method="POST" class="form-horizontal">
                <!-- Product ID -->
                <div class="form-group">
                    <label for="productId" class="col-sm-2 control-label">Product ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="productId" name="productId"
                               value="<%=request.getParameter("productId")%>"   placeholder="Enter Product ID" required>
                    </div>
                </div>

                <!-- Product Name -->
                <div class="form-group">
                    <label for="productName" class="col-sm-2 control-label">Product Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter Product Name" required>
                    </div>
                </div>

                <!-- Product Image -->
                <div class="form-group">
                    <label for="productImage" class="col-sm-2 control-label">Product Image URL:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="productImage" name="productImage" placeholder="Enter Product Image URL">
                    </div>
                </div>

                <!-- Brief Description -->
                <div class="form-group">
                    <label for="brief" class="col-sm-2 control-label">Brief Description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="brief" name="brief" rows="4" placeholder="Enter Brief Description"></textarea>
                    </div>
                </div>

                <!-- Posted Date -->
                <div class="form-group">
                    <label for="postedDate" class="col-sm-2 control-label">Posted Date:</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="postedDate" name="postedDate" required>
                    </div>
                </div>

                <!-- Category -->
                 <div class="form-group layout">
                    <label for="type" class="col-sm-2 control-label title">Category:</label>
                    <div class="col-sm-10">
                         <select class="form-control" id="type" name="type" placeholder="Enter Category">
                            <option value="">Select a Category</option>
                            <%      
                                    for (CategoryDTO cate : new CategoryDAO().getAll()) {
                            %>
                            <option value="<%= cate.getTypeld()%>"><%= cate.getCategoryName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <!-- Account -->
                <div class="form-group">
                    <label for="account" class="col-sm-2 control-label">Account:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="account" name="account" placeholder="Enter Account">
                    </div>
                </div>

                <!-- Unit -->
                <div class="form-group">
                    <label for="unit" class="col-sm-2 control-label">Unit:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="unit" name="unit" placeholder="Enter Unit">
                    </div>
                </div>

                <!-- Price -->
                <div class="form-group">
                    <label for="price" class="col-sm-2 control-label">Price:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="price" name="price" placeholder="Enter Price">
                    </div>
                </div>

                <!-- Discount -->
                <div class="form-group">
                    <label for="discount" class="col-sm-2 control-label">Discount:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="discount" name="discount" placeholder="Enter Discount">
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Bootstrap 3 JavaScript and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <p style="text-align: center;">
            <a href="<%=request.getContextPath()%>/view/home.jsp" >Click here to back to home !!!</a>
        </p>
        <%@include file="../view/footer.jspf" %>
    </body>
</html>
