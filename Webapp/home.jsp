<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Elite Iris</title>
<style>
body{
	background-image:url("backgroun-login.jpeg");
	background-size: cover; /* Ensures the image covers the entire div */
    background-position: center;
    background-attachment: fixed;
}
#img-caption {
	background-image: rgba(0, 0, 0, 0.6);
	z-index: 1;
}

.card {
	animation: leftSlide linear;
	animation-timeline: view();
	animation-range: entry 0 cover 25%;
	
}

.cardr {
	animation: rightSlide linear;
	animation-timeline: view();
	animation-range: entry 0 cover 25%;
}

@keyframes leftSlide {
	from { 
		opacity:0.8;
		transform: translateX(300px)
	}

	to {
		opacity: 1;
		transform: translateX(0)
	}

}
@keyframes rightSlide {
from { 
	opacity: 0;
	transform: translateX(-300px);
}

to {
	
	opacity: 1;
	transform: translateX(0);
}

}
.card-block {
	font-size: 1em;
	position: relative;
	margin: 0;
	padding: 1em;
	border: none;
	border-top: 1px solid rgba(34, 36, 38, .1);
	box-shadow: none;
}

.card img {
	width: 100%;
	height: 100%;
}

.card {
	font-size: 1em;
	overflow: hidden;
	padding: 5;
	border: none;
	box-shadow: 0 1px 3px 0 #d4d border-radius: .28571429rem; 4 d5 , 0 0 0
	1px #d4d4d5;
	width: 85%;
	height: fixed;
	margin-top: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease, transform 0.3s ease;
	cursor: pointer;
}
.right-card{
margin-right: none;
}

.card:hover {
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
	transform: translateY(-5px);
}

.btn {
	margin-top: auto;
	bac:#131f34;
}

.card-head-color{
color:#8b6508;
 font-family: 'Flamenco', sans-serif;
}


.custom-button {
    background-color: #131f34; /* Background color */
    color: #8b6508; /* Text color */
    border: 2px solid #ffffff; /* Border color */
    padding: 10px 20px; /* Padding */
    border-radius: 10px; /* Rounded corners */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s, border-color 0.3s; 
    width:100%;/* Smooth transition */
}

.custom-button:hover {
    background-color: #8b6508; /* Darker background color on hover */
    border-color: #131f34;
    color: #131f34; /* Darker border color on hover */
}


</style>

