<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<html>

<!-- Mirrored from p.w3layouts.com/demos/apr-2016/05-04-2016/smart_shop/web/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 23 Jul 2020 05:57:57 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<title>Online Grocery Shopping System</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Smart Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
		
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }

</script>
<!-- //for-mobile-apps -->
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script src="js/jquery.easing.min.js"></script>
<script src="jquery-3.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

	<!-- custom css file link  -->
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<script
		src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script
		src="../../../../../../m.servedby-buysellads.com/monetization.js"
		type="text/javascript"></script>
	<script>
		(function() {
			if (typeof _bsa !== 'undefined' && _bsa) {
				// format, zoneKey, segment:value, options
				_bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
			}
		})();
	</script>
	<script>
		(function() {
			if (typeof _bsa !== 'undefined' && _bsa) {
				// format, zoneKey, segment:value, options
				_bsa.init('fancybar', 'CKYDL2JN', 'placement:demo');
			}
		})();
	</script>
	<script>
		(function() {
			if (typeof _bsa !== 'undefined' && _bsa) {
				// format, zoneKey, segment:value, options
				_bsa.init('stickybox', 'CKYI653J', 'placement:w3layoutscom');
			}
		})();
	</script>

	<!--<script>(function(v,d,o,ai){ai=d.createElement("script");ai.defer=true;ai.async=true;ai.src=v.location.protocol+o;d.head.appendChild(ai);})(window, document, "//a.vdo.ai/core/w3layouts_V2/vdo.ai.js?vdo=34");</script>-->
	<div id="codefund">
		<!-- fallback content -->
	</div>
	<script src="https://ethicalads.io/?ref=codefund" async="async"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src='https://www.googletagmanager.com/gtag/js?id=UA-149859901-1'></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-149859901-1');
	</script>

	<script>
		window.ga = window.ga || function() {
			(ga.q = ga.q || []).push(arguments)
		};
		ga.l = +new Date;
		ga('create', 'UA-149859901-1', 'demo.w3layouts.com');
		ga('require', 'eventTracker');
		ga('require', 'outboundLinkTracker');
		ga('require', 'urlChangeTracker');
		ga('send', 'pageview');
	</script>
	<script async src='../../../../../js/autotrack.js'></script>

	<meta name="robots" content="noindex">
<body>
		<jsp:include page="header.jsp"></jsp:include>
	
	<div class="checkout">
		<div class="container">
			<h3>My Cart</h3>
		
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th>MRP(Rs)</th>
							<th>Selling Price(Rs)</th>
							<th>Total Price(Rs)</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<%
					String email = session.getAttribute("email").toString();
					try{
						Connection con = DatabaseConnection.getCon();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' AND status='cart'");
						while(rs.next()){
							int id = rs.getInt("id");
							String fileName=rs.getString("fileName");
							String productName = rs.getString("productName");
							int quantity = rs.getInt("quantity");
							int productMRPPrice=rs.getInt("productMRPPrice");
							int productPrice = rs.getInt("productPrice");
							int totalAmount=rs.getInt("totalAmount");
							
					%>
					<tr class="rem1">
						<td class="invert"><img
							src="uploads/<%=fileName %>" alt="loading"
							class="pro-image-front" style="width: 150px; height: 100px;"><br><%=productName %></td>
						<td class="invert">1
						</td>
						<td class="invert"><del><%=productMRPPrice %>&nbsp;Rs.
							</del></td>
						<td class="invert"><%=productPrice %>&nbsp;Rs.</td>
						<td class="invert"><%=totalAmount %>&nbsp;Rs.</td>
						<td class="invert"><a
							href="removeProductFromCart.jsp?id=<%=id %>"
							onclick="return confirm('Are you sure you want to remove this item from cart?');"><i
								class="fa fa-trash"></i></a></td>
					</tr>
					<%
						}
					}catch(Exception e)
					{
						e.printStackTrace();
					}
					int total=0;
					try{
						Connection con = DatabaseConnection.getCon();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery(" select sum(totalAmount) from cart where email='"+email+"' AND status='cart'");
						while(rs.next()){
							total=rs.getInt(1);
						}
					}catch(Exception e)
					{
						e.printStackTrace();
					}
					%>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="2"><strong><center>
								Total Amount.:&nbsp;<%=total %>
									Rs.</center></strong>
						</td>
					</tr>
					
					</tbody>
				</table>
				</div>
			<div>
				<br> <br> <br>
			</div>
			<%
				
				try{
					Connection con = DatabaseConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from customer where email='"+email+"'");
					while(rs.next()){
						String name = rs.getString("Name");
						String phone = rs.getString("phone");
						String cemail = rs.getString("email");
						String address = rs.getString("address");
						int pinCode = rs.getInt("pincode");
						
					
				%>
			<form action="GetProductsOrder" method="post">
				<h4>
					<font color="blue"><strong>Billing Address</strong></font>
				</h4>
				<br>
				<h4 class="text-justify">
					<font color="red">Note: Now only cash on delivery payment
						mode is available.</font>
				</h4>
				<br>
				
				<div>
					<div class="form-group">
						<label>Your Name</label> <input type="text" name="name"
							value="<%=name %>" placeholder=""
							 style="width: 1135px; height: 40px;"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Phone Number</label> <input type="text" name="phone"
							value="<%=phone %>" placeholder=""
							 style="width: 1135px; height: 40px;"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Email Id</label> <input type="text" name="email"
							value="<%=email %>" placeholder=""
							 style="width: 1135px; height: 40px;"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Address</label> <input type="text" name="address"
							value="<%=address %>" placeholder=""
							 style="width: 1135px; height: 100px;"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Pin Code</label> <input type="text" name="pincode"
							value="<%=pinCode %>" placeholder=""
							required="" style="width: 1135px; height: 40px;"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>Select Address Type</label> <select name="addressType"
							 style="width: 1135px; height: 40px;"
							class="form-control">
							<option value="home">Home</option>
							<option value="office">Office</option>
							<option value="commercial">Commercial</option>
						</select>
					</div>
					<div class="form-group">
						<label>Select Payment Mode</label> <select name="payment"
							style="width: 1135px; height: 40px;" class="form-control">
							<option value="COD" selected="selected">COD</option>
							<option value="credit card" disabled="disabled">Credit Card</option>
							<option value="debit card" disabled="disabled">Debit Card</option>
							<option value="online banking" disabled="disabled">Online Banking</option>
							<option value="upi id" disabled="disabled">UPI Id</option>
						</select>
					</div>
					<div>
						
						<input type="text" name="payment_id" value="aaa" hidden>
						<input type="submit" value="Buy Products" class="btn btn-success"
							onclick="return confirm('Are you sure Do you want to buy this order?');">
					</div>
				</div>
			</form>
				<%}
				}catch(Exception e)
				{
					e.printStackTrace();
				} %>
		
			<div class="checkout-left">
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="index.jsp"><span class="glyphicon glyphicon-menu-left"
						aria-hidden="true"></span>Back To Shopping</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //check out -->
	<!---728x90--->
		<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
	
</body>
</html>
