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
			<h2	class="page-section-heading text-center text-uppercase text-secondary mb-0">강의평가 등록</h2><br>
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
					<form id="contactForm" name="sentMessage" novalidate="novalidate"
						action='${pageContext.request.contextPath}/lecture-evaluation/admin?action=update' method="POST">
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>INDEX</label> <input class="form-control" name="idx" type="text" value="${lecture.idx}" readonly/>
							</div>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>강의명</label> <input class="form-control" name="lec_name" type="text" value="${lecture.lec_name}" readonly/>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>교수명</label> <input class="form-control" 
									name="p_name" type="text" value="${lecture.p_name}" readonly/>
							</div>
						</div><br><br>
						<div class="control-group">
                        	<div style="font-size:18px; font-weight: bold; text-align:center;">총  별  점
								<span class="star-input" style="text-align:center; margin-left:2rem">
								<span class="input">
							    	<input type="radio" name="star" value="1" id="p1" required>
							    	<c:if test="${lecture.star==1}"><input type="radio" name="star" value="1" id="p1" required checked></c:if>
							    	<label for="p1">1</label>
							    	<input type="radio" name="star" value="2" id="p2">
							    	<c:if test="${lecture.star==2}"><input type="radio" name="star" value="2" id="p2" checked></c:if>
							    	<label for="p2">2</label>
							    	<input type="radio" name="star" value="3" id="p3">
							    	<c:if test="${lecture.star==3}"><input type="radio" name="star" value="3" id="p3" checked></c:if>
							    	<label for="p3">3</label>
							    	<input type="radio" name="star" value="4" id="p4">
							    	<c:if test="${lecture.star==4}"><input type="radio" name="star" value="4" id="p4" checked></c:if>
							    	<label for="p4">4</label>
							    	<input type="radio" name="star" value="5" id="p5">
							    	<c:if test="${lecture.star==5}"><input type="radio" name="star" value="5" id="p5" checked></c:if>
							    	<label for="p5">5</label>
			  					</span>
								</span> 
							</div>	       
                        </div>
						<br><br>
						<table>
						<tr>
							<td style="font-size:18px;text-align:left">출석 체크</td>
                        	 <td><span class="star-input2">
								<span class="input2">
							    	<input type="radio" name="attendance" value="1" id="a1" required>
							    	<c:if test="${lecture.attendance==1}"><input type="radio" name="attendance" value="1" id="a1" required checked></c:if>
							    	<label for="a1">1</label>
							    	<input type="radio" name="attendance" value="2" id="a2">
							    	<c:if test="${lecture.attendance==2}"><input type="radio" name="attendance" value="2" id="a2" checked></c:if>
							    	<label for="a2">2</label>
							    	<input type="radio" name="attendance" value="3" id="a3">
							    	<c:if test="${lecture.attendance==3}"><input type="radio" name="attendance" value="3" id="a3" checked></c:if>
							    	<label for="a3">3</label>
							    	<input type="radio" name="attendance" value="4" id="a4">
							    	<c:if test="${lecture.attendance==4}"><input type="radio" name="attendance" value="4" id="a4" checked></c:if>
							    	<label for="a4">4</label>
							    	<input type="radio" name="attendance" value="5" id="a5">
							    	<c:if test="${lecture.attendance==5}"><input type="radio" name="attendance" value="5" id="a5" checked></c:if>
							    	<label for="a5">5</label>
			  					</span>
							</span>   
							</td>
						</tr> 
						<tr>
						<td style="font-size:18px; text-align:left;">과제</td>
                        	<td><span class="star-input3">
								<span class="input3">
							    	<input type="radio" name="assign" value="1" id="as1" required>
							    	<c:if test="${lecture.assign==1}"><input type="radio" name="assign" value="1" id="as1" required checked></c:if>
							    	<label for="as1">1</label>
							    	<input type="radio" name="assign" value="2" id="as2">
							    	<c:if test="${lecture.assign==2}"><input type="radio" name="assign" value="2" id="as2" checked></c:if>
							    	<label for="as2">2</label>
							    	<input type="radio" name="assign" value="3" id="as3">
							    	<c:if test="${lecture.assign==3}"><input type="radio" name="assign" value="3" id="as3" checked></c:if>
							    	<label for="as3">3</label>
							    	<input type="radio" name="assign" value="4" id="as4">
							    	<c:if test="${lecture.assign==4}"><input type="radio" name="assign" value="4" id="as4" checked></c:if>
							    	<label for="as4">4</label>
							    	<input type="radio" name="assign" value="5" id="as5">
							    	<c:if test="${lecture.assign==5}"><input type="radio" name="assign" value="5" id="as5" checked></c:if>
							    	<label for="as5">5</label>
			  					</span>
								</span> 
							</td>
						</tr>   
                        <tr>
						<td style="font-size:18px; text-align:left;">학점</td>
                        	<td><span class="star-input4">
								<span class="input4">
							    	<input type="radio" name="grade" value="1" id="g1" required>
							    	<c:if test="${lecture.grade==1}"><input type="radio" name="grade" value="1" id="g1" required checked></c:if>
							    	<label for="g1">1</label>
							    	<input type="radio" name="grade" value="2" id="g2">
							    	<c:if test="${lecture.grade==2}"><input type="radio" name="grade" value="2" id="g2" checked></c:if>
							    	<label for="g2">2</label>
							    	<input type="radio" name="grade" value="3" id="g3">
							    	<c:if test="${lecture.grade==3}"><input type="radio" name="grade" value="3" id="g3" checked></c:if>
							    	<label for="g3">3</label>
							    	<input type="radio" name="grade" value="4" id="g4">
							    	<c:if test="${lecture.grade==4}"><input type="radio" name="grade" value="4" id="g4" checked></c:if>
							    	<label for="g4">4</label>
							    	<input type="radio" name="grade" value="5" id="g5">
							    	<c:if test="${lecture.grade==5}"><input type="radio" name="grade" value="5" id="g5" checked></c:if>
							    	<label for="g5">5</label>
			  					</span>
								</span>      
							</td> 
						</tr> 
						<tr>
						<td style="font-size:18px; text-align:left;">학습량</td>
                        	<td><span class="star-input5">
								<span class="input5">
							    	<input type="radio" name="learning" value="1" id="l1" required>
							    	<c:if test="${lecture.learning==1}"><input type="radio" name="learning" value="1" id="l1" required checked></c:if>
							    	<label for="l1">1</label>
							    	<input type="radio" name="learning" value="2" id="l2">
							    	<c:if test="${lecture.learning==2}"><input type="radio" name="learning" value="2" id="l2" checked></c:if>
							    	<label for="l2">2</label>
							    	<input type="radio" name="learning" value="3" id="l3">
							    	<c:if test="${lecture.learning==3}"><input type="radio" name="learning" value="3" id="l3" checked></c:if>
							    	<label for="l3">3</label>
							    	<input type="radio" name="learning" value="4" id="l4">
							    	<c:if test="${lecture.learning==4}"><input type="radio" name="learning" value="4" id="l4" checked></c:if>
							    	<label for="l4">4</label>
							    	<input type="radio" name="learning" value="5" id="l5">
							    	<c:if test="${lecture.learning==5}"><input type="radio" name="learning" value="5" id="l5" checked></c:if>
							    	<label for="l5">5</label>
			  					</span>
								</span>    
							</td>    
                        </tr>
                        <tr>
						<td style="font-size:18px; text-align:left;">난이도</td>
                        	<td><span class="star-input6">
								<span class="input6">
							    	<input type="radio" name="difficulty" value="1" id="d1" required>
							    	<c:if test="${lecture.difficulty==1}"><input type="radio" name="difficulty" value="1" id="d1" required checked></c:if>
							    	<label for="d1">1</label>
							    	<input type="radio" name="difficulty" value="2" id="d2">
							    	<c:if test="${lecture.difficulty==2}"><input type="radio" name="difficulty" value="2" id="d2" checked></c:if>
							    	<label for="d2">2</label>
							    	<input type="radio" name="difficulty" value="3" id="d3">
							    	<c:if test="${lecture.difficulty==3}"><input type="radio" name="difficulty" value="3" id="d3" checked></c:if>
							    	<label for="d3">3</label>
							    	<input type="radio" name="difficulty" value="4" id="d4">
							    	<c:if test="${lecture.difficulty==4}"><input type="radio" name="difficulty" value="4" id="d4" checked></c:if>
							    	<label for="d4">4</label>
							    	<input type="radio" name="difficulty" value="5" id="d5">
							    	<c:if test="${lecture.difficulty==5}"><input type="radio" name="difficulty" value="5" id="d5" checked></c:if>
							    	<label for="d5">5</label>
			  					</span>
								</span>   
							  </td>
							</tr>   
						</table><br><br>
	                        <div class="form-group">
	      						<label for="exampleTextarea" style="font-size:15px; font-weight:bold">평가 내용</label><br>
	     						<textarea class="form-control" id="exampleTextarea" rows="3" name="content">${lecture.content}</textarea>
	    					</div><br>
						<div class="loginbtn">
							<button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton" >강의평 등록</button>
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
	<script src="../js/jquery-1.11.3.min.js"></script>
	<script src="../js/star.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>