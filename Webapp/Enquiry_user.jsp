<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ENQUIRY</title>
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
.Container-fluid {
	width: 60%;
	height: auto;
	background-color: rgba(0, 0, 0, 0.7);
	margin-top: 50px;
	margin-left: 240px;
	border-radius: 10px;
}

.custom-button {
	background-color: #8b6508; /* Background color */
	color: #131f34; /* Text color */
	border: 2px solid #8b6508; /* Border color */
	padding: 10px 20px; /* Padding */
	border-radius: 10px; /* Rounded corners */
	font-size: 16px; /* Font size */
	cursor: pointer; /* Pointer cursor on hover */
	transition: background-color 0.3s, border-color 0.3s;
	width: 50%; /* Smooth transition */
	margin-left: 25%;
}

.custom-button:hover {
	background-color: #131f34; /* Darker background color on hover */
	border-color: #8b6508;
	color: #8b6508;
	border: 2px solid #131f34;
}
</style>
</head>
<body style="background-image: url('backgroun-login.jpeg');">
	<%@include file="header.jsp"%>
	<div style="height: 120px;"></div>
	<div class="container-fluid  mb-3 rounded-bottom-5"
		style="background-color: #8b6508; width: 1090px; height: 67px; margin-left: 100px; margin-top: -20px; font-style: inherit; color: white;">
		<div class="row">
			<div class="col-sm-4" style="color: #131f34;">
				<h3 style="padding-left: 20px; padding-top: 14px;">
					Enquiry <b>Form</b>
				</h3>
			</div>
			<div class="col-sm-1" style="color: #131f34;"></div>
			<div class="col-sm-7" style="color: #131f34;">
				<h3 style="padding-left: 20px; padding-top: 14px;">
					<%
					if (request.getAttribute("status") != null) {
					%>

					<%=request.getAttribute("status")%>
					<%
					}
					%>
				</h3>
			</div>
		</div>
	</div>


	<div class="Container-fluid">
		<form method="POST" id="enquiry" action="register">
			<div class="row">
				<div class="col-6">
					<div class="Container mt-3 ms-3">


						<div class="mb-3">
							<label for="username" class="form-label mb-0 ms-1"
								style="color: #8b6508;"><h5>
									<b>Name</b>
								</h5></label> <input type="text" class="form-control rounded-5" id="username"
								placeholder="Enter your name" style="width: 90%;" name="uname"
								<%if (session.getAttribute("uname") != null) {%>
								value="<%=session.getAttribute("uname")%>" <%}%>>
						</div>

						<div class="mb-3">
							<label for="email" class="form-label mb-0 ms-1 mt-1"
								style="color: #8b6508;"><h5>
									<b>Email</b>
								</h5></label> <input type="email" class="form-control rounded-5" id="email"
								placeholder="Enter your email" style="width: 90%;" name="email"
								<%if (session.getAttribute("uname") != null) {%>
								value="<%=session.getAttribute("email")%>" <%}%>>
						</div>



					</div>
				</div>
				<div class="col-6">
					<div class="Container mt-3 me-3">
						<div class="mb-3">
							<label for="exampleTextarea" class="form-label mb-0 ms-1 "
								style="color: #8b6508;"><h5>
									<b>Enquiry</b>
								</h5></label>
							<textarea class="form-control" id="exampleTextarea" rows="4"
								placeholder="Enter Enquiry" name="enquiry"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<button type="submit" class="custom-button mb-4 mt-3"
						name="enquiry">
						<b>Submit</b>
					</button>
				</div>
			</div>
		</form>
	</div>




























</body>