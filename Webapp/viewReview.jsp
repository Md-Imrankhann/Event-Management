<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Ratings"%>
<%@page import="model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review</title>
<style type="text/css">
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
	width: 150px;
}
table.table tr th:fifth-child {
	width: 10px;
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
</style>
</head>
<body 
	style="background-image: url('backgroun-login.jpeg'); font-style: inherit; ">
	<div class="header">
		<div class="container">
			<%@include file="header.jsp"%>
		</div>
	</div>
	<%
	if (session.getAttribute("uname") != null) {
	%>
	<div style="height: 120px;"></div>
	<div class="container-xl rounded-3">
	
				
				<div class="container-fluid ms-3 mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left: -23px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
						<div class="col-sm-4" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Customer <b>Feedback</b>
							</h3>
						</div>
					</div>
				</div>
				
				
				<table class="table table-hover">
					<thead>
						<tr style="border-bottom: 1px #8b6508;">
							<th style="background-color: #131f34; color:#8b6508;">ID</th>
							<th style="background-color: #131f34; color:#8b6508;">Name</th>
							<th style="background-color: #131f34; color:#8b6508;">Email</th>
							<th style="background-color: #131f34; color:#8b6508;">Ratings out of 5</th>
							<th style="background-color: #131f34; color:#8b6508;">Message</th>
							<th style="background-color: #131f34; color:#8b6508;">Date</th>
						</tr>
					</thead>
					<tbody>
						<%
						Registration s1 = new Registration(session);
						ArrayList<Ratings> ar = s1.getFeedbackList();
						Iterator<Ratings> itr = ar.iterator();
						while (itr.hasNext()) {
							Ratings s = itr.next();
						%>
						<tr style="border-bottom: 1px #8b6508; ">
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getRid()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getUname()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getEmail()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getRating()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getMessage()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getDate()%></b></td>
						</tr>
						</tr>
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%}%>
	
</body>
</html>