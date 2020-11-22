<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
<div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">수업명${dept_list.lec_name} 교수명${dept_list.p_name}</div>
  <div class="card-body">
    <h4 class="card-title">${nick} 님의 의견</h4>
    <p class="card-text">${dept_list.content}ㅇㅇㅇ</p>
  </div>
</div>


</body>
</html>