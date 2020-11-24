<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD:WebContent/view/join_form.jsp
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
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<span class="navbar-brand js-scroll-trigger">신라대 강의평가</span>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center"> </header>
	<!-- Portfolio Section-->

	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
					<form id="contactForm" name="sentMessage" novalidate="novalidate"
						action='${pageContext.request.contextPath}/lecture-evaluation?action=join'
						method="POST">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>NAME</label> <input class="form-control" id="name"
									name="name" type="text" placeholder="NAME" required />
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>DEPARTMENT</label> <input class="form_control"
									value="DEPARTMENT" readonly> &nbsp;&nbsp;
								<c:import url="http://localhost:8080/sillauv/view/dept.jsp" />
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>ID</label> <input class="form-control" id="user_id"
									name="user_id" type="text" placeholder="ID" required /> <span
									id="id_check"></span>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>PASSWORD</label> <input class="form-control" id="user_pw"
									name="pwd" type="password" placeholder="PASSWORD" required />
								<p class="help-block text-danger"></p>
								<span id="pw_check"></span>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>PASSWORD CHECK</label> <input class="form-control"
									id="user_pw2" type="password" placeholder="PASSWORD CHECK"
									required />
								<p class="help-block text-danger"></p>
								<span id="pw2_check"></span>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>NICKNAME</label> <input class="form-control"
									id="user_nick" name="nickname" type="text"
									placeholder="NICKNAME" required />
								<p class="help-block text-danger"></p>
								<span id="nick_check"></span>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Email Address</label> <input class="form-control"
									id="user_email" name="email" type="email"
									value="@sillain.ac.kr" placeholder="Email Address" required />
								&nbsp;&nbsp;<a href="http://outlook.com/sillain.ac.kr"
									target="_blank">이메일 접속</a>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<input type="button" value="이메일 인증" id="check_mail" /> <input
							type="text" class="emailbox" placeholder="인증번호 입력" name="verifi"
							id="e_code" /> <input type="button" class="emailbtn" value="확인"
							id="code_btn"><br> <span class="textbox"
							id="code_check"></span> <br />
						<div class="form-group">
							<button class="btn btn-primary btn-xl" id="reg_submit"
								type="submit">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright © 201795025김유진, 201795081 정주경</small>
		</div>
	</div>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->

	<!-- Bootstrap core JS-->
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/JoinScript.js"> </script>
</body>
</html>
=======
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>신라대학교 강의 평가</title>

<style>
header {
	position: static;
	top: 0;
	left: 0;
	right: 0;
	height: 5%;
	padding: 1rem;
	color: white;
	background: MediumSeaGreen;
	font-weight: bold;
	font-size: 25px;
}

h1 {
	text-align: center;
}

body {
	background-color: #EAEAEA;
	background-clip: content-box;
}

.icon {
	float: left;
	margin-top: 15%;
	margin-left: 15%;
	clear: both;
	margin-right: 1%;
	background: none;
}

.join {
	background: none;
	width: 600px;
	height: 700px;
	padding-top: 1%;
	border-radius: 5px;
	margin-left: 30%;
	margin-top: 3%;
}

.table {
	border-collapse: separate;
	border-spacing: 0 15px;
	margin-left: 40px;
	font-size: 20px;
}

.textbox {
	width: 300px;
	height: 30px;
	margin-left: 5%;
}

div {
	padding: 100px 500px;
	line-height: 30px;
}

.footer {
	background: gray;
	position: relative;
	bottom: 0;
	width: 100%;
	height: 40px;
	padding-top: 15px;
	margin-top: 10%;
}

.join_button {
	margin-top: 10%;
	margin-left: 35%;
	width: 200px;
	height: 50px;
	align: center;
	border: 3px solid MediumSeaGreen;
	border-radius: 15px;
	font-size: 1em;
}

input {
	outline: none;
}

a {
	font-size: 15px;
}

.emailbtn {
	HEAD: WebContent/view/join_form3.jsp;
	margin-left: 5%;
	margin-top: -50%;
	width: 100px;
	height: 30px;
}

