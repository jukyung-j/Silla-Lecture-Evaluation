<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-left:15%;
		clear:both;
		margin-right:1%;
		background:none;
	}
	.join{
		background : none;
		width:600px;
		height:600px;
		padding-top:1%;
		border-radius:5px;
		margin-left:30%;
		margin-top:3%;
		
	}
	.table{
		border-collapse:separate;
		border-spacing:0 10px;
	}
	.textbox{
		width:300px;
		height : 30px;
		margin-left:5%;
	}
	div{
		padding : 100px 500px;
		line-height : 30px;
		
	}
	.footer{
		background: gray;
		position:relative;
		bottom:0;
		width:100%;
		height:40px;  
		padding-top:15px;
		margin-top:10%;
		 	
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
	.emailbtn{
		margin-left:100%;
		width:100px;
	}
	.emailbox{
		border-right:none;
		border-top:none;
		border-left:none;
		background:#EAEAEA;
		width:100px;
		margin-left : 160%;
		margin-top:-5%;
	}
	
	
	@media(max-width:425px){
		.icon{
			width:350px;
			height:350px;
			margin-left:350px;
			margin-top:150px;
		}
		header{
			width:1000px;
			height:200px;
			font-size:30px;
		}
		.join{
			margin-left:-500px;
			margin-top:550px;
			border-radius:30px;
			width:970px;
			height:1300px;
			font-size:40px;
			font-family:고딕;
		}
		.textbox{
			width:95%;
			height:70px;
			font-size:25px;
			margin-left:6%;
		}
		.table{
			border-spacing:0 30px;
			padding-left:px;
			font-size:40px;
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
		.join_button{
			font-size:40px;
			margin-top:100px;
			width:350px;
			height:100px;	
		}
		.emailbtn{
			margin-top:5%;
			margin-left:5%;
			width:40%;
			height:50px;
			border-radius:15px;
			font-size:20px;
		}
		
		.emailbox{
			font-size:20px;
			align-text:center;
		}
	}
}
	</style>

</head>
<body>
	<header>
		<h1>신라대학교 강의 평가</h1> 
	</header>
	<img src="../img/sillalogo.png" class="icon" width="250" height="250">
	<div>
	<form>
	<fieldset class="join">
      <legend align="center"><h2>회원 가입</h2></legend>
    <table class="table">
    	<tr>
    	<th>이름</th>
    	<td>
    		<input type="text" class="textbox">
    	</td>
    	</tr>
    	<tr>
    	<th>학과</th>
    	<td><select class="textbox"	>
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
    		<input type="text" id="id" class="textbox" >
    	</td>
    	</tr>
    	<tr>
    	<th>비밀번호</th>
    	<td>
    		<input type="password" class="textbox">
    	</td>
    	</tr>	
    	<tr>
    	<th>비밀번호 확인</th>
    	<td>
    		<input type="password" class="textbox">
    	</td>
    	</tr>	
    	<tr>
    	<th>닉네임</th>
    	<td>
    		<input type="text" class="textbox">
    	</td>
    	</tr>
    	<tr>
    	<th>이메일</th>
    	<td>
    		<input type="email" class="textbox" placeholder="이메일 입력">
    	</td>
    	</tr>
    	<tr >
    	<td>
    		<input type="button" value="이메일 인증" class="emailbtn" >
    		<input type="text" class="emailbox" placeholder="인증번호 입력">
    	</td>	     
    	</tr>	 	    	 
    </table>
       	<a href="index.jsp>"><input type="button" value="회원가입" onclick="addInput()" class="join_button"> </a>
    
    </fieldset>
  </form>
    </div>	
	<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
	</footer>
	<script>
	function addInput() {
		  arrInput.push(arrInput.length);
		  arrInputValue.push("");
		  display();
		}
	</script>
</body>
</html>	