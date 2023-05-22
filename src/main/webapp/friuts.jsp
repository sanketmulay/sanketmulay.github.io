
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>complete responsive grocery website design tutorial</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="style.css">

</head>
<body>

<!-- header section starts  -->

		<jsp:include page="header.jsp"></jsp:include>

<section class="product" id="product">

    <h1 class="heading">Fresh<span> Fruits</span></h1>
    <div class="box-container">
        <%
    try{
    	Connection con = DatabaseConnection.getCon();
    	Statement st = con.createStatement();
    	ResultSet rs = st.executeQuery("select * from product where productCategory='fruit'");
    	while(rs.next()){
    		int id = rs.getInt("id");
    		String productName = rs.getString("productName");
    		int productPrice = rs.getInt("productPrice");
    		int productMRPPrice = rs.getInt("productMRPPrice");
    		String fileName=rs.getString("fileName");
    	
    %>
        <div class="box">
            <span class="discount">-33%</span>
            <div class="icons">
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share"></a>
                <a href="#" class="fas fa-eye"></a>
            </div>
            <img src="uploads/<%=fileName %>" alt="loading product image">
            <h3><%=productName %></h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <div class="price"> Rs <%=productPrice %> <span> Rs <%=productMRPPrice %> </span> </div>
            
            <a href="addToCartAction.jsp?id=<%=id %>" class="btn">add to cart</a>
        </div>
        <%
    	}
    }catch(Exception e)
    {
    	e.printStackTrace();
    }
        %>

    </div>

</section>

<!-- product section ends -->


<!-- contact section ends -->

<!-- newsletter section starts  -->

<!-- newsletter section ends -->

<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <a href="#" class="logo"><i class="fas fa-shopping-basket"></i>Sanket Groco</a>
            <p>Shop No-5, chaurang complex, Mahadev Nagar,<br> Manjari Road, Hadapsar, Pune 412307 !! </p>
            <div class="share">
                <a href="#" class="btn fab fa-facebook-f"></a>
                <a href="#" class="btn fab fa-whatsapp"></a>
                <a href="#" class="btn fab fa-instagram"></a>
                <a href="#" class="btn fab fa-linkedin"></a>
            </div>
        </div>
        
        <div class="box">
            <h3>our location</h3>
            <div class="links">
                <a href="#">Pune</a>
                <a href="#">Mumbai</a>
                <a href="#">Nagpur</a>
                <a href="#">Ahmednagar</a>
                <a href="#">Shirdi</a>
            </div>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <div class="links">
                <a href="#">home</a>
                <a href="#">category</a>
                <a href="#">product</a>
                <a href="#">deal</a>
                <a href="#">contact</a>
            </div>
        </div>

    </div>

    <h1 class="credit"> created by <span> mr.Sanket Mulay </span> | all rights reserved.! </h1>

</section>

<!-- footer section ends -->

<!-- custom js file link  -->
<script src="script.js"></script>
    
</body>
</html>