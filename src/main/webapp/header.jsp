<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
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
            <a href="index.jsp">Back To Home</a>
        </nav>

        <div class="icons">
            <a href="checkout.jsp" class="fas fa-shopping-cart"></a>
            <a href="logout.jsp">Log Out</a>
        </div>
    </div>
</header>