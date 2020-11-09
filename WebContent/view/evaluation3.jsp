<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<table>
	<tr>
		<td>강의명:${dept_list.lec_name}</td>
	</tr>
	<tr>
		<td>교수명:${dept_list.p_name}</td>
	</tr>
	<tr>
		<td>별점:${dept_list.star}</td>
	</tr>
	<tr>
		<td>내용:${dept_list.content}</td>
	</tr>
	<tr>
		<td>날짜:${dept_list.todate}</td>
	</tr>
</table>
	
	
<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
	</footer>	
</body>
</html>