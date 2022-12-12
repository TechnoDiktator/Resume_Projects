<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>


<%@include file="components/navbar.jsp"%>


	<%
	if(u == null){
		//if user is null that is there is no login then we redirect to loginpage
		session.setAttribute("invalidMsg", "Please Login First....");
		response.sendRedirect("login.jsp");
		
	}else{
		
		int id = u.getId();
	}	
	
	%>
	
	<div class="container-fluid mt-6">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add new contact</h4>
						
						
						<!-- SUPPOSE USER SAVED A CONTACT HE IS REDIRECTED TO THE ADD CONTACT PAGE -->
						<%
						
						//IF a contact was successfully sac=ved then we will display a success msg as well on the page
						String success = (String)session.getAttribute("succAddMsg");
						String error = (String)session.getAttribute("failAddMsg");
							if(success != null){
						%>							
							<p class="text-success  text-center"><%= success %></p>	
						<% 	
						//if we refresh the page then we must remove the succAddMsg session attribute
							session.removeAttribute("succAddMsg");
						}
								
						if(error!=null){
						%>							
							<p class="text-danger  text-center"><%= error %></p>	
						<%
							session.removeAttribute("failAddMsg");
						}
						%>
						
						
						
						<form action="addContact"  method="post">
							
							<!-- IF LOGGED IN THEN YOU MUST BE HAVING AN ID -->
							<%
							if(u!=null){
							%>
							<input type="hidden" name="userid"  value="<%= u.getId() %>">
							<% 
							}							
							%>
							<!-- CODE ENDS -->
						
						
						
						
							<div class="form-group">
								<label for="exampleInputEmail1">Enter your name</label> <input
									  name="name"     type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email"      type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone Number</label> <input
									name="phno"      type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
							
							<div class="form-group">
    							<label for="exampleFormControlTextarea1">About</label>
    							<textarea class="form-control" name="about"  id="exampleFormControlTextarea1" rows="3"></textarea>
  							</div>
						
							
							<div class="text-center mt-2" >
								<button type="submit" class="btn btn-primary">Save Contact</button>
							</div>
							
						</form>
					</div>
				</div>

			</div>


		</div>


	</div>
	


<!-- FOOTER -->
<div style="margin-top: 500px;">
<%@include file="components/footer.jsp"%>
</div>



</body>
</html>