
<!DOCTYPE html>
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

	<header>
		<div class="header-1">
			<a href="#" class="logo"><i class="fas fa-shopping-basket"></i>Sanket Groco</a>

		</div>
	
			<div class="header-2">
			<div id="menu-bar" class="fas fa-bars"></div>
			<nav class="navbar">
				<a href="dashboard.jsp">home</a>
				<a href="admin-add-product.jsp">Add Product</a>
				<a href="admin-view-product.jsp">View Product</a>
				<a href="admin-all-orders.jsp">View Order</a>
				<a href="admin-pending-orders.jsp">Pending Order</a>
				<a href="admin-delivered-orders.jsp">Deliver Order</a>
			</nav>
		</div>
	</header>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">View Contacts</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						<div class="panel-heading">View Contacts</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Name</th>
											<th>Email-Id</th>
											<th>Message</th>
											<th>Date</th>
											<th>Action</th>
										</tr>
									</thead>
									
									<tbody>
										<tr>
											<td>id</td>
											<td>name</td>
											<td>email</td>
											<td>message</td>
											<td>conact date/td>
											<td><a
												href="admin-delete-contacts.jsp?id=aa"
												class="btn btn-danger" onclick="return confirm('Are you sure Do you want to delete this contact?');">Delete</a></td>
										</tr>
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
	<jsp:include page="admin-footer.jsp"></jsp:include>
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
