
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
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

<header>
    <div class="header-1">
        <a href="#" class="logo"><i class="fas fa-shopping-basket"></i>Sanket Groco</a>
		<%
		String email= session.getAttribute("email").toString();
		String name=null;
		try{
			Connection con = DatabaseConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select Name from customer where email='"+email+"'");
			while(rs.next()){
				name = rs.getString("Name");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
		<h3 style="font-size: 22px;"><%=name %></h3>
		
    </div>
    <div class="header-2">
        <div id="menu-bar" class="fas fa-bars"></div>
        <nav class="navbar">
            <a href="#home">home</a>
            <a href="#category">category</a>
            <a href="#product">product</a>
            <a href="#contact">contact</a>
        </nav>

        <div class="icons">
            <a href="checkout.jsp" class="fas fa-shopping-cart"></a>
            <a href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>Log Out</a>
        </div>
    </div>
</header>

<!-- header section ends -->
<!-- home section starts  -->

<section class="home" id="home">
    <div class="image">
        <img src="images/home-img.png" alt="">
    </div>

    <div class="content">
        <span>fresh and organic</span>
        <h3>your daily need products</h3>
    </div>

</section>

<!-- home section ends -->
<!-- banner section starts  -->

<section class="banner-container">
    <div class="banner">
        <img src="images/banner-1.jpg" alt="">
        <div class="content">
            <h3>special offer</h3>
            <p>upto 45% off</p>
        </div>
    </div>

    <div class="banner">
        <img src="images/banner-2.jpg" alt="">
        <div class="content">
            <h3>limited offer</h3>
            <p>upto 50% off</p>
        </div>
    </div>
</section>

<!-- banner section ends -->
<!-- category section starts  -->

<section class="category" id="category">

    <h1 class="heading">shop by <span>category</span></h1>
    <div class="box-container">
        <div class="box">
            <h3>vegitables</h3>
            <p>upto 50% off</p>
            <img src="images/category-1.png" alt="">
            <a href="vegitables.jsp" class="btn">shop now</a>
        </div>
        <div class="box">
            <h3>juice</h3>
            <p>upto 44% off</p>
            <img src="images/category-2.png" alt="">
            <a href="juice.jsp" class="btn">shop now</a>
        </div>
        <div class="box">
            <h3>meat</h3>
            <p>upto 35% off</p>
            <img src="images/category-3.png" alt="">
            <a href="meat.jsp" class="btn">shop now</a>
        </div>
        <div class="box">
            <h3>fruite</h3>
            <p>upto 12% off</p>
            <img src="images/fruits.jfif" alt="">
            <a href="friuts.jsp" class="btn">shop now</a>
        </div>
    </div>

</section>

<!-- category section ends -->
<!-- product section starts  -->

<section class="product" id="product">

    <h1 class="heading">latest <span>products</span></h1>
    <div class="box-container">
    
        <%
    try{
    	Connection con = DatabaseConnection.getCon();
    	Statement st = con.createStatement();
    	ResultSet rs = st.executeQuery("select * from product");
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


<!-- contact section starts  -->

<section class="contact" id="contact">

    <h1 class="heading"> <span>contact</span> us </h1>

    <form action="">

        <div class="inputBox">
            <input type="text" placeholder="name">
            <input type="email" placeholder="email">
        </div>

        <div class="inputBox">
            <input type="number" placeholder="number">
            <input type="text" placeholder="subject">
        </div>

        <textarea placeholder="message" name="" id="" cols="30" rows="10"></textarea>

        <input type="submit" value="send message" class="btn">

    </form>

</section>
<%
String msg = request.getParameter("msg");

if("addToCart".equals(msg))
{
%>
<script>
alert('Product Added to Cart');
</script>
<%} %>
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