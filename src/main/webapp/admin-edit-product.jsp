<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- font awesome cdn link  -->
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
					<h4 class="header-line">Add Product</h4>

				</div>
			</div>
			<%
			String id = request.getParameter("id");
			
			try{
				Connection con = DatabaseConnection.getCon();
				Statement st = con.createStatement();
				
				ResultSet rs = st.executeQuery("select * from product where id="+id+"");
				while(rs.next()){
					int idd=rs.getInt("id");
					String productName = rs.getString("productName");
					int productPrice = rs.getInt("productPrice");
					int productMRPPrice = rs.getInt("productMRPPrice");
					String productDescription = rs.getString("productDescription");
					String status = rs.getString("status");
					String productCategory = rs.getNString("productCategory");
			%>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">Add Product</div>
						<div class="panel-body">
							<form role="form" action="EditProducts" method="post">
								<input type="hidden" name="id" value="<%=idd%>" > 
								<div class="form-group">
									<label>Enter Name</label> <input class="form-control"
										type="text" value="<%=productName %>" name="pname" />
								</div>
								<div class="form-group">
									<label>Price</label> <input class="form-control" type="number"
										value="<%=productPrice %>" name="price" />
								</div>
								<div class="form-group">
									<label>MRP Price</label> <input class="form-control"
										type="number" value="<%=productMRPPrice %>" name="mprice" />
								</div>
								<div class="form-group">
									<label>Description</label> <input class="form-control"
										type="text" style="min-height: 100px;" value="<%=productDescription %>" name="description" />
								</div>
								<div class="form-group">
									<label>Status</label> <select class="form-control"
										name="status">
										<option value="<%=status%>">Select Status</option>
										<option value="active">Active</option>
										<option value="in-active">In-Active</option></select>
								</div>
								<div class="form-group">
									<label>Product Category</label> <select class="form-control"
										name="category">
										<option value="<%=productCategory%>">Select Category</option>
										<option value="vegetables">Vegetables</option>
										<option value="juice">Juice</option>
										<option value="fruit">Fruit</option>
										<option value="meat">Meat</option>
										<!-- <option>XYZ</option> --></select>
								</div>
								<button type="submit" class="btn btn-success">Save Changes</button>
							</form>
						</div>
					</div>
				</div>

			</div>
			<%	}
			}catch(Exception e)
			{
				System.out.println(e);
			} %>

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
</html>
