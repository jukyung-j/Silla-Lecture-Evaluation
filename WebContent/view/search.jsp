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
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<!-- Masthead Heading-->
			<form action='${pageContext.request.contextPath}/lecture-evaluation/main/search' method="POST">
				<div class="search" style="margin-top:3rem;">
					<input type="text" name="search_id"
						class="masthead-subheading font-weight-light mb-0"
						placeholder="과목명 또는 교수명 입력" />
					<button type="submit" class="btn btn-xl btn-outline-light">검색</button>
				</div>
			</form>
		</div>
	</header>
	<button id="register"class="btn btn-info"
	 onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main/register_form'" style="margin:1rem" >새로 만들기</button><br>
	<c:if test="${lectureList==null }" >
		<div class="list-group">
  			<span class="list-group-item list-group-item-action">등록된 글이 없습니다</span>
		</div>
	</c:if>
		
	
	<c:if test="${lectureList!=null }">
		
			<c:forEach var="lec_list" items="${lectureList}" >
				<c:if test="${nick eq '관리자'}">
					<br>&nbsp;&nbsp;<a href="#" onclick="ConfirmAndDelete('${lec_list.lec_name}','${lec_list.p_name}');">삭제</a>
				</c:if>
				<div class="list-group" onclick="inquiery('${lec_list.lec_name}','${lec_list.p_name }');" style="margin:1rem">
  					<span class="list-group-item list-group-item-action">${lec_list.lec_name}
  					<br>${lec_list.p_name}</span>
				</div>
		</c:forEach>
		
	</c:if>
	
	<!-- Footer-->

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright © 201795025 김유진, 201795081정주경</small>
		</div>
	</div>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->

	<!-- Bootstrap core JS-->
	<script>	
		function inquiery(lec_name,p_name){
			if(${nick!=null}){
				location.href="${pageContext.request.contextPath}/lecture-evaluation/main/inquiry?lec_name="+lec_name+"&p_name="+p_name;
			}
			else{
				alert("로그인해주세요");
			}
		}
		function ConfirmAndDelete(title, name){
			let result = confirm('강의명:"'+title+'" 교수명:"'+name+'" 강의를 정말로 삭제하시겠습니까?');
			if(result){
				location.href='${pageContext.request.contextPath}/lecture-evaluation/admin?action=lecture_delete&lec_name=' + title+'&p_name='+name;
			}
		}
		</script>
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
