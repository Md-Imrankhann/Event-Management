<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Registration"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response email</title>
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
	margin-top: 30px;
	margin-left: 260px;
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

h3 {
	color: #8b6508;
}
</style>
</head>
<body
	style="background-image: url('backgroun-login.jpeg'); font-style: inherit;">
	<%@include file="header.jsp"%>
	<div style="height: 120px;"></div>

	<%
	Registration en = new Registration(session);
	EnqList s = en.getEnquiryInfo(request.getParameter("enquiry_id"));
	%>

	<div class="container-fluid  mb-3 rounded-bottom-5"
		style="background-color: #8b6508; width: 1090px; height: 67px; margin-left: 100px; margin-top: -20px; font-style: inherit; color: white;">
		<div class="row">
			<div class="col-sm-4" style="color: #131f34;">
				<h3 style="padding-left: 20px; padding-top: 14px;">
					Enquiry <b>Email</b>
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
		<div class="row">
			<div class="col-12 pe-5 pb-3">
				<h3 class="h3 ms-5 mt-3" style="color: #8b6508;">
					<b>Name:</b><span style="color: #b29778;"> <%=s.getU_name()%></span>
				</h3>
				<h3 class="h3 ms-5 mt-3" style="color: #8b6508;">
					<b>Email:</b><span style="color: #b29778;"> <%=s.getU_email()%></span>
				</h3>
				<h4 class="h4 ms-5 mt-3" style="color: #8b6508;">
					<b>Enquiry:</b><span style="color: #b29778; width:100px;"><p> <%=s.getU_enq()%></p></span>
				</h4>
			</div>
		</div>
		<hr style="border-top: 3px solid #8b6508;" class="mb-1 mt-0">
		<div class="row">
			<div class="col-12">
				<div class="container pt-0 px-5 pb-4">
					<label for="exampleTextarea" class="form-label"><h3
							class="h3" style="color: #8b6508;">
							<b>Response Message</b>
						</h3></label>
					<textarea class="form-control" id="exampleTextarea" rows="4"
						placeholder="Enter Response Message to User"></textarea>
					<form action="register" method="post">
					<input type="hidden" name="event_id" value="<%=s.getE_id()%>" />	
						<button name="admincancelenquiry" class="custom-button mt-3">
							<b>Send Email</b>
						</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	<div style="height: 20px;"></div>

</body>
</html>