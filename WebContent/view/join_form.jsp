<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	h1{
		text-align:center;
	}
	body{
		background-color:#EAEAEA;
		background-clip:content-box;
	}
	.icon{
		float:left; 
		margin-top:15%; 
		margin-left:25%;
		clear:both;
		margin-right:1%;
		background:none;
	}
	fieldset{
		background : none;
		width:400px;
		height:500px;
		padding-top:1%;
		border-radius:5px;
		margin-left:30%;
		margin-top:3%;
	}
	table{
		border-collapse:separate;
		border-spacing:0 10px;
	}
	div{
		padding : 100px 500px;
		line-height : 30px;
		
	}
	footer{
		background: gray;
		position:absolute;
		bottom:0;
		width:100%;
		height:40px;  
		padding-top:15px;
		 	
	}
	.join_button{
		margin-top:10%;
		margin-left:27%;
		width:200px;
		height:50px;
		align:center;
		border:3px solid MediumSeaGreen;
		border-radius:15px;
		font-size:1em;
	}
	input{
		outline:none;
	}
	</style>

</head>
<body>
	<header>
		<h1>신라대학교 강의 평가</h1> 
	</header>
	<img src="../img/icon.png" class="icon" width="200" height="200">
	<div>
	<form>
	<fieldset class="join">
      <legend align="center"><h2>회원 가입</h2></legend>
    <table>
    	<tr>
    	<th>이름</th>
    	<td>
    		<input type="text">
    	</td>
    	</tr>
    	<tr>
    	<th>학과</th>
    	<td><select >	
    		<option>학과 선택</option>
    		<option>문헌정보학과</option>
			<option>경영학부</option>
			<option>회계세무학과</option>
			<option>광고홍보학과</option>
			<option>국제관광경영학부</option>
			<option>무역경제학부 무역물류학전공</option>
			<option>무역경제학부 경제금육학전공</option>
			<option>간호학과</option>
			<option>물리치료학과</option>
			<option>치위생학과</option>
			<option>바이오산업학부</option>
			<option>생명과학과</option>
			<option>식품영양학과</option>
			<option>웰빙체육학부</option>
			<option>공과대(공통)</option>
			<option>MICT대(공통)</option>
			<option>건축학부</option>
			<option>지능형자동차공학부</option>
			<option>컴퓨터소프트웨어공학부</option>
			<option>스마트전기전자공학부</option>
			<option>융합기계공학부</option>
			<option>에너지화학공학부</option>
			<option>신소재공학부</option>
			<option>융합디자인학부</option>
			<option>창업예술학부</option>
			<option>교육학과</option>
			<option>유아교육과</option>
			<option>국어교육과</option>
			<option>일어교육과</option>
			<option>영어교육과</option>
			<option>역사교육과</option>
			<option>수학교육과</option>
			<option>컴퓨터교육과</option>
			<option>창조공연예술학부 음악전공</option>
			<option>창조공연예술학부 무용전공</option>
			<option>항공학부 항공운항학전공</option>
			<option>항공학부 항공정비학전공</option>
			<option>항공학부 항공서비스학전공</option>
			<option>교양</option>
			<option>교직</option>
			<option>기업경영학과</option>
			<option>뷰티비즈니스학과</option>
			<option>에너지관리학과</option>
			<option>외국인유학생</option>
		</select>
		</td>
    	</tr>
    	<tr>
    	<th>아이디</th>
    	<td>
    		<input type="text" id="id" >
    	</td>
    	</tr>
    	<tr>
    	<th>비밀번호</th>
    	<td>
    		<input type="password">
    	</td>
    	</tr>	
    	<tr>
    	<th>비밀번호 확인</th>
    	<td>
    		<input type="password">
    	</td>
    	</tr>	
    	<tr>
    	<th>닉네임</th>
    	<td>
    		<input type="text">
    	</td>
    	</tr>
    	<tr>
    	<th>이메일</th>
    	<td>
    		<input type="email">
    		<input type="button" value="이메일 인증"> 
    	</td>
    	</tr>	 	    	 
    </table>
       	<a href="index.jsp>"><input type="button" value="회원가입" class="join_button"> </a>
    
    </fieldset>
  </form>
    </div>	
	<footer align="center">
		201795025 김유진 / 201795081 정주경
	</footer>
</body>
</html>	