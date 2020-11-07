<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<header>
		<h1>신라대학교 강의 평가</h1> 
	</header>
	<main>
	<nav>
	<form action='${pageContext.request.contextPath}/lecture-evaluation/main?action=search' method="POST">
		<div class="serach">
		<input type="text" placeholder="과목명 또는 교수명 입력" name="search_id" style="border:2px solid MediumSeaGreen; border-radius:5px; width:600px; height:30px;"  />
		</div>
		<button class="submit"><img src="${pageContext.request.contextPath}/img/search.png" style="width:50px; height:50px;"></button>		
	</form>
	</nav>
	<div class="img">
	<img src="${pageContext.request.contextPath}/img/sillalogo.png" width="230" height="230">
	</div>	
	
	<form action='${pageContext.request.contextPath}/lecture-evaluation?action=login' method="POST">
    <fieldset class="login">
      <legend align="center" >회원 로그인</legend>
     <table>
     <tr>
     	<td><input type="text" name="id" placeholder="ID"></td>
     </tr>
   	 <tr> 
    	 <td><input type="password" name="pwd" placeholder="Password" /></td>
    </tr>	 
    <tr>
    	<td><input type="submit" class="loginbutton" value="로그인" style="width:100%; background:MediumSeaGreen; border-radius:5px; " ></td>
    </tr>
     </table>
      <div>
        <div class="other" align="center">
       <ol>
       	 <a href='${pageContext.request.contextPath}/lecture-evaluation/join_form'>회원가입 </a>
       </ol>
       </div>
      </div>
    </fieldset>
  </form>
	</main>
	<footer align="center">
		201795025 김유진 / 201795081 정주경
	</footer>
	<c:if test="${message==false}" >
		<script>
			alert("아이디나 비밀번호를 다시 입력해주세요.");
		</script>
	</c:if> 
	<c:if test="${cookie.nickCookie.value eq '관리자'}">
			<script>
				location.href="${pageContext.request.contextPath}/lecture-evaluation/admin";
	
			</script>
	</c:if>	
	<c:if test="${cookie.loginCookie.value != null}">
		
		<script>
			location.href="${pageContext.request.contextPath}/lecture-evaluation/main";
		</script>
	</c:if>	
	
</body>
</html>