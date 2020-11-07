<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의 평</h1>
	${lec_name}<br>
	${p_name}<br>
	별점 평균 : <fmt:formatNumber value="${avg_star}" type="number" /><br>
	<button onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main?action=add_eval&lec_name=${lec_name}&p_name=${p_name}'">글쓰기</button>
	<c:if test="${eval_list==null}">
			최근 강의 평이 없습니다.
	</c:if>
	<c:if test="${eval_list!=null}">
		<c:forEach var="eval" items="${eval_list}" >
			<table border="1">
				<tr>
					<td>별점:${eval.star}</td>
				</tr>
				<tr>
					<td>날짜:${eval.todate}</td>
				</tr>
				<tr>
					<td>내용:${eval.content}</td>
				</tr>
			</table>
			<br>
		</c:forEach>
	</c:if>
	<c:if test="${nick eq '관리자'}">
		<button id="btn" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/admin'">관리자 메인 페이지 가기</button>
	</c:if>
	<c:if test="${nick != '관리자'}">
		<button id="btn" onclick="location.href='${pageContext.request.contextPath}/lecture-evaluation/main'">메인 페이지 가기</button>
	</c:if>
</body>
</html>