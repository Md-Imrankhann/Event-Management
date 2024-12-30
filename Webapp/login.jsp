<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Signup</title>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <script>
        jQuery.validator.addMethod("checkemail", function(value, element) {
            return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
        }, "Please enter a valid email or phone number");

        jQuery(document).ready(function($) {
            $("#signup").validate({
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        checkemail: true
                    },
                    phone: {
                        required: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    pw: {
                        required: true,
                        minlength: 6
                    },
                    cp: {
                        required: true,
                        minlength: 6,
                        equalTo: "#pw"
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name."
                    },
                    email: {
                        required: "Please enter your email.",
                        checkemail: "Please enter a valid email address or 10-digit phone number."
                    },
                    phone: {
                        required: "Please enter your phone number.",
                        minlength: "Phone number must be exactly 10 digits.",
                        maxlength: "Phone number must be exactly 10 digits."
                    },
                    pw: {
                        required: "Please enter your password.",
                        minlength: "Password must be at least 6 characters long."
                    },
                    cp: {
                        required: "Please confirm your password.",
                        minlength: "Password must be at least 6 characters long.",
                        equalTo: "Passwords do not match."
                    }
                }
            });

            $("#login").validate({
                rules: {
                    email: {
                        required: true,
                        checkemail: true
                    },
                    pw: {
                        required: true,
                        minlength: 6
                    },
                },
                messages: {
                    email: {
                        required: "Please enter your email or phone number.",
                    },
                    pw: {
                        required: "Please enter your password.",
                        minlength: "Password must be at least 6 characters long.",
                    },
                }
            });
        });
    </script>
    <style>
       @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900');

body{
    font-family: 'Poppins', sans-serif;
    font-weight: 300;
    font-size: 15px;
    line-height: 1.7;
    color: #c4c3ca;
    background-image: url("backgroun-login.jpeg");
    background-size: cover;
    background-position: center;
    overflow-x: hidden;
    background-color: rgba(0,0,0,0.5);
    background-blend-mode: overlay;
    
}
.error {
            color: red;
        }

a {
    cursor: pointer;
    transition: all 200ms linear;
}
a:hover {
    text-decoration: none;
}
.link {
    color: #c4c3ca;
}
.link:hover {
    color: #ffeba7;
}
p {
    font-weight: 500;
    font-size: 14px;
    line-height: 1.7;
}
h4 {
    font-weight: 600;
}
h6 span{
    padding: 0 20px;
    text-transform: uppercase;
    font-weight: 700;
    margin-top: 0px;
}
.section{
    position: relative;
    width: 100%;
    display: block;
}
.full-height{
    min-height: 100vh;
}
[type="checkbox"]:checked,
[type="checkbox"]:not(:checked){
    position: absolute;
    left: -9999px;
}
.checkbox:checked + label,
.checkbox:not(:checked) + label{
    position: relative;
    display: block;
    text-align: center;
    width: 60px;
    height: 16px;
    border-radius: 8px;
    padding: 0;
    margin: 10px auto;
    margin-bottom:15px;
    margin-top:0px;
    cursor: pointer;
    background-color: #ffeba7;
}
.checkbox:checked + label:before,
.checkbox:not(:checked) + label:before{
    position: absolute;
    display: block;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    color: #ffeba7;
    background-color: #102770;
    font-family: 'unicons';
    content: '\eb4f';
    z-index: 20;
    top: -10px;
    left: -10px;
    line-height: 36px;
    text-align: center;
    font-size: 24px;
    transition: all 0.5s ease;
}
.checkbox:checked + label:before {
    transform: translateX(44px) rotate(-270deg);
}

.card-3d-wrap {
    position: relative;
    width: 440px;
    max-width: 100%;
    height: 450px;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    perspective: 800px;
    margin-top: 0px;
}
.card-3d-wrapper {
    width: 100%;
    height: 100%;
    position:absolute;    
    top: 0;
    left: 0;  
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    transition: all 600ms ease-out; 
}
.card-front, .card-back {
    width: 100%;
    height: 100%;
    background-color: #2a2b38;
    background-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat.svg');
    background-position: bottom center;
    background-repeat: no-repeat;
    background-size: 300%;
    position: absolute;
    border-radius: 6px;
    left: 0;
    top: 0;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    backface-visibility: hidden;
}
.card-back {
    transform: rotateY(180deg);
}
.checkbox:checked ~ .card-3d-wrap .card-3d-wrapper {
    transform: rotateY(180deg);
}
.center-wrap{
    position: absolute;
    width: 100%;
    padding: 0 35px;
    top: 50%;
    left: 0;
    transform: translate3d(0, -50%, 35px) perspective(100px);
    z-index: 20;
    display: block;
}

