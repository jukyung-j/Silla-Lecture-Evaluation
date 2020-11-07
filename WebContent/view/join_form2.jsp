<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<body>
	<h1>회원가입</h1>
	<form action='${pageContext.request.contextPath}/lecture-evaluation?action=join' method="POST" >
		이름<input type="text" name="name" required><br>
		<label for="user_nick">닉네임</label>
			<input type="text" name="nickname" id="user_nick" required><br>
			<div id="nick_check"></div>
		<label for="user_id"> 아이디</label>
			<input type="text" class="form-control" name="user_id" id="user_id"  required>
			<div class="check_font" id="id_check"></div>
		<label for="user_pw">비밀번호</label>
			<input type="password" name="pwd" id="user_pw" required><br>
			<div id="pw_check"></div>
		<label for="user_pw2">비밀번호 확인</label>
			<input type="password" id="user_pw2" required><br>
			<div id="pw2_check"></div>
			
	학과<c:import url="http://localhost:8080/sillauv/view/dept.jsp" />
			
		<br>
		<label for="user_email">이메일</label>
			<input type="text" name="email" id="user_email" value="@sillain.ac.kr" required /> 
			<a href="http://outlook.com/sillain.ac.kr" target="_blank">이메일</a>
			<input type="button" value="인증번호 전송" id="check_mail" /><br>
			<input type="text" name="verifi" id="e_code" ><input type="button" value="확인" id="code_btn"><br>
			<div id="code_check"></div>
		<input type="submit" value="회원가입" id="reg_submit" ></form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/JoinScript.js"> </script>
</body>
</html>