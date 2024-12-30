
<%@page import="java.util.*"%>
<%@page import="model.Dproduct"%>
<%@page import="model.Registration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Booking</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
.container{
 background-color: rgba(0, 0, 0, 0.6);
    color: #8b6508;
}
.ip{
	width:50%;
}

.custom-button {
     background-color: #8b6508; /* Background color */
    color: #131f34; /* Text color */
    border: 2px solid #ffffff; /* Border color */
    padding: 10px 15px;
    margin-top:50px; /* Padding */
    border-radius: 10px; /* Rounded corners */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s, border-color 0.3s; 
    width:100%;/* Smooth transition */
    border-color: #8b6508;
}

.custom-button:hover {
background-color: #131f34;
    /* Darker background color on hover */
    border-color: #131f34;
     color: #8b6508;  /* Darker border color on hover */
}

.errmsg {
	padding: 10px;
	width: 100%;
	color: green;
	font-weight: bold;
}

.error {
	color: red;
}
body{
	background-image:url("backgroun-login.jpeg");
	background-size: cover; /* Ensures the image covers the entire div */
    background-position: center;
    background-attachment: fixed;
}


</style>
<script>
	// jQuery.validator.addMethod( name, method [, message ] )
	//
	// value---> "current value of the validated element".
	//elememt---> " element to be validated ".
	jQuery.validator
			.addMethod(
					"checkemail",
					function(value, element) {
						return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
								.test(value)
								|| /^[0-9]{10}$/.test(value);
					});
	jQuery(document).ready(function($) {
		$("#bookevent").validate({
			rules : {
				name : {
					required : true
				},
				email : {
					required : true,
					checkemail : true
				},
				pno : {
					required : true,
					minlength : 10,
					maxlength : 10
				},
				address : {
					required : true
				},
				edate : {
					required : true,
				}
			},
			messages : {
				name : {
					required : "Please enter the name."
				},
				email : {
					required : "Please enter the email.",
					email : "Please enter valid email id"
				},
				pno : {
					required : "Please enter the number.",
					minlength : "Please enter the 10 digit number .",
					maxlength : "more than 10 digits."
				},
				address : {
					required : "Please enter the address.",
				},
				edate : {
					required : "Please select the date.",
				}
			}
		});
	});
</script>
</head>
<body 
	style=" font-style: inherit; ">
	<%@include file="header.jsp"%>	<div style="height:120px"></div>
	<center>
		<%
		if (request.getAttribute("status") != null) {
		%>
		<div class="container-fluid  mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left: 100px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
					<div class="col-sm-3" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Book <b>Event</b>
							</h3>
						</div>
						<div class="col-sm-1" style="color:#131f34;">
							
						</div>
						<% if(request.getAttribute("status").equals("Date not available for event")){ %>
						<div class="col-sm-8" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								<%=request.getAttribute("status")%>
							</h3>
						</div>
						<%}else{ %>
						<div class="col-sm-8" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								<%=request.getAttribute("status")%><a href="EventStatus.jsp" style="color:#131f34; text-decoration: none;"><i> Click here</i> </a> to check status
							</h3>
						</div>
						<%} %>
					</div>
				</div>
			</h1>
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
								Book <b>Event</b>
							</h3>
						</div>
						<div class="col-sm-4" style="color:#131f34;">
							
						</div>
		
		<%} %>
		<%
		if (session.getAttribute("uname") != null) {
			Registration en = new Registration(session);
			Dproduct s = en.getEventFormInfo(request.getParameter("event_id"));
		%></center>		
			<div class="container  rounded-3" style="width:1000px; height:auto;">
    			<div class="row">
    				<div class="col-6 p-0">
    				<img src="<%=s.getP_image()%>" class=" rounded m-0 p-0 ms-0 ps-0 ml-0" width="100%" height="100%">
    				
    				</div>
    				<div class="col-6">
    		
        
           
            <form action='addtocart' method='POST' id="bookevent" class="form-group">
              <div class="mb-1">
                <label for="name" class="form-label h5 ms-4 mt-4 mb-0">Username</label>
                <input type="text" class="form-control rounded-5 mb-2 " id="name" placeholder="Enter your name" name="name" value="<%=session.getAttribute("uname")%>" style="width: 85%; margin-left: 20px;" required>
              </div>
              <div class="mb-1">
                <label for="email" class="form-label h5 ms-4 mt-2 mb-0" >Email</label>
                <input type="email" class="form-control rounded-5 mb-2" id="email" name="email" value="<%=session.getAttribute("email")%>" placeholder="Enter your email" style="width: 85%; margin-left: 20px;" required>
              </div>
              <div class="mb-1">
                <label for="address" class="form-label h5 ms-4 mt-2 mb-0">Address</label>
                <input type="text" class="form-control rounded-5 mb-2" id="address" placeholder="Enter your address" name="address" style="width: 85%; margin-left: 20px;" required>
              </div>
              <div class="mb-1">
                <label for="event" class="form-label h5 ms-4 mt-2 mb-0">Event Name</label>
                <input type="text" class="form-control rounded-5 mb-2" id="event" placeholder="Enter the event name" name="ename" value="<%=s.getP_name()%>" style="width: 85%; margin-left: 20px;" readonly>
              </div>
              <div class="mb-1">
                <label for="cost" class="form-label h5 mt-2 mb-0 ms-4">Event Cost</label>
                <input type="number" class="form-control rounded-5 mb-2" id="cost" placeholder="Enter your cost" name="ecost" value="<%=s.getP_cost()%>" style="width: 85%; margin-left: 20px;" readonly>
              </div>
              <div class="mb-1">
                	 <label for="cost" class="form-label h5 ms-4 mt-2 mb-0">Event Date</label>
					<input type="date" id="myDate"
						class="form-control rounded-5" name="edate" value="" placeholder="Event Date" style="width: 85%; margin-left: 20px;"
						onfocus="disablePastDates()">
				
              </div>
              <input type="hidden" name="event_id"
					value="<%=request.getParameter("event_id")%>"></br>
              <div class="d-grid">
                <button type="submit" class=" custom-button mt-2 mb-2 " name="bookevent"><b>Book</b></button>
              </div>
            </form>
          </div>
     </div>
  </div>
		<%
		}
		%>
	
	<div style="height:20px"></div>
	<script type="text/javascript">
		function disablePastDates() {
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0');
			var yyyy = today.getFullYear();
			today = yyyy + '-' + mm + '-' + dd;
			document.getElementById("myDate").setAttribute("min", today);
		}
	</script>
	</body>
</html>