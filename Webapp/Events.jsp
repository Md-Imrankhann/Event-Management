<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="model.Dproduct"%>
<%@page import="model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Events</title>
<style>
.border-sm-start-none {
	border-left: none !important;
}

section {
	background-image: url("backgroun-login.jpeg");
	background-attachment: fixed;
}

.card img {
	width: 100%;
	height: 100%;
}

.card {
	max-width: 100%;
	max-height:fixed;
	box-shadow: 0 1px 3px 0 #d4d border-radius: .28571429rem; 4 d5 , 0 0 0 1px #d4d4d5;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease, transform 0.3s ease;
	cursor: pointer;
	border-color: #131f34;
	
	
}



.card:hover {
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
	transform: translateY(-5px);
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

.left-border {
  border-left: 2px solid blue; /* Add a left border with thickness and color */
  padding-left: 10px; /* Optional: Adds some space between the border and content */
  border-color: #8b6508;
}

</style>
</head>
<body>



	<%@include file="header.jsp"%>
	<div style="height: 120px;"></div>
	
	<%
	Registration r = new Registration(session);

	ArrayList<Dproduct> al = r.get_eventinfo(request.getParameter("event_category"));

	Iterator<Dproduct> it = al.iterator();
	%>
	<section>
	<div class="container-fluid  mb-2 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left: 87px; margin-top: -20px; font-style: inherit; color: white; ">
					<div class="row">
						<div class="col-sm-6" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								<b><%=request.getParameter("event_category") %></b>
							</h3>
						</div>
					</div>
				</div>
				
				
		<div class="container py-5">
			<%
			while (it.hasNext()) {
				Dproduct s = it.next();
			%>
			<div class="row justify-content-center mb-3">
				<div class="col-md-12">
					<div class="card  " style="background-color: rgba(0, 0, 0, 0.7); border-color: #131f34;">
						<div class="card-body">
							<div class="row">
								<div class="col-md-4 card-backcolor">
									<img class="d-block rounded-3" src="<%=s.getP_image()%>" alt="">
								</div>
								<div class="col-6">
									<h4 style="color:#8b6508;"><%=s.getP_name()%></h4>
									
									<div class="mt-1 mb-0 text-muted small" style="color:white;">
										<span style="color:#8b6508;">
											• </span><span style="color:white;">Catering </span> <span style="color:#8b6508;"> •
										</span> <span style="color:white;">Photography</span> <span style="color:#8b6508;">
											• </span> <span style="color:white;">Aesthetics</span>
											<span style="color:#8b6508;">
											• </span> <span style="color:white;">live performances<br /></span>
									</div>
									
									<p class=" mb-4 mb-md-0 mt-3" style="color:white;">
										<%=s.getP_details()%>It encompasses venue selection, vendor coordination, budgeting, and guest experiences. With creative vision brings memorable experiences to life seamlessly.
									</p>
								</div>
								<div class=" col-2 left-border">
									
										<h4 class="mb-1 me-1 mt-3 ms-2" style="color:white;">&#8377 <%=s.getP_cost()%></h4>
										
										<%
										if (session.getAttribute("uname") != null) {
											if (session.getAttribute("id").equals("1")) {
										%>
											<a href="addDelEvent.jsp">
											<button class="custom-button" type="button"><b>Delete Event</b></button>
										</a>
										
										<%}else{ %>
										<a href="EventBooking.jsp?event_id=<%=s.getP_id()%>">
											<button class="custom-button" type="button"><b>Book Now</b></button>
										</a>
										<%
										}} else {
										%>
										<a href="login.jsp">
											<button class="custom-button" type="button"><b>Book Now</b></button>
										</a>
										<%
										}
										
										%>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>