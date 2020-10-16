<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sillauv_lecture_evaluation.SillaDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>

<script>

</script>
<body>
	<h1>회원가입</h1>
	<form action='${pageContext.request.contextPath}/lecture-evaluation?action=join' method="POST"
		name="joinform">
		이름<input type="text" name="name"><br>
		닉네임<input type="text" name="nickname"><br>
		아이디<input type="text" name="id" check_result="fail" required>
		<input type="button" value="확인"  class="id_overlap_button" onclick="id_overlap_check()"/><br>
		비밀번호<input type="password" name="pwd"><br>
		비밀번호 확인<input type="password" name="pwd2"><br>
		학과<select name="dept" id="dept">
			<option value=""></option>
			<option value="컴퓨터소프트웨어공학부">컴퓨터소프트웨어공학부</option>
		</select><br>
		이메일<input type="text" name="email"><br>
		<input type="submit" value="회원가입" ><br>
	</form>
</body>
</html>