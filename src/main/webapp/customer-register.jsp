<!DOCTYPE html>
<html>

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
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
	<link rel="stylesheet"
		href="../../../../../images/demobar_w3_4thDec2019.css">

		<header>
		<div class="header-1">
			<a href="#" class="logo"><i class="fas fa-shopping-basket"></i>Sanket Groco</a>
		</div>
	</header>


	<div class="modal-dialog" role="document">
		<div class="modal-content modal-info">
			<div class="modal-body modal-spa">
				<div class="login-grids">
					<div class="login">
						<div class="login-bottom">
							<h3>Customer Sign up</h3>
						
							<%
							String wrong = request.getParameter("msg");
							
							if("notRegister".equals(wrong))
							{
							%>
							
							<div class="alert alert-danger" id='danger' style="width: 680px;">Customer
								Registration Fail,Please try again</div>
							
							<%} %>
							<form action="AddCustomer" method="post">
								<div class="sign-up">
									<h4>Your Name :</h4>
									<input type="text" placeholder="Your Name" required=""
										style="width: 680px;" name="name">
								</div>
								<div class="sign-up">
									<h4>Email :</h4>
									<input type="text" placeholder="Type here" required=""
										style="width: 680px;" name="email">
								</div>
								<div class="sign-up">
									<h4>Password :</h4>
									<input type="password" placeholder="Password" required=""
										style="width: 680px;" name="password">

								</div>
								<div class="sign-up">
									<h4>Phone :</h4>
									<input type="text" placeholder="Type here" required=""
										style="width: 680px;" name="mobile">
								</div>
								<div class="sign-up">
									<h4>Gender :</h4>
									<br> <select class="form-control" style="width: 680px;"
										name="gender">
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
								</div>
								<br>
								<div class="sign-up">
									<h4>Address :</h4>
									<input type="text" placeholder="Type here" required=""
										style="min-height: 100px; width: 680px;" name="address">
								</div>

								<div class="sign-up">
									<h4>Pincode :</h4>
									<input type="text" placeholder="Pincode" required=""
										style="width: 680px;" name="pincode">

								</div>
								<div class="sign-up">
									<input type="submit" value="REGISTER NOW" style="width: 680px;">
									<input type="submit" value="Login" class="btn btn-primary" style="width:680px">
								</div>

							</form>
						</div>
						<div class="clearfix"></div>
					</div>
					<p>
						<a href="customer-login.jsp">Existing Customer? Log In</a>
					</p>
				</div>
			</div>
		</div>

	</div>
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
