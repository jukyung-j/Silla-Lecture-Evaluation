<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">		
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
	.register{
		width:50%;
		height:500px;
		margin-left:25%;
		margin-top:5%;
	}
	.re{
		font-size:20px;
		margin-left:10%;
		border-spacing:0 20px;
	}
	.small{
		margin-left:5%;
		width:600px;
		height:30px;
		
	}
	.rebutton{
		width:300px;
		height:40px;
		font-size:20px;
		margin-top:15%;
		margin-left:35%;
		border:1px solid MediumSeaGreen;
		border-radius:5px;
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
</style>
	
</head>
<body>
	<header>
		<h1>신라대학교 강의 평가</h1> 
	</header>
	<table class="out">
		<tr>
			<td>
				${nick}님
			</td>
			<td>
				<input type="button" class="outbox" value="로그아웃" onclick="${pageContext.request.contextPath}/lecture-evaluation/index?action=logout">
			</td>
		</tr>
	</table>
	<fieldset class="register">
      <legend align="center"><h2>강의 등록</h2></legend>
	<form action='${pageContext.request.contextPath}/lecture-evaluation/main?action=register' method="POST">
	<table class="re">
		<tr>
		<th> 강의명 </th>
			<td><input type="text" class="small" name="lec_name" required></td>	
		</tr>
		<tr>
		<th> 교수명 </th>
			<td><input type="text" class="small" name="p_name" required></td>	
		</tr>
		<tr>
		<th> 해당학과 </th>
			<td>
				<c:import url="http://localhost:8080/sillauv/view/dept.jsp" />
			</td>
		</tr>	
	</table>
	<input type="button" value="등록" class="rebutton">
</fieldset>
</form>	

<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
</footer>		 
</body>
</html>