
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style type="text/css">
nav {
	background-color: #131f34;
}

#header-hover {
	font-size: 20px;
	font-family: 'Georgia', serif;
	color: #8b6508;
}

#header-hover.shrink {
	height: 50px; /* Reduced height */
}

#header-hover:hover {
	color: #b29778; /* Darker shade of blue */
}

.uname {
	margin-top: 14px;
	color: #8b6508;
	margin-right: 10px;
}

.offcanvas {
	
}

.offcanvas-dark {
	background-color: #131f34; /* Dark Blue Color */
	color: #8b6508;
	width: 100px;
}

.offcanvas-dark .btn-close {
	filter: invert(1);
}

.offcanvas-header {
	
}

.user-logo {
	width: 40px;
	height: 40px;
	margin-right: 0;
	padding-right: 0;
}

#offcanvas-effect-1 {
	text-decoration: none;
	color: #8b6508;
}

#button {
	text-decoration: none;
	color: #8b6508;
}

#offcanvas-effect-1:hover {
	color: #b29778;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg fixed-top"
			style="background-color: #131f34;">
			<div class="container-fluid justify-content">

				<a class="navbar-brand " href="home.jsp"> <img src="logo1.jpeg"
					alt="Avatar Logo" style="width: 160px; height: 80px;"
					class="m-0 ps-1 float-start">
					<ul class="navbar-nav pt-0 mt-0"></a>
				<li class="nav-item pt-2 px-2"><a class="nav-link"
					href="home.jsp" id="header-hover">Home</a></li>
				<li class="nav-item pt-2 px-3"><a class="nav-link"
					href="AboutUs2.jsp" id="header-hover">About Us</a></li>
				<li class="nav-item pt-2 px-3"><a class="nav-link"
					href="#Service" id="header-hover">Service</a></li>
				
				<li class="nav-item pt-2 px-3"><a class="nav-link"
					href="#footer" id="header-hover">Contact</a></li>
				

				<%
				if (session.getAttribute("uname") != null) {
				%>
					<%
					if (session.getAttribute("id").equals("1")) {
					%>

				
				<li class="nav-item pt-2 px-3"><a
					class="nav-link" id="header-hover"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasUser"
					aria-controls="offcanvasUser"><i class="bi bi-person-circle"></i> <%=session.getAttribute("uname")%></a></li>
					<%
				} else {
				%>
						<li class="nav-item pt-2 px-3"><a class="nav-link"
					href="Enquiry_user.jsp" id="header-hover">Enquiry</a></li>
				<li class="nav-item pt-2 px-3"><a
					class="nav-link" id="header-hover"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasUser"
					aria-controls="offcanvasUser"><i class="bi bi-person-circle"></i> <%=session.getAttribute("uname")%></a></li>
				
				
				<%
				}
				%>


				<%
				} else {
				%>
				<li class="nav-item pt-2 px-3"><a class="nav-link"
					href="Enquiry_user.jsp" id="header-hover">Enquiry</a></li>
				<li class="nav-item pt-2 px-3"><a class="nav-link"
					href="login.jsp" id="header-hover">Login</a></li>
				<%
				}
				%>



				</ul>
			</div>
		</nav>
	</header>
	<div class="offcanvas offcanvas-end offcanvas-dark" tabindex="-1"
		id="offcanvasUser" aria-labelledby="offcanvasUserLabel" style="width:300px; background-color:#131f34; ">>
		<div class="offcanvas-header">
			
			<h3 class="offcanvas-title" id="offcanvasUserLabel" style="color:#8b6508;"><i class="bi bi-person-circle"></i> <%=session.getAttribute("uname")%></h3>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<ul class="list-group" style="list-style-type:none;">
				
				<%
				if (session.getAttribute("uname") != null) {
				%>
					<%
					if (session.getAttribute("id").equals("1")) {
					%>
					<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="EditForm.jsp" id="header-hover"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
					
					<%}
					else
					{%>
				<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="EventStatus.jsp" id="header-hover"><i class="bi bi-calendar-check"></i>  My Bookings</a></li>
				<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="EditForm.jsp" id="header-hover"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
					<%}%>
				<%
				if (session.getAttribute("id").equals("1")) {
				%>
				<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="addDelEvent.jsp" id="header-hover"><i class="bi bi-pencil-square"></i> Add/Delete Event</a></li>
					
				<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="bookedEvents.jsp" id="header-hover"><i class="bi bi-calendar-check"></i> User Bookings</a></li> 
					
				
					
					
					
					
					
				
					
					<li class="nav-item pt-3 px-3"><a class="nav-link"
					 href="Enquiry_admin.jsp" id="header-hover"><i class="fas fa-question-circle"></i> User Enquiry</a></li>
					 
				<li class="nav-item pt-3 px-3"><a class="nav-link"
				 href="viewReview.jsp" id="header-hover"><i class="bi bi-calendar-check"></i> User Feedback</a></li>
				 
				 <li class="nav-item pt-3 px-3"><a class="nav-link"
					href="DeleteUser.jsp" id="header-hover"><i class="bi bi-trash"></i> Delete User</a></li>
					
				<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="search.jsp" id="header-hover"> <i class="bi bi-search"></i> Search User</a></li>
					
					
					
				<%
				}
				%>


				<%
				}
				%>
				<li class="nav-item pt-3 px-3"><a class="nav-link"
					href="register?logout=yes" id="header-hover"><i class="bi bi-box-arrow-right"></i> Logout</a></li>


				
			</ul>
		</div>
	</div>
</body>
</html>