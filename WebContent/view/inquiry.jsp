<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>

	<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
	
	<link href="${pageContext.request.contextPath}/css/bootstrap.css?after" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	
	<title>신라대학교 강의 평가 </title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <span class="navbar-brand js-scroll-trigger">신라대 강의평가</span>
                <div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><span style="color: white"> ${nick}님
					<a href="${pageContext.request.contextPath}/lecture-evaluation/index?action=logout">로그아웃</a></span></li>
				</ul>
			</div>
            </div>
        </nav>
            <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <!-- Masthead Heading-->
                <form action='${pageContext.request.contextPath}/lecture-evaluation/main/search' method="POST">
					<div class="search"  style="margin-top:3rem;">
					<input type="text" name="search_id" class="masthead-subheading font-weight-light mb-0" placeholder="과목명 또는 교수명 입력"/>
					<button type="submit" class="btn btn-xl btn-outline-light">검색</button>	
					</div>
					</form>
	 </header>
	 <table class="table table-hover" style="margin-bottom:3rem;">
	 <thead>
	    <tr>
	      <th scope="col">${lec_name}</th>
	      <th scope="col">${p_name}</th>
	      <th scope="col">별점 평균</th>
	      <th scope="col" style="color:Gold">
		      <c:choose>
		  			<c:when test="${avg_star>=1.0 and avg_star<2.0}">★☆☆☆☆</c:when>
		  			<c:when test="${avg_star >= 2.0 and avg_star<3.0}">★★☆☆☆</c:when>
		  			<c:when test="${avg_star >= 3.0 and avg_star<4.0}">★★★☆☆</c:when>
		  			<c:when test="${avg_star >= 4.0 and avg_star<5.0}">★★★★☆</c:when>
		  			<c:when test="${avg_star == 5.0}">★★★★★</c:when>
		  	 </c:choose>
		  	 <fmt:formatNumber value="${avg_star}" type="number" />
	  	</th>
	    </tr>
  	 </thead>
	 </table>
	 <div class="b">
       <button type="button" class="btn btn-primary2" 
       onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main?action=add_eval&lec_name=${lec_name}&p_name=${p_name}'">강의평 등록</button>
       <c:if test="${nick=='관리자'}">
       	<button type="button" class="btn btn-primary3" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/admin'">🏠</button>
       </c:if>
       <c:if test="${nick!='관리자' }">
       	<button type="button" class="btn btn-primary3" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main'">🏠</button>
    	</c:if>
    </div>
    <c:if test="${eval_list==null}" >
		<div class="card-header">
  			등록된 글이 없습니다
		</div>
	</c:if>
	<c:if test="${eval_list!=null}">
	<c:forEach var="eval" items="${eval_list}">
	<c:if test="${nick=='관리자'}">
		<div class="aa">
		<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin-left:0rem">
	  		<label class="btn btn-primary active">
	   			 <input type="radio" name="options" id="option1" autocomplete="off" 
	   			 onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/admin?action=update_form&idx=${eval.idx}'"> 수정
	  		</label>
	  		<label class="btn btn-primary" style="margin-left:-1rem">
	   			 <input type="radio" name="options" id="option3" autocomplete="off" 
	   			 onclick='confirmAndDelete("${eval.idx}","${eval.lec_name}");'> 삭제
	  		</label>
		</div>
		</div>
	</c:if>
		 <div class="card text-white bg-primary mb-3" style="height:auto">
	  		<div class="card-header"><h2>${eval.lec_name} 
	  		<span style="color:Gold" class="star">
	  		 <c:choose>
		  			<c:when test="${eval.star==1}">★☆☆☆☆</c:when>
		  			<c:when test="${eval.star==2}">★★☆☆☆</c:when>
		  			<c:when test="${eval.star==3}">★★★☆☆</c:when>
		  			<c:when test="${eval.star==4}">★★★★☆</c:when>
		  			<c:when test="${eval.star==5}">★★★★★</c:when>
		  	 </c:choose>
	  		</span></h2> 
	  		${eval.p_name} 교수님</div>
	  		<div class="card-body" style="background-color:white; color:black; height:30rem; padding-bottom:1rem; height:auto">
	  		<div class="nn">	
	    		<h4 class="card-title">${eval.writer} 님의 의견</h4>
	    		${eval.todate}
	    		<p class="card-text">${eval.content}</p>
	    	</div>
	    	<div class="radar">
	    	<canvas id="${eval.idx}" width=250></canvas>
				<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
				<script type="text/javascript">
				var context = document.getElementById(${eval.idx}).getContext('2d');
				var myChart = new Chart(context, {
					type: 'radar',
					data: {
						labels: ['출석체크','과제','학점','학습량','난이도'],
						datasets: [{
							label:'평가',
							backgroundColor : ['rgba(75,192,192,0.2)'],
							data: [${eval.attendance},${eval.assign},${eval.grade},${eval.learning},${eval.difficulty}]
						}]
					},
					options : {
						responsive : false,
						scale:{
							ticks: {
								beginAtZero: true,
							      min: 0,
							      max: 5,
							      stepSize: 1
							}
						}	
					}
					
				});
				</script>
	    	</div>
	 	 </div>
	  </div>
  </c:forEach>
  </c:if>
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 201795025 김유진, 201795081정주경</small></div>
        </div>
          <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
        function confirmAndDelete(idx, title){
    		let result = confirm('"'+title+'" 강의를 정말로 삭제하시겠습니까?');
    		if(result){
    			location.href='${pageContext.request.contextPath}/lecture-evaluation/admin?action=delete&idx=' + idx;
    		}
    	}</script>
        </script>

</body>
</html>