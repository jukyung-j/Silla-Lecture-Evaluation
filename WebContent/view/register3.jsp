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
	<h1>강의 등록</h1>
	<form action='${pageContext.request.contextPath}/lecture-evaluation/main?action=register' method="POST">
		강의명<input type="text" name="lec_name" required><br>
		교수명<input type="text" name="p_name" required><br>
		강의 해당 학 과
		<c:import url="http://localhost:8080/sillauv/view/dept.jsp" /><br>
		<input type="submit">
	</form>

</body>
</html>