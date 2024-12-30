<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.EnqList"%>
<%@page import="model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enquiry</title>
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
								Customer <b>Enquiry's</b>
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
							<th style="background-color: #131f34; color:#8b6508;">Enquiry</th>
							<th style="background-color: #131f34; color:#8b6508;">Date</th>
							<th style="background-color: #131f34; color:#8b6508;">Response</th>
						</tr>
					</thead>
					<tbody>
						<%
						Registration s1 = new Registration(session);
						ArrayList<EnqList> ar = s1.getEnquiryList();
						Iterator<EnqList> itr = ar.iterator();
						while (itr.hasNext()) {
							EnqList s = itr.next();
						%>
						<tr style="border-bottom: 1px #8b6508; ">
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getE_id()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getU_name()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getU_email()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getU_enq()%></b></td>
							<td style="background-color: rgba(0, 0, 0, 0.7); color:#8b6508;"><b><%=s.getDate()%></b></td>
								<td style="color: blue; background-color: rgba(0, 0, 0, 0.7);">
								
									<a href="Response_Email.jsp?enquiry_id=<%=s.getE_id()%>"><button type="submit" class="custom-button py-0 px-3"
										><b>Send email</b></button></a>
									<form action="register" method="post">
									<input type="hidden" name="event_id" value="<%=s.getE_id()%>" />	
									<button type="submit" class="custom-button1 py-0 px-4"
										style="margin-top: 6px;" name="admincancelenquiry"><b>Cancel</b></button>
								</form>
							</td>
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