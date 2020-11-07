<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의평 쓰기</h1>

	${lec_name}<br>
	${p_name}<br>
	<form action='${pageContext.request.contextPath}/lecture-evaluation/main?action=insert_eval' method="POST">
		강의<input type="text" name="lec_name" value="${lec_name}"><br>
		교수<input type="text" name="p_name" value="${p_name}"><br>
		별점<input type="number" name="star"><br>
		내용<textarea name="content"></textarea><br>
		<input type="submit">
	</form>
</body>
</html>