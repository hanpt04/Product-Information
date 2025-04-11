<%-- 
    Document   : home
    Created on : Oct 11, 2024, 1:56:59 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <style>
            .container{
                border-radius: 30px;
                box-shadow: 5px 5px 30px 1px ;
                border: 0.5px solid grey;
                background-color: #f4f4f4; 
                margin-left: 130px;
                margin-right: 50px;
                margin-top: 50px;
                width: 80%;
            }
            h1{
                padding-top: 20px;
                font-family: serif;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jspf" %>

        <%
            AccountDTO account = (AccountDTO) session.getAttribute("tt");
            if (account != null) {
        %>
        <h1  style="padding-left:40px;">Welcome <b style="color:red;font-family: cursive;">[<%=account.getAccount()%>] </b><%=account.getLastName()%><%=account.getFirstName()%></h1>
        <div class="container" >
            <p style="text-align:center;font-size:20px;padding:70px 80px;font-family: serif;">We’re thrilled to have you back. Here, you can manage your personal information, review the services you've used, and update your preferences. Continue exploring and make the most of the features your account offers.</p>
            <p style="text-align:center;font-size:15px;margin-top:-50px;padding-bottom: 50px;font-family: serif;">Thank you for trusting and using our services!</p>
        </div>
        <%
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>


    </body>
</html>