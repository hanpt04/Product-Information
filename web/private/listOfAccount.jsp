<%-- 
    Document   : accountList
    Created on : Oct 15, 2024, 10:47:58 AM
    Author     : nha36
--%>

<%@page import="java.util.List"%>
<%@page import="model.AccountDTO"%>
<%@page import="model.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            h1{
                text-align: center;
                font-family: serif;
                font-weight: bold;
                padding: 10px 0;

            }
            .main{
                margin-left: 70px; 
                width: 90% !important;
                font-family: serif;
            }           
            .title{
                font-size: 20px;
                font-weight: bold;

            }
            .content{
                font-size: 17px; 
                font-family: serif;
            }

        </style>
    </head>
    <body>
        <%@include file="../view/header.jspf" %>

        

        <h1>Account List</h1>
        <table  class="table table-bordered table-striped main">
            <thead >
                <tr>
                    <th class="title">No.</th>
                    <th class="title">Account</th>
                    <th class="title">Password</th>
                    <th class="title">Last Name</th>
                    <th class="title">First Name</th>
                    <th class="title">Birthday</th>
                    <th class="title">Gender</th>
                    <th class="title">Phone</th>
                    <th class="title">Is Use</th>
                    <th class="title">Role in System</th>
                </tr>
            </thead>
            <tbody >
                <%            AccountDAO accountDAO = new AccountDAO();
                    int index = 1;
                    for (AccountDTO account : accountDAO.getAll()) {
                %>

                <tr>
                    <td class="content"><%= index++%></td>
                    <td class="content"><%= account.getAccount()%></td>
                    <td class="content"><%= account.getPass()%></td>
                    <td class="content"><%= account.getLastName()%></td>
                    <td class="content"><%= account.getFirstName()%></td>
                    <td class="content"><%= account.getBirthday()%></td>
                    <td>
                        <img src="<%= request.getContextPath()%>/img/<%= account.isGender() ? "fe" : ""%>male.jpg" alt="gender" style="width: 60px; height:30px;padding-left: 15px;"/>

                    </td>
                    <td class="content"><%= account.getPhone()%></td>
                    <td class="content"><%= account.isIsUse() ? "Active" : "Inactive"%></td>
                    <td class="content">
                        <%
                            int role = account.getRoleInSystem();
                            String roleValue = (role == 1) ? "Administrator" : "Staff";
                            out.print(roleValue);
                        %>
                    </td>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table> 
        <div class="d-flex justify-content-center mt-3" style="margin-left: 47.5%; margin-top:30px;">
            <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to home </a>
        </div>
        <%@include file="../view/footer.jspf" %>
    </body>
</html>
