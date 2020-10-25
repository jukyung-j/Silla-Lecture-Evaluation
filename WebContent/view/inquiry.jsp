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
	<h1>강의 평</h1>
	${lec_name }<br>
	${p_name }<br>
	<c:if test="${eval_list==null }">
			최근 강의 평이 없습니다.
			<button onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main?action=add_eval&lec_name=${lec_name }&p_name=${p_name }'">글쓰기</button>
	</c:if>
</body>
</html>