.form-group{ 
    position: relative;
    display: block;
    margin: 0;
    padding: 0;
}
.form-style {
    padding: 13px 20px;
    padding-left: 55px;
    height: 48px;
    width: 100%;
    font-weight: 500;
    border-radius: 4px;
    font-size: 14px;
    line-height: 22px;
    letter-spacing: 0.5px;
    outline: none;
    color: #c4c3ca;
    background-color: #1f2029;
    border: none;
    -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
    box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}
.form-style:focus,
.form-style:active {
    border: none;
    outline: none;
    box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}
.input-icon {
    position: absolute;
    top: 0;
    left: 18px;
    height: 48px;
    font-size: 24px;
    line-height: 48px;
    text-align: left;
    color: #ffeba7;
    -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}

.form-group input:-ms-input-placeholder  {
    color: #c4c3ca;
    opacity: 0.7;
    -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input::-moz-placeholder  {
    color: #c4c3ca;
    opacity: 0.7;
    -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input:-moz-placeholder  {
    color: #c4c3ca;
    opacity: 0.7;
    -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input::-webkit-input-placeholder  {
    color: #c4c3ca;
    opacity: 0.7;
    -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}

.btn {
    border-radius: 4px;
    height: 44px;
    font-size: 13px;
    font-weight: 600;
    text-transform: uppercase;
    -webkit-transition : all 200ms linear;
    transition: all 200ms linear;
    padding: 0 30px;
    letter-spacing: 1px;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    align-items: center;
    background-color: #ffeba7;
    color: #102770;
    box-shadow: 0 8px 24px 0 rgba(255,235,167,.2);
}
.btn:hover {
    background-color: #102770;
    color: #ffeba7;
    box-shadow: 0 8px 24px 0 rgba(16,39,112,.2);
}
.logo {
	position: absolute;
	
	display: block;
	z-index: 100;
	transition: all 250ms linear;
}
.logo img {
	height: 75px;
	width: auto;
	display: block;
	margin-left: 2px;
} 
    </style>
</head>
<body>
<div class="container-fluid  mb-0 rounded-bottom-5"
		style="background-color: #131f34; width: 1000px; height: 105px; margin-left: 120px; margin-top: -20px;margin-bottom:0px; font-style: inherit; color: white; margin-bottom: -10px;">
		<div class="row">
			<div class="col-sm-4 mt-4" style="color: #131f34;">
			<a href="home.jsp" class="logo rounded-bottom-5 ms-2" target="_self"> <img
					class="rounded-left-bottom-1" src="logo1.jpeg" alt="">
				</a>
				
			</div>
			<div class="col-sm-6 mt-4 ms-5" style="color: #8b6508;">
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
			<div class="col-sm-2 mt-5 ms-4" style="color: #8b6508;"></div>
		</div>
	</div>
	

    <section class="section full-height">
        <div class="container">
            <div class="row full-height justify-content-center">
                <div class="col-12 text-center align-self-center py-5">
                    <div class="section pb-5 pt-0 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3 mt-0"><span>Log In </span><span class="mb-0 pb-0">Sign Up</span></h6>
                        <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                        <label for="reg-log"></label>
                        <div class="card-3d-wrap mx-auto">
                            <div class="card-3d-wrapper">
                                <div class="card-front">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">Log In</h4>
                                             
                                            <form id="login" action="register" method="post">
                                                <div class="form-group">
                                                    <input type="text" name="email" class="form-style" placeholder="Your Email" id="logemail">
                                                    <i class="input-icon fa fa-user"></i>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <input type="password" name="pw" class="form-style" placeholder="Your Pin" id="logpass">
                                                    <i class="input-icon fa fa-lock"></i>
                                                </div>
                                          
                                                <button type="submit" class="btn mt-4" name="login">Submit</button>
                                            </form>
                                            <p class="mb-0 mt-4 text-center"><a href="forgot.jsp" class="link">Forgot your password?/Reset pin</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">Sign Up</h4>
                                            <form id="signup" action="register" method="post">
                                                <div class="form-group">
                                                    <input type="text" name="name" class="form-style" placeholder="Your Full Name" id="name">
                                                    <i class="input-icon fa fa-user"></i>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <input type="text" name="email" class="form-style" placeholder="Your Email" id="signupemail">
                                                    <i class="input-icon fa fa-envelope"></i>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <input type="text" name="phone" class="form-style" placeholder="Your Phone Number" id="signupphone">
                                                    <i class="input-icon fa fa-phone"></i>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <input type="password" name="pw" class="form-style" placeholder="Your Pin" id="pw">
                                                    <i class="input-icon fa fa-lock"></i>
                                                </div>
                                                <div class="form-group mt-2">
                                                    <input type="password" name="cp" class="form-style" placeholder="Confirm Pin" id="cp">
                                                    <i class="input-icon fa fa-lock"></i>
                                                </div>
                                                <input type="submit" name="register" value="Submit" class="btn mt-4" onclick="showAlert()">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
   
    
   
</body>
</html>
