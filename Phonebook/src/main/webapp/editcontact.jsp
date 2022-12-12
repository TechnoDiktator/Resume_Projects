<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@include file="components/navbar.jsp" %>

	<% 
	if(u == null){
			//if user is null that is there is no login then we redirect to loginpage
			session.setAttribute("invalidMsg", "Please Login First....");
			response.sendRedirect("login.jsp");
		}
	%>
	
	
	<div class="container-fluid mt-6">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Edit existing contact</h4>
						
						
						<!-- SUPPOSE USER SAVED A CONTACT HE IS REDIRECTED TO THE ADD CONTACT PAGE -->
						<%
						
						//IF a contact was successfully sac=ved then we will display a success msg as well on the page
						String success = (String)session.getAttribute("succEditMsg");
						String error = (String)session.getAttribute("failEditMsg");
							if(success != null){
						%>							
							<p class="text-success  text-center"><%= success %></p>	
						<% 	
						//if we refresh the page then we must remove the succAddMsg session attribute
							session.removeAttribute("succEditMsg");
						}
								
						if(error!=null){
						%>							
							<p class="text-danger  text-center"><%= error %></p>	
						<%
							session.removeAttribute("failEditMsg");
						}
						%>
						
						
						
						<form action="update"  method="post">
							
							<!-- IF LOGGED IN THEN YOU MUST BE HAVING AN ID -->
							<%
							
							int contactid = Integer.parseInt(request.getParameter("cid"));
							ContactDao dao = new ContactDao(DbConnect.getConn());
							Contact c = dao.getContactById(contactid);
							
							%>
							<!-- CODE ENDS -->
						
						
						
						
							<div class="form-group">
								<label for="exampleInputEmail1">Enter new name</label> <input
									 value="<%= c.getName() %>"  name="name"     type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" >
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email new address</label> <input
									value="<%= c.getEmail() %>" name="email"      type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Enter new Phone Number</label> <input
									value="<%= c.getPhoneno() %>"  name="phno"      type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
							
							<div class="form-group">
    							<label for="exampleFormControlTextarea1">About</label>
    							<textarea class="form-control" name="about"  id="exampleFormControlTextarea1" rows="3"><%= c.getAbout() %></textarea>
  							</div>
						
							
							<div class="text-center mt-2" >
								<button type="submit" class="btn btn-primary">Update Contact</button>
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