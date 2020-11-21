<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>신라대 강의평가</title>
        <!-- Favicon-->
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <span class="navbar-brand js-scroll-trigger">신라대 강의평가</span>
              	<div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    	<li class="nav-item mx-0 mx-lg-1"><span class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" style="color:white">
                    	닉네임님</span></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath}/lecture-evaluation/index?action=logout">로그아웃</a></li>
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
					<div class="search">
					<input type="text" name="search_id" class="masthead-subheading font-weight-light mb-0" placeholder="과목명 또는 교수명 입력"/>
					<button type="submit" class="btn btn-xl btn-outline-light">검색</button>	
					</div>
						
				</form>
                <!-- Icon Divider-->
                
                <!-- Masthead Subheading-->
            </div>
        </header>
        <!-- Portfolio Section-->
        
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
            <c:if test="${deptlist==null}" >
			등록된 최신글이 없습니다.
	</c:if>
	<c:if test="${deptlist!=null}">
		${user_dept} 최신 강의평
		<c:forEach var="dept_list" items="${deptlist}" >
					<table class="text">
						<tr>
							<td><h2>강의명:${dept_list.lec_name}</h2></td>
						</tr>
						<tr>
							<td><h2>교수명:${dept_list.p_name}</h2></td>
						</tr>
						<tr>
							<td><h2>별점:${dept_list.star}</h2></td>
						</tr>
						<tr>
							<td><h2>내용:${dept_list.content}</h2></td>
						</tr>
						<tr>
							<td><h2>날짜:${dept_list.todate}</h2></td>
						</tr>
					</table>
					<br>
			</c:forEach>
		</c:if>
            </div>
        </section>
        <!-- Footer-->
       
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 201795025 김유진, 201795081정주경</small></div>
        </div>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
       
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
    </body>
</html>
