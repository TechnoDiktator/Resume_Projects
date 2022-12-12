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
	
	
	
	
	<div class="container-fluid mt-6">
		<div class="row p-6">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Register Here</h4>
						
						<!-- SESSION  CODE START-->
						<%
							String success = (String)session.getAttribute("successMsg");
							String error = (String)session.getAttribute("errorMsg");
							if(success != null){
						%>							
							<p class="text-success  text-center"><%= success %></p>	
						<% 	
						//if we refresh the page then we must remove the session attribute
							session.removeAttribute("successMsg");
						}
								
						if(error!=null){
						%>							
							<p class="text-danger  text-center"><%= error %></p>	
						<%
							session.removeAttribute("errorMsg");
						}
						%>
						<!-- SESSION CODE END -->
						
						
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter your name</label> <input
									type="text" name="name" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
						
							
							<div class="text-center mt-2" >
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
							
						</form>
					</div>
				</div>

			</div>


		</div>


	</div>
	
<div style="margin-top: 500px;">

<%@include file="components/footer.jsp"%>

</div>

</body>
</html>