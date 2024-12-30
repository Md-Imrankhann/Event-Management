<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About us</title>
<style>
.row{
padding-top:100px;
}

body{
background-image:url("backgroun-login.jpeg");
background-size: cover; /* Ensures the image covers the entire div */
background-position: center;
padding-bottom:20px;
}


</style>
</head>
<body>
<%@include file="header.jsp"%><div style="height:100px;"></div>
<section class="py-5" >
	<div class="container" style="background-color: rgba(0, 0, 0, 0.7); border-radius: 10px; ">
		<div class="row " style="padding-left:20px; padding-right:20px;" >
			<div class="col-md-5">
				<h2 class="display-5 fw-bold" style="color:#8b6508;">About Us</h2>
				<p class="lead" style="color:white;">Welcome to Elite Iris, where we make event planning effortless and extraordinary. Our mission is to empower organizers, from seasoned professionals to first-time planners, with cutting-edge tools and a seamless experience for managing events of any size.</p>
				<h2 style="color:#8b6508;padding-top:40px;" >Meet the Team</h2>
				<p class="lead" style="color:white;">Our team is a blend of tech enthusiasts and event experts, all committed to delivering a top-notch experience for our users. [Sonika S.G], our Chief Product Officer, ensures that our app stays ahead of the curve with innovative features. [Ragavendhra], our Customer Success Manager, is dedicated to providing outstanding support and guidance to our users.</p>
			</div>
			<div class="col-md-6 offset-md-1" style="color:black;">
			    <h2 style="color:#8b6508;">Our Story</h2>
				<p class="lead" style="color:white;">Founded in 2024, Elite Iris emerged from a passion for transforming the event management process. Our team, with diverse backgrounds in technology, event planning, and customer service, came together to create an intuitive platform that addresses the complexities and challenges of organizing events.</p>
				<h2 style="color:#8b6508;">Our Vision</h2>
				<p class="lead" style="color:white;">We envision a world where event planning is straightforward, enjoyable, and accessible. By continuously innovating and listening to our users, we strive to stay ahead of industry trends and provide a solution that evolves with your needs.</p>
				<h2 style="color:#8b6508;">What Sets Us Apart</h2>
				<p class="lead" style="color:white;"><b>Real-Time Collaboration:</b> Work with your team or vendors effortlessly with our collaboration tools.</p>
				<p class="lead" style="color:white;"><b>Smart Budgeting Tools:</b>Keep track of expenses and manage your budget with ease.</p>
				<p class="lead" style="color:white;"><b>Seamless Integration:</b> Connect with popular tools and services to streamline your planning process.</p>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>
</body>
</html>