<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete User</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	

<style type="text/css">
.errmsg{
           width: 70%;
           color: green;
           font-weight: bold;
       }
.Container-fluid {
	width: 80%;
	height:auto;
	background-color: rgba(0, 0, 0, 0.0);
	margin-top: 150px;
	margin-left: 140px;
	border-radius: 10px;
}
.Container{
	width:70%;
	height:auto;
	margin-left: 50px;
}
#bggold{
	background-color: #8b6508;
}
#gold{
color: #8b6508;
}
</style>
</head>
<body style="background-image: url('backgroun-login.jpeg');">
	<%@include file="header.jsp"%><div style="height:120px"></div>
	
	<center>	
	<%
		if (request.getAttribute("status") != null) {
		%>
		<div class="container-fluid  mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left: 100px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
					<div class="col-sm-3" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Delete <b>User</b>
							</h3>
						</div>
						<div class="col-sm-1" style="color:#131f34;">
							
						</div>
						<div class="col-sm-8" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								<%=request.getAttribute("status")%>
							</h3>
						</div>
					</div>
				</div>
			
		<%
		}else{
		%>
		<div class="container-fluid  mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 57px; margin-left: 100px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
						<div class="col-sm-4" style="color:#131f34;">
							
						</div>
						<div class="col-sm-4" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Delete <b>User</b>
							</h3>
						</div>
						<div class="col-sm-4" style="color:#131f34;">
							
						</div>
					</div>
					</div>
					
		<%} %>
	
	
	
	
	
	
	
	<div class="Container">
		
			
			
			<input class="form-control" id="search" type="text" placeholder="Search.." style="width:70%;">
			
               <table class="table  table-hover  mb-3">
                   <thead >
                       <tr style=" border-bottom: 1px #8b6508;">
                   <br>
                           <th style="background-color: #131f34; color:#8b6508;">Id no</th>
                           <th style="background-color: #131f34; color:#8b6508;">Name</th>
                           <th style="background-color: #131f34; color:#8b6508;">Email</th>
                           <th style="background-color: #131f34; color:#8b6508;">Phone</th>
                           <th style="background-color: #131f34; color:#8b6508;">Date</th>
                           <th style="background-color: #131f34; color:#8b6508;">Delete</th>
                       </tr>
                   </thead>
		                   <tbody id="table">
                       <% if (session.getAttribute("id") != null 
                               && session.getAttribute("id").equals("1")) {
                               Registration reg = new Registration(session);
                               ArrayList<User> mydata = reg.getUserDetails();
                               
                               Iterator<User> itr = mydata.iterator();
                               while (itr.hasNext()) {
                                   User s = itr.next();
                       %>
                       <tr style="border-bottom: 1px #8b6508; ">
                           <td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getId()%></b></td>
                           <td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getName()%></b></td>
                           <td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getEmail()%></b></td>
                           <td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getPhoneNumber()%></b></td>
                           <td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getDate()%></b></td>
                           <td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;">
                               <form action="delete" method="POST">
                                   <input type="hidden" name="userid" value="<%=s.getId()%>" />
                                   <input type="submit" class="btn btn-danger" value="Delete" />
                               </form>
                           </td>
                       </tr> 

                       <%}
                       }%> 
                   </tbody>
		
		
		
		
		
		
		
		</div></center>
	
 <script>
$(document).ready(function(){
$("#search").on("keyup", function() {
var value = $(this).val().toLowerCase();
//alert(value);
$("#table tr").filter(function() {
$(this).toggle($(this).text().toLowerCase().indexOf(value) > 0)
//alert(this);
});
});
});
</script>

</body>

</html>