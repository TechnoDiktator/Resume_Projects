<%@page import="com.entity.User"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("images/phoneimage.jpg");
	width: 100%;
	height: 150vh;
	background-repeat: no-repeat;
	background-size: cover;
	
}
</style>


</head>
<body>
<%@include file="components/navbar.jsp"%>
		
		
		<!-- IF USER REGISTRATION IS SUCCESSFUL THEN WE ARE SENT BACK TO THE HOME PAGE -->
		<!--  THE LOGIN AND REGISTER BUTTONS WILL DISAPPEAR - FOR THIS WE WILL WRITE SOME CODE IN THE NAVBAR  -->
		
		<%
			//User user = 	(User)session.getAttribute("user"); 
			//out.print(user);
		%>
		
	
		
		
		<div class="jumbotron jumbotron-fluid mt-0 mb-0">
			<div class="container w-100">
				<h1 class="display-4">Phonebook</h1>
				<p class="lead">Resume Project By - Tarang Rastogi</p>
			</div>
		</div>
	<div class="container-fluid back-img">

	</div>


<%@include file="components/footer.jsp"%>
</body>
</html>