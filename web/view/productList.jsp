<%@page import="model.AccountDTO"%>
<%@page import="model.ProductDTO"%>
<%@page import="model.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }

            h1 {
                font-size: 35px;
                font-weight: bolder;
                margin: 20px 0;
                text-align: center;
            }

            .product-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin: 20px;
            }

            .product-card {
                background: white;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                margin: 15px;
                padding: 15px;
                width: 250px;
                text-align: center;
                transition: transform 0.3s;
            }

            .product-card:hover {
                transform: scale(1.05);
            }

            .product-card img {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
            }

            .product-details {
                margin: 10px 0;
            }

            .back-link {
                text-align: center;
                margin: 20px;
            }

            .discount {
                color: red;
                font-weight: bold;
            }

            .more-details {
                display: none;
                margin-top: 10px;
                text-align: left;
            }

            .btn-back {
                background-color: #007bff; 
                color: white; 
                padding: 10px 20px;
                border: none; 
                border-radius: 5px; 
                font-size: 16px;
                text-decoration: none; 
                transition: background-color 0.3s;
                display: inline-block;
                margin: 20px 0;
            }

            .btn-back:hover {
                background-color: #0056b3; 
            }
        </style>

        <script>
            $(document).ready(function () {
                $(".show-more").click(function () {
                    $(this).closest('.product-card').find(".more-details").toggle();
                });
            });
        </script>
    </head>
    <body>

        <%@include file="../view/header.jspf" %>      
        <h1>Product Information</h1>
        <a href="<%=request.getContextPath()%>/Favorites" class="btn btn-primary btn-lg">Favorites</a>
        <div class="product-container">
            <%
                ProductDAO productDAO = new ProductDAO();
                for (ProductDTO product : productDAO.getAll()) {
                    double price = product.getPrice();
                    double discount = product.getDiscount();
                    double discountedPrice = price - (price * (discount / 100));
            %>
            <div class="product-card">
                <img src="<%= product.getProductImage()%>" alt="<%= product.getProductName()%>" />
                <div class="product-details">
                    <h4><%= product.getProductName()%></h4>
                    <p><strong>Original Price:</strong> <%= price%> VNĐ</p>
                    <p class="discount"><strong>Discount:</strong> <%= discount%>%</p>
                    <p><strong>Discounted Price:</strong> <%= discountedPrice%> VNĐ</p>
                    <p><strong>Posted Date:</strong> <%= product.getPostedDate()%></p>
                    <p><strong>Unit:</strong> <%= product.getUnit()%></p>
                    <button class="show-more btn btn-info">Show More Details</button>
                    <div class="more-details">
                        <p><strong>Brief:</strong> <%= product.getBrief()%></p>
                        <!-- Bạn có thể thêm các thông tin chi tiết khác ở đây -->
                    </div>
                    <div>
                        <form action="<%=request.getContextPath()%>/addToFavorite" method="post">
                            <input type="hidden" name="productId" value="<%=product.getProductId()%>"/>
                            <%
                                // Check if the product  exists
                                boolean isExist = (request.getAttribute("exist") != null);
                                if (isExist) {
                            %>
                            <script>
                                alert('<%= request.getAttribute("exist")%>');
                            </script>
                            <%
                                    // Clear the attribute 
                                    request.removeAttribute("exist");
                                }
                            %>
                            <%
                                if (session.getAttribute("tt") != null) {
                                    AccountDTO account = (AccountDTO) session.getAttribute("tt");
                            %>                        
                            <input type="hidden" name="account" value="<%=account.getAccount()%>"/>
                            <%
                                }
                            %>

                            <button type="submit" >

                                Add to Favorites
                            </button>


                        </form>
                    </div>

                </div>
            </div>
            <%
                }
            %>
        </div>
        <a href="<%= request.getContextPath()%>/view/home.jsp" class="btn btn-primary btn-lg">Back to home </a>
    </div>

    <%@include file="../view/footer.jspf" %>
</body>
</html>