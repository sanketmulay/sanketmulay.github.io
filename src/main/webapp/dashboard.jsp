<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:46:41 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Online Grocery Shopping System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

	<!-- custom css file link  -->
	<link rel="stylesheet" href="style.css">
</head>
<body>

				<jsp:include page="admin-header.jsp"></jsp:include>

	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">ADMIN DASHBOARD</h4>

				</div>

			</div>
<%
int totalProduct=0;
int totalCustomer=0;
int totalOrders=0;
try{
	Connection con = DatabaseConnection.getCon();
	
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select count(id) from product");
	while(rs.next()){
		totalProduct=rs.getInt(1);
	}
	
	ResultSet rs1 = st.executeQuery("select count(email) from customer");
	while(rs1.next()){
		totalCustomer=rs1.getInt(1);
	}
	ResultSet rs3 = st.executeQuery("select count(id) from orders where status='pending'");
	while(rs3.next()){
		totalOrders = rs3.getInt(1);
	}
}catch(Exception e)
{
	e.printStackTrace();
}

%>
			<div class="row">

				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-info back-widget-set text-center">
						<i class="fa fa-history fa-5x"></i>
						
						<h3>
							<%=totalProduct %>
						</h3>
						Total Products
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-success back-widget-set text-center">
						<i class="fa fa-users fa-5x"></i>
						
						<h3><%=totalCustomer %></h3>
						Total Customers
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-warning back-widget-set text-center">
						<i class="fa fa-recycle fa-5x"></i>
						
						<h3><%=totalOrders %></h3>
						Total Orders
					</div>
				</div>

			</div>
			
			
			
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
		<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
	
</body>
</html>
