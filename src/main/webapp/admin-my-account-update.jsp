
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
					<h4 class="header-line">Edit My Account Information</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">Edit My Account Information</div>
					
						<div class="panel-body">
							<form role="form" action="admin-my-account-update-process.jsp" method="post">
								<div class="form-group">
									<label>Id</label> <input class="form-control"
										type="text" name="aid" value="aaaa" readonly/>
								</div>
								<div class="form-group">
									<label>User Name</label> <input class="form-control"
										type="text" name="uname" value="aaa"/>
								</div>
								<div class="form-group">
									<label>Email Id</label> <input class="form-control" type="text"
										name="email" value="aaaa"/>
								</div>
								<button type="submit" class="btn btn-success">Update
									Product</button>
							</form>
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
