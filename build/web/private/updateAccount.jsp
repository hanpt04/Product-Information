<%-- 
    Document   : updateAccount
    Created on : Oct 11, 2024, 1:43:41 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .main{
                border: 1px solid grey;
                width: 50% !important ;
                margin: 30px auto;
                background-color: #f4f4f4;
            }
            h2{
                font-family: serif;
                font-size: 35px;
                font-weight: bolder;
            }
            .title{
                width: 140px;
            }
            .content{
                margin: 40px 0px;
            }
        </style>
    </head>
    <body>
        <%@include file="../view/header.jspf" %>
        
        <div class="container main">
            <h2 class="text-center">Update User Information Form</h2>
            <form action="<%= request.getContextPath()%>/update" method="POST" class="form-horizontal content">

                <!-- Account -->
                <div class="form-group">
                    <label for="account" class="col-sm-3 control-label title">Account:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="account" name="account" required>
                    </div>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="pass" class="col-sm-3 control-label title">Password:</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="pass" name="pass" required>
                    </div>
                </div>

                <!-- Last Name -->
                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label title">Last Name:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                    </div>
                </div>

                <!-- First Name -->
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label title">First Name:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                </div>

                <!-- Birthday -->
                <div class="form-group">
                    <label for="birthday" class="col-sm-3 control-label title">Birthday:</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="birthday" name="birthday" >
                    </div>
                </div>

                <!-- Gender -->
                <div class="form-group">
                    <label for="gender" class="col-sm-3 control-label title">Gender:</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="gender" name="gender" required>
                            <option value="0">Male</option>
                            <option value="1">Female</option>
                        </select>
                    </div>
                </div>

                <!-- Phone -->
                <div class="form-group">
                    <label for="phone" class="col-sm-3 control-label title">Phone:</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="phone" name="phone" required>
                    </div>
                </div>

                <!-- Is Use -->
                <div class="form-group">
                    <label for="isUse" class="col-sm-3 control-label title">Is Use:</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="isUse" name="isUse" required>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                </div>

                <!-- Role in System -->
                <div class="form-group">
                    <label for="roleInSystem" class="col-sm-3 control-label title">Role In System:</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="isUse" name="roleInSystem" required>
                            <option value="1">Administrator</option>
                            <option value="2">Staff</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-success" style="margin-left: 150px;">Submit</button>
                    </div>
                </div>
        </div>
    </form>           
</div>
<div class="d-flex justify-content-center mt-3" style="margin-left: 47.5%; margin-top:30px;">
    <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to home </a>
</div>
<%@include file="../view/footer.jspf" %>
</body>
</html>
