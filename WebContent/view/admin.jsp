<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
	}
	body{
		background-color:#EAEAEA;
		background-clip:content-box;
	}
	.serach{
		text-align : center;
		margin-top : 3%;
	}
	.img{
		margin-left:44%;
		margin-top: 5%;
	}
	fieldset{
		background : none;
		width:400px;
		height:170px;
		padding-top:1%;
		border-radius:5px;
		margin-left:39%;
		margin-top:5%;
	}
	footer{
		background: gray;
		position:relative;
		bottom:0;
		width:100%;
		height:40px;   	
		padding-top:15px;
		margin-top:10%;
	}
	h1{
		text-align:center;
	}
	.button1{
		border:0;
		outline:0;
		position:absolute;
		background:none;
		margin-left:66%;
		margin-top:-43px;
	}
	table{
		margin-left:auto;
		margin-right:auto;
	}
	.other{
		align-text:center;
	}
	input{
		outline:none;
	}
	a{
		color : black;
		text-decoration:none;
	}
	
}
</style>
</head>
<body>
	<h1>관리자 페이지</h1>
	<header>
		<h1>신라대학교 강의 평가</h1> 
		<h2>로그인 된 페이지</h2>
	</header>
	<main>
	${cookie.nickCookie.value }님
	<form action='${pageContext.request.contextPath}/lecture-evaluation/admin?action=search' method="POST">
	<nav>
		<div class="serach">
			<input type="text" name="search_id" placeholder="과목명 또는 교수명 입력" style="border:2px solid MediumSeaGreen; border-radius:5px; width:600px; height:30px;"  />
		</div>
		<button class="button1" type="submit"><img src="../img/search.png" style="width:50px; height:50px;"></button>		
	</nav>
	</form>
	<c:forEach var="list" items="${admin_eval}" >
	
					<a href='${pageContext.request.contextPath}/lecture-evaluation/admin?action=update_form&idx=${list.idx}'>
						수정</a>
					<a href='#' onclick='confirmAndDelete(
						 "${list.idx}","${list.lec_name}");'>삭제</a>
						
					<table border="1">
						<tr>
							<td>${list.idx}번</td>
						</tr>
						<tr>
							<td>학과:${list.dept}</td>
						</tr>
						<tr>
							<td>강의명:${list.lec_name}</td>
						</tr>
						<tr>
							<td>교수명:${list.p_name}</td>
						</tr>
						<tr>
							<td>별점:${list.star}</td>
						</tr>
						<tr>
							<td>내용:${list.content}</td>
						</tr>
						<tr>
							<td>날짜:${list.todate}</td>
						</tr>
					</table>
					<br>
			</c:forEach>
			
			</main>
	<footer align="center">
		201795025 김유진 / 201795081 정주경
	</footer>
	<script>
	</script>
</body>
</html>