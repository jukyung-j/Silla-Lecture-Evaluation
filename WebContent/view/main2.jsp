<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	
	<title>신라대학교 강의 평가 </title>
</head>


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
					<br>
			<%-- </c:forEach>
		</c:if> --%>
	</main>	
	 <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 201795025 김유진, 201795081정주경</small></div>
        </div>
</body>
</html>