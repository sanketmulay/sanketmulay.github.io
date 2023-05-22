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
		<div class="container-fluid">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">All Orders</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						<div class="panel-heading">All Orders</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>Customer Details</th>
											<th>Product</th>
											<th>Qty</th>
											<th>Total Amount</th>
											<th>Status</th>
											<th>Order Date & Time</th>
											<th>Payment Mode</th>
											<th>Action</th>
										</tr>
									</thead>
									
									<tbody>
									<%
									try{
										Connection con = DatabaseConnection.getCon();
										Statement st = con.createStatement();
										//select * from cart inner join customer on cart.email=customer.email where cart.status='placed'
								
										ResultSet rs = st.executeQuery("select * from orders where status='pending'");
										while(rs.next()){
											int id = rs.getInt("id");
											String name = rs.getString("Name");
											String email = rs.getString("email");
											String phone = rs.getString("phone");
											String address = rs.getString("address");
											String pincode = rs.getString("pincode");
											String productName = rs.getString("productName");
											String fileName = rs.getString("fileName");
											String quantity = rs.getString("quantity");
											int totalAmount = rs.getInt("totalAmount");
											String status = rs.getString("status");
											String date = rs.getString("dateAndTime");
											String paymentMode = rs.getString("paymentMode");
									
									%>
										<tr>
											<td><%=name %>|<%=email %>|<%=phone %>|<%=address %>|<%=pincode %></td>
											<td><img src="uploads/<%=fileName %>"
												alt="" class="pro-image-front"
												style="width: 150px; height: 100px;"><br><%=productName %></td>
											<td><%=quantity %></td>
											<td><%=totalAmount %></td>
																						
											<td><span class="label label-danger">Pending</span></td>
											
											
											<td><%=date %></td>
											<td><%=paymentMode %></td>
											
											<td><a
												href="CustomerProductsOrderStatus.jsp?id=<%=id%>&&date=<%=date%>"><button
														class="btn btn-danger"
														>Cancel</button></a></td>
											
											<td><a
												href="ChangetodeliverStatus.jsp?id=<%=id%>&&date=<%=date%>"><button
														class="btn btn-primary"
														>Deliver</button></a></td>
											
										</tr>
										<%	}
									}catch(Exception e)
									{
										e.printStackTrace();
									} %>
									</tbody>	
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
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
