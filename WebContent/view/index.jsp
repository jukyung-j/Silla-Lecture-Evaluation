<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>신라대학교 강의 평가</title>
	
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
	.img{
		margin-left:44%;
		margin-top: 5%;
	}
	.login{
		background : none;
		width:400px;
		height:300px;
		padding-top:1%;
		border-radius:5px;
		margin-left:39%;
		margin-top:5%;
		font-size:25px;
	}
	h1{
		text-align:center;
		
	}
	.button1{
		border:0;
		outline:0;
		position:absolute;
		background:none;
		margin-left:81%;
		margin-top:-60px;
	}
	.table{
		margin-left:auto;
		margin-right:auto;
		width:150px;
		border-spacing: 0 20px;
		
	}
	.loginbox{
		width:300px;
		height:30px;
		font-size:25px;
	}
	.loginbutton{
		height:30px;
		font-size:20px;
	}
	.other{
		align-text:center;
	}
	input{
		outline:none;
	}
	a{
		font-size:20px;
		color : black;
		text-decoration:none;
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
	html{
	height:100%;
	}
		header{
			width:1000px;
			height:200px;
			font-size:30px;
			padding-top:20px;	
		}
		.searchbox{
			width:800px;
			height:80px;
			margin-left:100px;
			margin-top:50px;
			font-size:30px;
		}
		.logo{
			width:200%;
			height:200%;
			margin-left:130px;
			margin-top:150px;
		}
		.button1{
			display:none;
		}
		.login{
			margin-left:70px;
			margin-top:200px;
			width:800px;
			height: 700px;
			font-size:30px;
		}
		.loginbox{
			margin-left:0px;
			width:600px;
			height:80px;
			font-size:30px;
		}
		.table{
			padding-top: 50px;
			border-spacing: 0 50px;
			font-size:100%;
		}
		.loginbutton{
			width:300px;
			height:80px;
			font-size:30px;
			border:3px solid MediumSeaGreen;
		}
		a{
			margin-bottom:50%;
			font-size:30px;
			align-text:center;
		}
		.footer{
			margin-top:30%;
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
	<main>
	<nav>
		<div class="search">
		<input type="text" class="searchbox" placeholder="과목명 또는 교수명 입력" style=  />
		</div>
		<button class="button1"><img src="../img/search.png" style="width:70px; height:70px;"></button>		
	</nav>
	<div class="img">
	<img src="../img/sillalogo.png" class="logo" width="250" height="250">
	</div>	
	<form action='?action=login' method="POST">
    <fieldset class="login">
      <legend align="center" >회원 로그인</legend>     
      <table class="table">
     <tr>
     	<td><input type="text" name="id" class="loginbox" placeholder="ID"></td>
     </tr>
   	 <tr> 
    	 <td><input type="password" name="pwd" class="loginbox" placeholder="Password" /></td>
    </tr>	 
    <tr>
    	<td><input type="submit" class="loginbutton" value="로그인" style="width:100%; background:MediumSeaGreen; border-radius:5px; " ></td>
    </tr>
     </table>
      <div>
        <div class="other" align="center">
       <ol>
       	 <a href='${pageContext.request.contextPath}/lecture-evaluation/join_form'>회원가입</a>
       </ol>
       </div>
      </div>
    </fieldset>
  </form>
	</main>
	<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
	</footer>
	<c:if test="${message==false}" >
	<script>
		alert("아이디나 비밀번호를 다시 입력해주세요.");
	</script>
</c:if> 
</body>
</html>