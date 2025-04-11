<%-- 
    Document   : AddCate
    Created on : Oct 15, 2024, 9:00:23 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Category Information Form</title>
        <!-- Bootstrap 3 CDN -->
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
            .main{
                 border: 1px solid black;
                width: 50%;
                margin: 70px auto;
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <%@include file="../view/header.jspf" %>

       
        <div class="container main">
            <h1 class="text-center">Category Information Form</h1>

            <form action="<%=request.getContextPath()%>/addCate" method="POST" class="form-horizontal">




                <div class="form-group">
                    <label for="categoryName" class="col-sm-2 control-label">Category Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Enter Category Name" required>
                    </div>
                </div>


                <div class="form-group">
                    <label for="memo" class="col-sm-2 control-label">Memo:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="memo" name="memo" rows="4" placeholder="Enter memo here..."></textarea>
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
        <div class="d-flex justify-content-center mt-3" style="margin-left: 47.5%; margin-top:20px;">
            <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to home </a>
        </div>
        
        <%@include file="../view/footer.jspf" %>
    </body>
</html>

