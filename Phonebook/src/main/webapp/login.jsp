<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allcss.jsp"%>
</head>
<body style="background-color: #ebedeb; ">
	

	<%@include file="components/navbar.jsp"%>
	
	
	
	
	<div class="container-fluid mt-4 align-center">
		<div class="row p-5">
			<div class="col-md-4 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Login Here</h4>
						
						
						<!-- IF USER LOGIN FAILS THEN THIS CODE WORKS -->
						<% 
						String invalidMessage = (String)session.getAttribute("invalidMsg");
						if(invalidMessage != null){
						%>
						<p class="text-danger text-center"><%=invalidMessage%></p>
						<%
						//if we press resresh on the login page then the failure msg wi;l dissappear
						session.removeAttribute("invalidMsg");
						} 
						%>
						<!-- LOGIN FAIL CODE ENDS -->
						
						
						
						<!-- LOGGED OUT SUCCESSFULLY CODE HERE  -->
						<% 
						String logoutMessage = (String)session.getAttribute("logoutMsg");
						if(logoutMessage != null){
						%>
						<p class="text-danger text-center"><%=logoutMessage%></p>
						<%
						//if we press resresh on the login page then the failure msg wi;l dissappear
						session.removeAttribute("logoutMsg");
						} 
						%>
						<!-- LOGGED OUT SUCCESSFULLY CODE ENDS  -->
						
						
						
						
						<form action="login" method="post">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name = "email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name = "password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
						
							
							<div class="text-center mt-2" >
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
						
						
						
					</div>
				</div>

			</div>


		</div>


	</div>
<div style="margin-top: 400px;">
<%@include file="components/footer.jsp"%>
</div>


</body>
</html>