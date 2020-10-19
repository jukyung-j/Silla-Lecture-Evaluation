<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<style>
		table{
			text-align:right;
			padding:10px;
		}
		body{
			padding-top:200px;
			text-align:center;
			width:50%;
			margin:0 auto; 
			
		}
	</style>
</head>
<body align="center">
<c:if test="${message==false}" >
	<script>
		alert("아이디나 비밀번호를 다시 입력해주세요.");
	</script>
</c:if> 
	<h1>로그인 페이지</h1><hr>
	<form action='?action=login' method="POST">
		<table align="center">
			<tr>
				<td>아이디:</td><td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td><br>비밀번호:</td><td><br><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<td><br><input type="submit" value="로그인" /></td>
				<td><br><input type="button" value="회원가입 " onclick=
					"location.href='${pageContext.request.contextPath}/lecture-evaluation/join_form'"/></td>
			</tr>
		</table>
	</form>
</body>
</html>