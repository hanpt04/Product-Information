<%-- 
    Document   : update
    Created on : Oct 15, 2024, 10:05:14 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
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
            .container{
                border: 1px solid black;
                width: 50%;
                margin: 80px auto;
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>

        <%@include file="../view/header.jspf" %>
        

        <div class="container">
            <h1 class="text-center">Category Update Form</h1>

            <form action="<%=request.getContextPath()%>/updateCate" method="POST" class="form-horizontal">

                <div class="form-group">
                    <label for="typeId" class="col-sm-2 control-label">Category Type ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="categoryName" name="typeId" 
                               value="<%=request.getParameter("typeId")%>"   placeholder="Enter Type ID" required>
                    </div>
                </div>


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
    </body>
    <p style="text-align: center;">
        <a href="<%=request.getContextPath()%>/view/home.jsp" >Click here to back to home !!!</a>
    </p>
    <%@include file="../view/footer.jspf" %>
</html>
