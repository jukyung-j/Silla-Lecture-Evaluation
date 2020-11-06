<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정</title>
</head>
<body>
	<h1>강의평 수정</h1>

	${lec_name}<br>
	${p_name}<br>
	<form action='${pageContext.request.contextPath}/lecture-evaluation/admin?action=update' method="POST">
		index:<input type="text" name="idx" value="${lecture.idx}" readonly><br>
		강의<input type="text" name="lec_name" value="${lecture.lec_name}"><br>
		교수<input type="text" name="p_name" value="${lecture.p_name}"><br>
		별점<input type="number" name="star" value="${lecture.star}"><br>
		내용<textarea name="content" >${lecture.content}</textarea><br>
		<input type="submit">
	</form>
</body>
</html>