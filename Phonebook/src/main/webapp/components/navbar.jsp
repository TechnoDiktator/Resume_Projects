<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">PhoneBook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa-light fa-house-window"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addContacts.jsp"><i class="fas fa-plus-square ml-2 mr-2"></i>Add phone Number</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="viewcontacts.jsp"><i class="fa fa-eye  ml-2 mr-2"></i>View Contact</a>
      </li>
    </ul>
    
    
    <!-- IF THE USER LOGIN WAS SUCCESSFUL THEN WE WILL MODIFY THE NAVBAR TO DELETE THE 
    LOGIN AND REGISTER BUTTONS -->
    <%
    User u = (User)session.getAttribute("user");
    
    if(u==null){
    	//IMPORTANT
    	//this mwans that no user has logged in yet and we need to show the register and login botton on the navbar
    	
    %>
    	
    	<form class="form-inline my-2 my-lg-0">
		<a href="login.jsp" class="btn btn-primary ml-1" ><i class="fa-solid fa-user mr-2"></i>Login</a>
		<a href="register.jsp" class="btn btn-success my-2 my-lg-0 ml-2 " ><i class="fa-regular fa-registered mr-1"></i>Register</a>
    	</form>
    <% 	
    }
    else{
    	//this means that a user is logged in so login and register button on the navbar will dissappear
    	//and we will show the user name instead
    %>
    	<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-success"><%= u.getName() %></button>
			<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-2 text-white">Logout</a>
    	</form>   
    <% 
    }
    
    %>
    
    
    
    <!-- LOGOUT POPUP -->
   	<!-- This popup gets triggered when the user clicks on the logout button -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <!-- IMPORTANT :--- THAT THE A TAG href ATTRIBUTE CAN ALSO TAKE IN A SERVLET NAME -->
	      <div class="modal-body">
	       	<h6>Do you want to logout ?</h6>
	       	
	       	<!--  The href attribute starts the goGet method of the mentioned page or servlet -->
	        <a href="logout" type="button" class="btn btn-primary">Logout</a>
	      </div>
	 
	    </div>
	  </div>
	</div>
		
    
    
  </div>
</nav>