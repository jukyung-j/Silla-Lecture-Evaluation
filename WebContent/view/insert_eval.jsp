<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		height:800px;
		margin-left:25%;
		margin-top:5%;
	}
	.re{
		font-size:20px;
		margin-left:10%;
		border-spacing:0 10px;
		
	}
	.small{
		margin-left:5%;
		width:600px;
		height:30px;
	}
	.big{
		margin-left:5%;
		width:600px;
		height:400px;
		word-break:break-all;
	}
	.rebutton{
		width:300px;
		height:40px;
		margin-top:10%;
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
	
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('../img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	.star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

	
	@media(max-width:425px){
		header{
			width:1000px;
			height:200px;
			font-size:30px;
			padding-top:20px;	
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
		}	
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
     <legend align="center"><h2>강의평가 등록</h2></legend>
	<form action='${pageContext.request.contextPath}/lecture-evaluation/main?action=insert_eval' method="POST">
		<table class="re">
		<tr>
		<th> 강의명 </th>
			<td><input type="text" class="small" name="lec_name" value="${lec_name}" readonly></td>	
		</tr>
		<tr>
		<th> 교수명 </th>
			<td><input type="text" class="small" name="p_name" value="${p_name}" readonly></td>
		</tr>
		<span class="star-input">
		<span class="input">
	    	<input type="radio" name="star" value="1" id="p1" required>
	    	<label for="p1">1</label>
	    	<input type="radio" name="star" value="2" id="p2">
	    	<label for="p2">2</label>
	    	<input type="radio" name="star" value="3" id="p3">
	    	<label for="p3">3</label>
	    	<input type="radio" name="star" value="4" id="p4">
	    	<label for="p4">4</label>
	    	<input type="radio" name="star" value="5" id="p5">
	    	<label for="p5">5</label>
	  	</span>
	  	<output for="star-input"><b>0</b>점</output>						
		</span>
		<tr>
		<th>평가내용</th>
			<td><textarea class="big" name="content" required></textarea></td>
		</tr>
		</table>
		<input type="submit" value="등록" class="rebutton">
	</form>
	
</fieldset>

<footer class="footer" align="center">
		201795025 김유진 / 201795081 정주경
	</footer>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/star.js"></script>
</body>
</html>