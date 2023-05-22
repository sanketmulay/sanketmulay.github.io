
<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<html class="no-js" lang="">
<head>

<title>Online Grocery Shopping System</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">

<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="assets/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
	<%
	String name=request.getParameter("name");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String pincode = request.getParameter("pincode");
	String date = request.getParameter("date");
	String dateAndTime = request.getParameter("dateAndTime");
	%>
	<div id="exampl">
			<br><center>
			<table border="2" cellspacing="2" cellpadding="2" width="80%">
				<tr>
					<td colspan="7"><strong><center>Grocery Shopping Order Receipt</center></strong></td>
				</tr>
				

				<tr>
					<th colspan="3">Customer Name</th>
					<td colspan="4"><%=name %></td>
				</tr>
				<tr>
					<th colspan="3">Address</th>
					<td colspan="4"><%=address %></td>
				</tr>
				<tr>
					<th colspan="3">Email Id</th>
					<td colspan="4"><%=email %></td>
				</tr>
				<tr>
					<th colspan="3">Phone No</th>
					<td colspan="4"><%=phone %></td>
				</tr>
				<tr>
					<th colspan="3">Pin Code</th>
					<td colspan="4"><%=pincode %></td>
				</tr>
				<tr>
					<th colspan="3">Order Date & Time</th>
					<td colspan="4"><%=dateAndTime %></td>
				</tr>
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Total Price</th>
				</tr>
				<%
				try{
					Connection con = DatabaseConnection.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from orders where dateAndTime='"+dateAndTime+"' AND email='"+email+"'");
					while(rs.next()){
						String productName = rs.getString("productName");
						int quantity = rs.getInt("quantity");
						int totalAmount = rs.getInt("totalAmount");
					
				
				%>
				<tr>
					<td><%=productName %></td>
					<td><%=quantity %></td>
					<td><%=totalAmount %></td>
				</tr>
				<%
				
					}
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				%>
				<tr>
					<th colspan="1">Remark</th>
					<td colspan="1">NA</td>
					<td colspan="1" style="text-align: center; cursor: pointer"><i
						class="fa fa-print fa-2x" aria-hidden="true"
						OnClick="CallPrint(this.value)"></i></td>
						<%
						Connection con1 = DatabaseConnection.getCon();
						Statement st1 = con1.createStatement();
						ResultSet rs1 = st1.executeQuery("select sum(totalAmount) from orders where dateAndTime='"+dateAndTime+"' AND email='"+email+"'");
						while(rs1.next()){
							String amt = rs1.getString(1);
						
						%>
					<td colspan="4"><strong><center>Total Amount To Be Paid.:&nbsp;<font color="blue"><%=amt %></font></center></strong></td>
						<%} %>
				</tr>
				</center>
			</table>
			<center>
			<div class="checkout-left">
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="index.jsp"><span class="glyphicon glyphicon-menu-left"
						aria-hidden="true"></span>Back To Shopping</a>
			</div>
			</center>
		</div>
	<script>
		function CallPrint(strid) {
			var prtContent = document.getElementById("exampl");
			var WinPrint = window
					.open('', '',
							'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
		}
	</script>

</body>
</html>