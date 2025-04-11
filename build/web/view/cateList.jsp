<%-- 
    Document   : cateList
    Created on : Oct 15, 2024, 9:07:23 PM
    Author     : nha36
--%>

<%@page import="model.AccountDTO"%>
<%@page import="model.CategoryDTO"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
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

        <%@include file="header.jspf" %>
        <div class="container">
            <h1 class="text-center">Category List</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Category Name</th>
                        <th>Memo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        CategoryDAO cate = new CategoryDAO();
                        for (CategoryDTO i : cate.getAll()) {
                    %>
                    <tr>
                        <td><%= i.getTypeld()%></td>
                        <td><%=i.getCategoryName()%></td>
                        <td><%=i.getMemo()%></td>
                    </tr>


                    <%
                        }
                    %>
                </tbody>
            </table>

        </div>
        <%-- Kiểm tra session để xác định trạng thái đăng nhập --%>
        <%
            AccountDTO account = (AccountDTO) session.getAttribute("tt"); // Lấy thông tin đăng nhập từ session
        %>
        <div class="d-flex justify-content-center mt-3" style=" margin-top:30px;">
            <%
                if (account != null) { // Nếu người dùng đã đăng nhập
%>
            <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to home </a>
            <%
            } else { // Nếu người dùng chưa đăng nhập
%>
            <a href="<%= request.getContextPath()%>" class="btn btn-primary btn-lg">Back to Home Page</a>
            <%
                }
            %>
        </div>
        <%@include file="footer.jspf" %>
    </body>
</html>
