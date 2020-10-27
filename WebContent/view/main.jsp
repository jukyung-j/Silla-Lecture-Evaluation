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
	
	.search{
		text-align : center;
		margin-top : 3%;
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
<main>
	<div>
		<input type="button" class="" value="로그아웃">
	</div>
	<nav>
		<div class="search">
		<input type="text" class="searchbox" placeholder="과목명 또는 교수명 입력" style=  />
		</div>
		<button class="button1"><img src="../img/search.png" style="width:70px; height:70px;"></button>		
	</nav>
	
	<div class="text">
		<h2>과목명</h2>
		<h2>교수명</h2>
		<h2>평가내용</h2>
	</div>
	<div class="text">
		<h2>과목명</h2>
		<h2>교수명</h2>
		<h2>평가내용</h2>
	</div>
	<div class="text">
		<h2>과목명</h2>
		<h2>교수명</h2>
		<h2>평가내용</h2>
	</div>
	

	</main>	
<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
	</footer>

</body>
</html>