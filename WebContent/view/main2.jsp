<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD:WebContent/view/main.jsp
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
=======
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	
<<<<<<< HEAD
	<title>신라대학교 강의 평가 </title>
</head>

=======
<style>
	header{
		position: static;
 		top: 0;
  		left: 0;
  		right: 0;
 		height: 5%;
  		padding: 1rem;
  		color: white;
  		background: MediumSeaGreen;
  		font-weight: bold;
  		font-size:25px;
	}
	body{
		background-color:#EAEAEA;
		background-clip:content-box;
	}
	h1{
		text-align:center;
	}
	.search{
		text-align : center;
		margin-top : 3%;
	}
	h3{
		font-size:25px;
		margin-top:12%;
		text-align:center;
	}
	.searchbox{
		border:2px solid MediumSeaGreen;
		border-radius:5px;
		width:60%; 
		height:50px;
		font-size:30px;
	}
	.button1{
		border:0;
		outline:0;
		position:absolute;
		background:none;
		margin-left:81%;
		margin-top:-60px;
	}
	.text{
		margin-left:20%;
		background:white;
		width:60%;
		height:500px;
		border:3px solid MediumSeaGreen;
		margin-top:5%;
		margin-bottom:5%;
		border-radius:3em;
		padding-left:10px;
  		
	}
	.out{
		margin-left:90%;
		margin-top:0.5%;
		font-size:20px;
	}
	.outbox{
		margin-left:20%;
		width:100px;
		height:40px;
		border-radius:10%;
	}
	.footer{
		background: gray;
		position:relative;
		left: 0;
  		right: 0;
		bottom:0;
		width:100%;
		height:40px;   	
		padding-top:15px;
		margin-top:20%;
		font-size:20px;
	}
	
	@media(max-width:425px){
	header{
			width:1000px;
			height:200px;
			font-size:30px;
		}
	.out{
		margin-left: 190%;
		font-size:25px;
	}
	.outbox{
		font-size:25px;
		width:150px;
	}
	.searchbox{
		width:800px;
		height:100px;
		margin-top:10%;
		margin-left:30%;
		font-size:35px;
		
	}
	.text{
		margin-top:30%;
		margin-left:30%;
		width:800px;
		height:1000px;
		font-size:25px;
	}
	.footer{
			position:absoulte;
			margin-top:30%;
			bottom:0;
			left:0;
			right:0;
			width:1000px;
			height:50px;
		}
	
	}
	
	
</style>
</head>
>>>>>>> e8a50ea5c3a8313d7260f73e3cbe6c81401ad28c

<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <span class="navbar-brand js-scroll-trigger">신라대 강의평가</span>
            </div>
        </nav>
              <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
          <form action='${pageContext.request.contextPath}/lecture-evaluation/main/search' method="POST">
					<div class="search">
					<input type="text" name="search_id" class="masthead-subheading font-weight-light mb-0" placeholder="과목명 또는 교수명 입력"/>
					<button type="submit" class="btn btn-xl btn-outline-light">검색</button>	
					</div>
						
				</form>
	</header>
<main>
	<table class="out">
		<tr>
			<td class="name">
				${nick}님
			</td>
			<td>
				<input type="button" class="outbox" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/index?action=logout'">
				
			</td>
		</tr>
	</table>
	<nav>
		<form action='${pageContext.request.contextPath}/lecture-evaluation/main/search' method="POST">
			<button class="button1" type="submit"></button>		
		</form>
	</nav>
	<%-- <c:if test="${deptlist==null}" >
			<h3>등록된 최신글이 없습니다.</h3>
	</c:if> --%>
	<%-- <c:if test="${deptlist!=null}"> --%>
	<%-- 	<c:forEach var="dept_list" items="${deptlist}" > --%>
<<<<<<< HEAD

	<div class="card text-white bg-primary mb-3">
  		<div class="card-header"><h2>수업명${dept_list.lec_name}</h2> 교수명${dept_list.p_name} 교수님</div>
  		<div class="card-body" style="background-color:white; color:black">
    	<h4 class="card-title">${nick} 님의 의견</h4>
    	<%@ page import="java.util.*, java.text.*"  %>
			<%
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("작성일 yyyy-MM-dd HH:mm:ss");
 			 String today = formatter.format(new java.util.Date());
			out.println(today);
			%>
			
    	<p class="card-text">${dept_list.content}종강주세여,,,</p>
    	
    	<div class="radar">
    	<c:import url="http://localhost:8080/sillauv/view/radar.jsp"/>
    	</div>
  </div>
</div>
=======
>>>>>>> 00a99526abeb3c51ba324ed31f2224fb94e3df08:WebContent/view/main2.jsp
					<table class="text">
						<tr>
							<td><h2>강의명:${dept_list.lec_name} hh</h2></td>
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
>>>>>>> e8a50ea5c3a8313d7260f73e3cbe6c81401ad28c
					<br>
<<<<<<< HEAD:WebContent/view/main.jsp
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
=======
			<%-- </c:forEach>
		</c:if> --%>
	</main>	
	 <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 201795025 김유진, 201795081정주경</small></div>
        </div>
</body>
</html>
>>>>>>> 00a99526abeb3c51ba324ed31f2224fb94e3df08:WebContent/view/main2.jsp
