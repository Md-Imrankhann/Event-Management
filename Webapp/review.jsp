<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Registration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

.ip{
	width:50%;
}
.custom-button {
     background-color: #8b6508; /* Background color */
    color: #131f34; /* Text color */
    border: 2px solid #ffffff; /* Border color */
    padding: 10px 210px;
  	
  	margin-left:21%;
    border-radius: 10px; /* Rounded corners */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s, border-color 0.3s; 
    width:100%;/* Smooth transition */
    border-color: #8b6508;
}

.custom-button:hover {
background-color: #131f34;
    
    border-color: #131f34;
     color: #8b6508;  /* Darker border color on hover */
}
</style>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel='stylesheet' id='font-awesome-5-all-css'
	href='https://eventsstudio.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/all.min.css?ver=3.18.3'
	type='text/css' media='all' />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<link rel="stylesheet" href="review.css">

</head>
<body 
	style="background-image: url('backgroun-login.jpeg'); font-style: inherit; ">
	<%@ include file="header.jsp"%>
	<div style="height: 120px;"></div>
		<div class="wrapper">
			
			<div class="container-fluid  mb-3 rounded-bottom-5"
					style="background-color: #8b6508;  width: 1090px; height: 67px; margin-left: 100px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
						<div class="col-sm-4" style="color:#131f34;">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Rate Your  <b>Experience</b>
							</h3>
						</div>
						<div class="col-sm-3" style="color:#131f34;">
							
						</div>
						<div class="col-sm-5" style="color:#131f34;">
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
			</div>
			
			
			<div class="container rounded-3" style="background-color: rgba(0, 0, 0, 0.6); width:700px; height:auto;">
		<form method="POST" id="review" action="register">
				<div class="rating text-center">
					<input type="text" name="rating" hidden> <i
						class='bx bx-star star my-4' style="--i: 1; color:#8b6508; font-size: 50px;"></i> <i
						class='bx bx-star star' style="--i: 2; color:#8b6508; font-size: 50px;" ></i> <i
						class='bx bx-star star' style="--i: 3; color:#8b6508; font-size: 50px;"></i> <i
						class='bx bx-star star' style="--i: 4; color:#8b6508; font-size: 50px;"></i> <i
						class='bx bx-star star' style="--i: 5; color:#8b6508; font-size: 50px;"></i>
				</div>
				<div>
					<label class="form-label mb-0" style=" margin-left: 17%;color:#8b6508;"><h5><b>Username</b></h5></label>
					<input type="text" class="form-control ip rounded-5" name="name" placeholder="Username"
						value="<%=session.getAttribute("uname")%>" style="background-color: #f5f5f5; width:70%; margin-left: 15%;"></br> 
						
						
						<label class="form-label mb-0 mt-0" style=" margin-left: 17%;color:#8b6508;"><h5><b>Email</b></h5></label>
						<input
						type="email" class="form-control ip rounded-5" name="email" placeholder="Email"
						value="<%=session.getAttribute("email")%>" style="background-color: #f5f5f5; width:70%; margin-left: 15%;">
				</div>
				</br>
				<label class="form-label mb-0 mt-0" style=" margin-left: 17%;color:#8b6508;"><h5><b>Your Opinion</b></h5></label>
				<textarea type="text" name="opinion" cols="30" rows="5"
					placeholder="Your opinion..." class="form-control mb-0"
					style="height: 180px; background-color: #f5f5f5; border: none; width:70%; margin-left: 15%;"></textarea>
				
				
				<div class="btn-group">
					<button type="submit" class="custom-button mt-4 mb-4" name="review"><b>Submit</b></button>
				</div>
			</form>
		
		
		
		
		
		
		</div>
			
		<div style="height: 20px;"></div>
	
	
	<script>
	const allStar = document.querySelectorAll('.rating .star')
	const ratingValue = document.querySelector('.rating input')

	allStar.forEach((item, idx)=> {
		item.addEventListener('click', function () {
			let click = 0
			ratingValue.value = idx + 1

			allStar.forEach(i=> {
				i.classList.replace('bxs-star', 'bx-star')
				i.classList.remove('active')
			})
			for(let i=0; i<allStar.length; i++) {
				if(i <= idx) {
					allStar[i].classList.replace('bx-star', 'bxs-star')
					allStar[i].classList.add('active')
				} else {
					allStar[i].style.setProperty('--i', click)
					click++
				}
			}
		})
	})
	</script>
	
</body>
</html>