.emailbox {
	border-right: none;
	border-top: none;
	border-left: none;
	background: #EAEAEA;
	width: 150px;
	font-size: 15px;
	text-align: center;
	HEAD: WebContent/view/join_form3.jsp;
	margin-left: 5%;
	margin-top: -5%;
}

#check_mail {
	margin-left: 5%;
	margin-top: 3%;
	width: 100px;
	height: 30px;
}

@media ( max-width :425px) {
	.icon {
		width: 350px;
		height: 350px;
		margin-left: 350px;
		margin-top: 150px;
	}
	header {
		width: 1000px;
		height: 200px;
		font-size: 30px;
	}
	.join {
		margin-left: -500px;
		margin-top: 550px;
		border-radius: 30px;
		width: 970px;
		height: 1300px;
		font-size: 40px;
		font-family: 고딕;
	}
	.textbox {
		width: 150%;
		height: 70px;
		font-size: 30px;
		margin-left: 3%;
	}
	.table {
		border-spacing: 0 30px;
		padding-left: px;
		font-size: 40px;
	}
	.footer {
		position: absoulte;
		margin-top: 30%;
		bottom: 0;
		left: 0;
		right: 0;
		width: 1000px;
		height: 50px;
	}
	.join_button {
		font-size: 40px;
		margin-top: 100px;
		width: 350px;
		height: 100px;
	}
	.emailbtn {
		margin-top: 5%;
		margin-left: 5%;
		width: 150px;
		height: 50px;
		border-radius: 15px;
		font-size: 20px;
	}
	.emailcheck {
		width: 200px;
		height: 50px;
	}
	.emailbox {
		font-size: 20px;
		align-text: center;
		width: 200px;
	}
}
</style>
​
</head>
<body>
	<header>
		<h1>신라대학교 강의 평가</h1>
	</header>
	<img src="../img/sillalogo.png" class="icon" width="250" height="250">
	<div>
		<form
			action='${pageContext.request.contextPath}/lecture-evaluation?action=join'
			method="POST">
			<fieldset class="join">
				<legend align="center">
					<h2>회원 가입</h2>
				</legend>
				<table class="table">
					<tr>
						<th>이름</th>
						<td><input type="text" class="textbox" required></td>
					</tr>
					<tr>
						<th>학과</th>
						<td><c:import
								url="http://localhost:8080/sillauv/view/dept.jsp" /></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="user_id" class="textbox" name="id"
							required><br> <span class="check_font" id="id_check"></span>
							<span class="textbox" id="id_check"></span></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="textbox" id="user_pw"
							name="pwd" required><br> <span class="textbox"
							id="pw_check"></span></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" class="textbox" id="user_pw2"
							required><br> <span class="textbox" id="pw2_check"></span>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" class="textbox" id="user_nick"
							name="nickname" required><br> <span class="textbox"
							id="nick_check"></span></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" class="textbox" placeholder="이메일 입력"
							id="user_email" value="@sillain.ac.kr" required><br>
							<input type="button" class="emailcheck" value="이메일 인증"
							id="check_mail"> &nbsp;&nbsp;&nbsp;<a
							href="http://outlook.com/sillain.ac.kr" target="_blank"
							style="text-decoration: none; color: blue;">인증 페이지 접속</a></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="text" class="emailbox" placeholder="인증번호 입력"
							name="verifi" id="e_code" /> <input type="button"
							class="emailbtn" value="확인" id="code_btn"><br> <span
							class="textbox" id="code_check"></span></td>
					</tr>
				</table>
				<a href="index.jsp>"><input type="button" value="회원가입"
					onclick="addInput()" class="join_button"> </a>
			</fieldset>
		</form>
	</div>
	</form>
	</div>

	<footer class="footer" align="center"> 201795025 김유진 /
		201795081 정주경 </footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/JoinScript.js"> </script>
</body>
</html>
>>>>>>>
00a99526abeb3c51ba324ed31f2224fb94e3df08:WebContent/view/real_join_form.jsp
