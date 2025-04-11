<%-- 
    Document   : login
    Created on : Oct 11, 2024, 1:43:11 PM
    Author     : nha36
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container demo-1" >
            <div class="content">
                <div id="large-header" class="large-header">
                    <h1>Login Form</h1>
                    <div class="main-agileits">
                        <!--form-stars-here-->
                        <div class="form-w3-agile">
                            <h2>login Now</h2>
                            <form action="<%=request.getContextPath()%>/test" method="post">
                                <%
                                    if (session.getAttribute("tt") != null) {
                                        request.getRequestDispatcher("home.jsp").forward(request, response);
                                    }

                                %>
                                <div class="form-sub-w3">
                                    <input type="text" name="account" placeholder="Account " required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="pass" placeholder="Password" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <p class="p-bottom-w3ls">Forgot Password?<a class href="#">  Click here</a></p>
                              
                                <div class="clear"></div>
                                <div class="submit-w3l">
                                    <%                            String mess = (String) session.getAttribute("ERROR");

                                        if (mess != null) {
                                            out.println("<div class='alert alert-danger'>");
                                            out.println( mess);
                                            out.println("</div>");
                                            session.removeAttribute("ERROR");
                                        }
                                        int sls = 0;
                                        try {
                                            sls = Integer.parseInt(session.getAttribute("soLanSai").toString());
                                        } catch (Exception e) {
                                                
                                        }
                                        if (sls > 0) {
                                            out.println("<div style='color:red;'>Error " + sls + "th" + "</div>");
                                        }
                                    %>
                                    <input type="submit" value="Login">
                                </div>
                            </form>

                        </div>
                        <!--//form-ends-here-->
                    </div><!-- copyright -->

                    <!-- //copyright --> 
                </div>
            </div>
        </div>	
        <footer class="text-center" style=" padding:  15px 0; background-color: #f8f9fa; border-top: 1px solid #e9ecef;">
           
            <p>
                <a href="#">Terms of Service</a> | 
                <a href="#">Privacy Policy</a> | 
                <a href="#">Contact Us</a>
            </p>
        </footer>

    </body>
</html>
