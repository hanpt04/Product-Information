<%-- 
    Document   : delete
    Created on : Oct 14, 2024, 8:50:33 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page import="model.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
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
            img{
                width: 70%; 
                height:30px;

            }

        </style>
    </head>
    <body>
        <%@include file="../view/header.jspf" %>
        
        <h1>Account List</h1>
        <table class="table table-bordered table-striped main" >
            <thead>
                <tr >
                    <th class="title">No.</th>
                    <td class="title">Account</td>
                    <td class="title">Password</td>
                    <td class="title">Last Name</td>
                    <td class="title">First Name</td>
                    <td class="title">Birthday</td>
                    <td class="title">Gender</td>
                    <td class="title">Phone</td>
                    <td class="title">Is Use</td>
                    <td class="title">Role in System</td>
                    <td class="title">Delete</td>
                </tr>
            </thead>
            <tbody>
                <%                AccountDAO accountDAO = new AccountDAO();
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
                    <td >
                        <img src="<%= request.getContextPath()%>/img/<%= account.isGender() ? "fe" : ""%>male.jpg" alt="gender" />

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
                    <td >
                        <a href="<%=request.getContextPath()%>/delete?account=<%= account.getAccount()%>" class="btn btn-danger btn-sm" onclick="
                                return confirm('Are u sure?')">Delete</a>

                    </td>
                </tr>
                <%
                    }
                %>
                </body>
        </table>   

        <div class="d-flex justify-content-center mt-3" style="margin-left: 47.5%; margin-top:30px;">
            <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to home </a>

        </div>
        <%@include file="../view/footer.jspf" %>
    </body>
</html>
