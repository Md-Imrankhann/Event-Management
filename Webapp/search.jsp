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
<title>Search User</title>
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

.Container{
    width:70%;
    margin-left: 50px;
}
#bggold{
    background-color: #8b6508;
}
#gold{
    color: #8b6508;
}

.btn-custom {
    border-radius: 4px;
    height: 44px;
    font-size: 13px;
    font-weight: 600;
    text-transform: uppercase;
    transition: all 200ms linear;
    margin-top:10px;
    padding: 10px 30px;
    letter-spacing: 1px;
    display: inline-flex;
    align-items: center;
    background-color: #ffeba7; /* Light yellow background */
    color: #102770; /* Dark text color */
    border: none; /* Remove border */
    box-shadow: 0 4px 8px rgba(255, 235, 167, 0.8); /* Adjusted box-shadow opacity */
}

.btn-custom:hover {
    background-color: #102770; /* Dark blue background on hover */
    color: #ffeba7; /* Light text color on hover */
    box-shadow: 0 8px 24px rgba(16, 39, 112, 0.8); /* Adjusted box-shadow opacity */
}

</style>
</head>
<body style="background-image: url('backgroun-login.jpeg');">
    <%@include file="header.jsp"%>
    <div style="height: 120px;"></div><center>
    <div class="container-fluid  mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left:100px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
						<div class="col-sm-4" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Search <b>User</b>
							</h3>
						</div>
						<div class="col-sm-4" style="color:#131f34;">
							
							
						</div>
						<div class="col-sm-4" style="color:#131f34;">
							
							
						</div>
					</div>
				</div>
   </center>
    <center> <div class="Container">
        
            
            <% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {%>
            <form action="search" method="POST">
                <input class="form-control" id="search" name="id" type="text" placeholder="Search.." style="width:70%;">
                <div><button type="submit" class="btn-custom" name="submit">Search</button></div>
            </form>
            <% if (request.getParameter("id") != null) {%>
            <table class="table table-striped table-hover mt-3">
                <thead>
                    <tr>
                        <th style="color:#8b6508; background-color: #131f34;">Id no</th>
                           <th style="color:#8b6508;background-color: #131f34;">Name</th>
                           <th style="color:#8b6508;background-color: #131f34;">Email</th>
                           <th style="color:#8b6508;background-color: #131f34;">Phone</th>
                           <th style="color:#8b6508;background-color: #131f34;">Date</th>
                           
                    </tr>
                </thead>
                <tbody id="table">
                <% 
                Registration reg = new Registration(session);
                ArrayList<User> mydata = reg.getUserInfo(request.getParameter("id"));
                Iterator<User> itr = mydata.iterator();
                while (itr.hasNext()) {
                    User s = itr.next();
                %>
                <tr>
                    <td><%=s.getId()%></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.getEmail()%></td>
                    <td><%=s.getPhoneNumber()%></td>
                    <td><%=s.getDate()%></td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <% } %>
        <% } %>
        </div></center>
    
  
</body>
</html>
