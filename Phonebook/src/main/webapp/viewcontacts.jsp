<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="components/allcss.jsp" %>
<style type="text/css">
.crd-ho:hover{ 
background-color:#f0efed;
 
}


</style>

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
	
	
	
	<%
	
	//if deleting is successful
	String successDeleteMsg = (String)session.getAttribute("succMsg");
	String failedDeleteMsg =  (String)session.getAttribute("FailedMsg");
	
	//if editing is successful
	String success = (String)session.getAttribute("succEditMsg");
	if(success != null){
	%>
		<div class="alert alert-success" role="alert" > 
		<%= success %>
		</div>
	<% 
	}
	%>
	
	<% 
	
	//if deleting is not successful then we will get this alert
	if(failedDeleteMsg!=null){
	%>							
		<p class="text-danger  text-center"><%= failedDeleteMsg %></p>	
	<%
		session.removeAttribute("FailedMsg");
	}
	%>
	
	
	
	
	
	
	
	
	
	<div class="container">
		<div class="row p-4">
	
	
	
	<%
	if(u!=null){
		
		ContactDao dao = new ContactDao(DbConnect.getConn());
		List<Contact> list = dao.getallContacts(u.getId());
		//EACH CONTACT OBJECT RECEIVED IN THE LIST WILL BE USED TO MAKE A CARD
		for(Contact c: list){
		%>	

					<div class="col-md-3">
						<div class="card crd-ho">
							<div class="card-body">
							
							<h5>Name: <%= c.getName() %></h5>
							<p>Ph no: <%= c.getPhoneno()%></p>
							<p>Email: <%= c.getEmail()%></p>
							<p>About: <%= c.getAbout()%></p>
							</div>
							<div class="text-center">  
							
							<!-- so we will also send the contact id when edit button is clicked using URL rewriting -->
							<!-- -->
								<a href="editcontact.jsp?cid=<%= c.getId()%>" class="btn btn-success btn-sm text-white">Edit</a>
								<a href="delete?cid=<%=c.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
							</div>
							
						</div>
					</div>	
		<% 	
		}
	}
	%>	
		</div>
	</div>




</body>
</html>