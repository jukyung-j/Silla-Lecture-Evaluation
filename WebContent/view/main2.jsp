<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>신라대학교 강의 평가 </title>
	
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

<body>
	<header>
		<h1>신라대학교 강의 평가</h1> 
	</header>
<main>
	<table class="out">
		<tr>
			<td>
				${nick}님
			</td>
			<td>
				<input type="button" class="outbox" value="로그아웃" onclick="logout()">
			</td>
		</tr>
	</table>
	<nav>
		<form action='${pageContext.request.contextPath}/lecture-evaluation/main/search' method="POST">
			<div class="search">
				<input type="text" class="searchbox" placeholder="과목명 또는 교수명 입력" name="search_id"  />
			</div>
			<button class="button1" type="submit"></button>		
		</form>
	</nav>
	<%-- <c:if test="${deptlist==null}" >
			<h3>등록된 최신글이 없습니다.</h3>
	</c:if> --%>
	<%-- <c:if test="${deptlist!=null}"> --%>
	<%-- 	<c:forEach var="dept_list" items="${deptlist}" > --%>
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
					<br>
			<%-- </c:forEach>
		</c:if> --%>
	</main>	
	<footer class="footer" align="center">
			201795025 김유진 / 201795081 정주경
	</footer>
	<script>
		function logout(){
			location.href="${pageContext.request.contextPath}/lecture-evaluation/index?action=logout";
		}
	</script>

</body>
</html>