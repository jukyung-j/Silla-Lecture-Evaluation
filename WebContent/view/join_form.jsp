<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sillauv_lecture_evaluation.SillaDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>

<script>

</script>
<body>
	<h1>ȸ������</h1>
	<form action='${pageContext.request.contextPath}/lecture-evaluation?action=join' method="POST"
		name="joinform">
		�̸�<input type="text" name="name"><br>
		�г���<input type="text" name="nickname"><br>
		���̵�<input type="text" name="id" check_result="fail" required>
		<input type="button" value="Ȯ��"  class="id_overlap_button" onclick="id_overlap_check()"/><br>
		��й�ȣ<input type="password" name="pwd"><br>
		��й�ȣ Ȯ��<input type="password" name="pwd2"><br>
		�а�<select name="dept" id="dept">
			<option value=""></option>
			<option value="��ǻ�ͼ���Ʈ������к�">��ǻ�ͼ���Ʈ������к�</option>
		</select><br>
		�̸���<input type="text" name="email"><br>
		<input type="submit" value="ȸ������" ><br>
	</form>
</body>
</html>