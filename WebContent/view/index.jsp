<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		position:absolute;
		bottom:0;
		width:100%;
		height:40px;   	
		padding-top:15px;
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
		margin-top:-34px;
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
	<header>
		<h1>신라대학교 강의 평가</h1> 
	</header>
	<main>
	<nav>
		<div class="serach">
		<input type="text" placeholder="과목명 또는 교수명 입력" style="border:2px solid MediumSeaGreen; border-radius:5px; width:600px; height:30px;"  />
		</div>
		<button class="button1"><img src="../img/bicon.png" style="width:30px; height:30px;"></button>		
	</nav>
	<div class="img">
	<img src="../img/sillaimg.jpg" width="230" height="230">
	</div>	
	<form>
    <fieldset class="login">
      <legend align="center" >회원 로그인</legend>
     <table>
     <tr>
     	<td><input type="text" name="id" placeholder="ID"></td>
     </tr>
   	 <tr> 
    	 <td><input type="password" name="pw" placeholder="Password" /></td>
    </tr>	 
    <tr>
    	<td><input type="button" class="loginbutton" value="로그인" style="width:100%; background:MediumSeaGreen; border-radius:5px; " ></td>
    </tr>
     </table>
      <div>
        <div class="other" align="center">
       <ol>
       	 <a href="join_form.jsp">회원가입 / </a>
       	 <a href="">ID 찾기 / </a>
       	 <a href="">비밀번호 찾기</a>
       </ol>
       </div>
      </div>
    </fieldset>
  </form>
	</main>
	<footer align="center">
		201795025 김유진 / 201795081 정주경
	</footer>
</body>
</html>