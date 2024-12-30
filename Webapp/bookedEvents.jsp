<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Dproduct"%>
<%@page import="model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked Events</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.container-xl {
	max-width: 1500px;
	margin: auto;
	padding-left: 25px;
	padding-right: 25px;
	 background-color: rgba(0, 0, 0, 0); 
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

table.table tr th, table.table tr td {

	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}
table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}



table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	
}

table.table td a.delete {
	color: white;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.cost {
	float: right;
	font-size: 25px;
	
	padding-top: 20px;
	padding-right: 300px;
}

.btn btn-warning {
	margin-top: 17px
}
.custom-button {
     background-color: #8b6508; /* Background color */
    color: #131f34; /* Text color */
    border: 1px solid #ffffff; /* Border color */
    padding: 10px 210px;
  	
  	margin-left:0%;
    border-radius: 10px; /* Rounded corners */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s, border-color 0.3s; 
    width:100%;/* Smooth transition */
    border-color: green;
}

.custom-button:hover {
background-color: green;
    
    border-color: green;
     color: white;  /* Darker border color on hover */
}
.custom-button1 {
     background-color: #8b6508; /* Background color */
    color: #131f34; /* Text color */
    border: 1px solid #ffffff; /* Border color */
    padding: 10px 210px;
  	
  	margin-left:0%;
    border-radius: 10px; /* Rounded corners */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s, border-color 0.3s; 
    width:100%;/* Smooth transition */
    border-color: red;
}

.custom-button1:hover {
background-color: red;
    
    border-color: red;
     color: white;  /* Darker border color on hover */
}
</style>
</head>
<body 
	style="background-image: url('backgroun-login.jpeg'); font-style: inherit; background-attachment: fixed; ">
	<div class="header">
		<div class="container">
			<%@include file="header.jsp"%>
		</div>
	</div>
	<%
	if (session.getAttribute("uname") != null) {
	%>
	<div style="height: 120px;"></div>
	<div class="container-xl rounded-5">
	
				
				<div class="container-fluid ms-3 mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left: -23px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
						<div class="col-sm-4" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Manage <b>Events</b>
							</h3>
						</div>
					</div>
				</div>
				<table class="table  table-hover rounded-3" >
					<thead>
						<tr style="border-bottom: 5px #8b6508;">
							<th style="background-color: #131f34; color:#8b6508;">Image</th>
							<th style="background-color: #131f34; color:#8b6508;">Name</th>
							<th style="background-color: #131f34; color:#8b6508;">Cost</th>
							<th style="background-color: #131f34; color:#8b6508;">Email</th>
							<th style="background-color: #131f34; color:#8b6508;">Booked Date</th>
							<th style="background-color: #131f34; color:#8b6508;">Event date</th>
							<th style="background-color: #131f34; color:#8b6508;">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						Registration s1 = new Registration(session);
						s1.getOutSafeMode();	//sql safe mode off
						s1.setCurrentDateStatus();	//check for booked or completed event status wrt event booking date
						s1.deletePendingEvents();	//delte's the pending events wrt event booking date
						s1.getInSafeMode();		//sql safe mode off
						ArrayList<Dproduct> ar = s1.geteventstatusAdmin();
						Iterator<Dproduct> itr = ar.iterator();
						while (itr.hasNext()) {
							Dproduct s = itr.next();
						%>
						<tr style="border-bottom: 1px #8b6508; "><b>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><img src="<%=s.getP_image()%>" width="100px"
								height="100px"></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getP_name()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getP_cost()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getEmail()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getDate()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getEventdate()%></b></td>
							<%
							if (s.getStatus().equals("pending")) {
							%>
							<td style="color: blue; background-color: rgba(0, 0, 0, 0.7);">
								<form action="addtocart" method="post">
									<input type="hidden" name="event_id" value="<%=s.getP_id()%>" />
									<button type="submit" class="custom-button py-0 px-3 mb-2"
										name="acceptevent"><i class="bi bi-check"></i></button>
									<button type="submit" class="custom-button1 py-0 px-3"
										style="margin-top: 6px;" name="admincancelevent"><i class="bi bi-x "></i></button>
								</form>
							</td>
							<%
							} else if (s.getStatus().equals("booked") || s.getStatus().equals("Completed")) {
							%>
							<td style="color: green; background-color: rgba(0, 0, 0, 0.7);"><%=s.getStatus()%></td>
							<%
							} else if (s.getStatus().equals("cancelled")) {
							%>
							<td style="color: red; background-color: rgba(0, 0, 0, 0.7);"><%=s.getStatus()%></td>
							<%
							}
							%>
						</b></tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div><div style="height: 30px;"></div>
	</div>
	<%
	}
	%>
	
</body>
</html>