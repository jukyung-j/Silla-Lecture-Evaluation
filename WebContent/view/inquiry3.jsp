<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	img{
		margin-left:43%;
		margin-top:10%;
	}
	h2{
		margin-left:42%;
		margin-top:5%;
	}
	.btn{
		width: 230px;
		height:50px;
		font-size:20px;
		border:1px solid MediumSeaGreen;
		border-radius:5px;
		margin-left: 43%;
		margin-top:5%;
		
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
		margin-top:10%;
		font-size:20px;
	}
	
	@media(max-width:425px){
		header{
			width:1000px;
			height:200px;
			font-size:30px;
			padding-top:20px;	
		}
		.logo{
			width:100%;
			height:100%;
			margin-left:75%;
			margin-top:150px;
		}	
		h2{
			margin-top:20%;
			margin-left:50%;
		}
		.btn{
			width:300px;
			height:80px;
			margin-left:88%;
		}
		.footer{
			margin-top:50%;
			padding-top:10%;
			position:absoulte;
			left:0;
			right:0;
			bottom:0;
			width:1000px;
			height:80px;
			font-size:25px;
		}	.
	}
</style>

</head>
<body>
<header>
		<h1>신라대학교 강의 평가</h1> 
</header>

	<img src="${pageContext.request.contextPath}/img/sillalogo.png" class=logo width="230" height="230">
	
	<h1>강의 평</h1>
	${lec_name}<br>
	${p_name}<br>
	별점 평균 : <fmt:formatNumber value="${avg_star}" type="number" /><br>
	
	<c:if test="${eval_list==null}">
		<h2>등록된 강의평가가 없습니다.</h2>
	</c:if>
	<input type="button" value="강의 평가 등록" class="btn"  onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main?action=add_eval&lec_name=${lec_name}&p_name=${p_name}'">
	<c:if test="${eval_list!=null}">
		<c:forEach var="eval" items="${eval_list}" >
			<table border="1">
				<tr>
					<td>별점:${eval.star}</td>
				</tr>
				<tr>
					<td>날짜:${eval.todate}</td>
				</tr>
				<tr>
					<td>내용:${eval.content}</td>
				</tr>
			</table>
			<br>
		</c:forEach>
	</c:if>
	<c:if test="${nick eq '관리자'}">
		<button id="btn" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/admin'">관리자 메인 페이지 가기</button>
	</c:if>
	<c:if test="${nick != '관리자'}">
		<button id="btn" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main'">메인 페이지 가기</button>
	</c:if>
		
<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
	</footer>	
	
</body>
</html>