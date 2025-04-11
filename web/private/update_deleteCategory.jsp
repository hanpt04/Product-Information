<%-- 
    Document   : updateDelCate
    Created on : Oct 15, 2024, 9:41:18 PM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Category List</title>
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
            <h1 class="text-center">Category List Item</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Category Name</th>
                        <th>Memo</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%                    CategoryDAO cate = new CategoryDAO();
                        for (CategoryDTO i : cate.getAll()) {
                    %>
                    <tr>
                        <td><%= i.getTypeld()%></td>
                        <td><%=i.getCategoryName()%></td>
                        <td><%=i.getMemo()%></td>
                        <td>
                            <a href="<%=request.getContextPath()%>/private/updateCategory.jsp?typeId=<%=i.getTypeld()%>" class="btn btn-danger btn-sm">Update</a>
                        </td>
                        <td>
                            <a href="<%=request.getContextPath()%>/DeleteCate?typeId=<%=i.getTypeld()%>" class="btn btn-danger btn-sm">Delete</a>
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
        </div>
        <%@include file="../view/footer.jspf" %>
    </body>
</html>