</head>
<body>
	<section id="#home">
	<%@include file="header.jsp"%>
	
	
	<div id="demo" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
		
			<div class="carousel-item active">
				<img src="heade-img.jpg" class="d-block"
					style="width: 100%; height: 600px;">
				<div class="carousel-caption" id="img-caption">
					<h3>Crafting moments that matter</h3>
					<p>We specialize in creating memorable events that leave a lasting impact</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="heade-img-2.jpeg" class="d-block"
					style="width: 100%; height: 600px;">
				<div class="carousel-caption">
					<h3>Bringing Ideas to Life</h3>
					<p>We transform your event ideas into reality</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="carousel.jfif" class="d-block"
					style="width: 100%; height: 600px;">
				<div class="carousel-caption">
					<h3>Where Every Detail Matters</h3>
					<p>We prioritize even the smallest elements to ensure your event is flawless and unforgettable</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="carousel4.jfif" class="d-block"
					style="width: 100%; height: 600px;">
				<div class="carousel-caption">
					<h3>Elevating Your Experience</h3>
					<p>We enhance every aspect of your event to create a truly exceptional and memorable experience</p>
				</div>
			</div>
		</div>
		</section>
	<section id="Service">
		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	


	
	<!-- Card Start -->
	<section class="hiddenL">
		<div class="container-fluid">
			<div class="card float-start my-2 ">
				<div class="row ">
					<div class="col-md-5 card-backcolor">
						<img class="d-block" src="images/traditional wedding.jpg" alt="">
					</div>
					<div class="col-md-7 px-3 card-backcolor">
						<div class="card-block px-6 ">
						<h1 class="card-head-color">Wedding Events</h1>
							<p class="card-text color-card">Marriage is a timeless celebration of love and commitment, marking 
							the union of two individuals in a joyous and meaningful ceremony. At our event management company, 
							we specialize in creating unforgettable wedding experiences tailored to your vision. From intimate 
							gatherings to grand celebrations, we handle every detail with care, ensuring a seamless blend of 
							elegance and personal touch.</p>
							<br><a href="Events.jsp?event_category=Wedding Events">
							<button class="custom-button"><b>Book Wedding Events</b></button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		

	<section class="hiddenR">
		<div class="container-fluid">
			<div class="card  float-end float-box my-2 cardr">
				<div class="row ">
					<div class="col-md-7 px-3">
						<div class="card-block px-6">
						<h1 class="card-head-color">Corporate Events</h1>
							<p class="card-text">Host seamless and professional corporate events tailored to your 
							business needs. From conferences and product launches to team-building activities and 
							business meetings, we provide full-service planning and execution to make your corporate 
							event a success.</p>
							<br><a href="Events.jsp?event_category=Corporate Events"> <button class="custom-button"><b>Book Corporate Events</b></button></a>
						</div>
					</div>
					<div class="col-md-5">
						<img class="d-block" src="card3.jpeg" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="hiddenL">
		<div class="container-fluid">
			<div class="card float-start my-2">
				<div class="row ">
					<div class="col-md-5 card-backcolor">
						<img class="d-block" src="card2.jpeg" alt="">
					</div>
					<div class="col-md-7 px-3 card-backcolor">
						<div class="card-block px-6 ">
						<h1 class="card-head-color">Social Events</h1>
							<p class="card-text color-card">Create unforgettable moments with our expert event planning services. Whether it's a  birthday, anniversary, or family gathering, we tailor each event to reflect your unique style and vision, ensuring a seamless and memorable experience. </p>
							<br><a href="Events.jsp?event_category=Social Events">
							<button class="custom-button"><b>Book Social Events</b></button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		

	<section class="hiddenR">
		<div class="container-fluid">
			<div class="card  float-end float-box my-2 cardr">
				<div class="row ">
					<div class="col-md-7 px-3">
						<div class="card-block px-6">
						<h1 class="card-head-color">Entertainment Events</h1>
							<p class="card-text">Bring your event to life with unforgettable entertainment experiences. From live music and theater performances to award ceremonies and movie screenings, we offer tailored event management services that ensure every moment is full of excitement and fun. Let us handle the details while you enjoy the show!</p>
							<br><a href="Events.jsp?event_category=Entertainment Events"> <button class="custom-button" ><b>Book Entertainment Events</b></button></a>
						</div>
					</div>
					<div class="col-md-5">
						<img class="d-block" src="card6.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="hiddenL">
		<div class="container-fluid">
			<div class="card float-start my-2">
				<div class="row ">
					<div class="col-md-5 card-backcolor">
						<img class="d-block" src="carousel.jfif" alt="">
					</div>
					<div class="col-md-7 px-3 card-backcolor">
						<div class="card-block px-6 ">
						<h1 class="card-head-color">Sports & Fitness Events</h1>
							<p class="card-text color-card">Discover exciting sports and fitness events, from tournaments and marathons to yoga retreats and fitness challenges. Stay active and compete or join for fun in a variety of engaging activities designed for all skill levels.</p><br>
							<a href="Events.jsp?event_category=Sports Events"><button class="custom-button"><b>Book Sports & Fitness Events</b></button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		

	<section class="hiddenR">
		<div class="container-fluid">
			<div class="card  float-end float-box my-2 cardr">
				<div class="row ">
					<div class="col-md-7 px-3">
						<div class="card-block px-6">
						<h1 class="card-head-color">Virtual & Hybrid Events</h1>
							<p class="card-text">Engage audiences from anywhere with seamless virtual and hybrid event experiences. Whether it's a webinar, virtual conference, or live-streamed concert, bring your events to life with cutting-edge technology and interactive solutions.
							</p><br><a href="Events.jsp?event_category=Virtual Events"> <button class="custom-button"><b>Book Virtual & Hybrid Events</b></button></a>
						</div>
					</div>
					<div class="col-md-5">
						<img class="d-block" src="images/Hybrid Networking Events.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
		
		
	
	
	
	</section>






	








	
		<%@include file="footer.jsp"%>
	
</body>
</html>