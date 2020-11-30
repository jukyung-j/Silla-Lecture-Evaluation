<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>신라대 강의평가</title>
<!-- Favicon-->
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<span class="navbar-brand js-scroll-trigger">신라대 강의평가	</span>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><span style="color: white"> ${nick}님
					<a href="${pageContext.request.contextPath}/lecture-evaluation/index?action=logout">로그아웃</a></span></li>
				</ul>
			</div>
		</div>
	</nav>
	<section class="page-section" id="contact" style="margin-top:4rem">
		<div class="container">
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">강의 등록</h2>
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
					<form id="contactForm" name="sentMessage" novalidate="novalidate"
						action='${pageContext.request.contextPath}/lecture-evaluation/main?action=register'
						method="POST">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>강의명</label> <input class="form-control" 
									name="lec_name" type="text" placeholder="강의명" required="required" />
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>교수명</label> <input class="form-control" 
									name="p_name" type="text" placeholder="교수 명"
									required="required"/>
							</div>
						</div>
						<div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>강의 해당 학과</label>
                                    <input class="form_control" placeholder="강의 해당 학과" readonly>
                                    &nbsp;&nbsp;<%pageContext.include("dept.jsp"); %>
                                </div>
                            </div>
						<br><br>
						<div class="loginbtn">
							<button class="btn btn-primary btn-xl" id="sendMessageButton"
								type="submit">강의 등록</button>
						</div>
					

					</form>
				</div>
			</div>
		</div>
	</section>
	
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright © 201795025 김유진, 201795081정주경</small>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>