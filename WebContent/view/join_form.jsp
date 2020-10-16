<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#user_id").blur(function(){
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action=checkid&userid='+user_id,
			type : 'get',
			success : function(data){
				console.log("1=중복/0=중복x"+data);
			}
		});
	});
}); 

	
</script>

	 	
	  

</head>


<body>
	<h1>회원가입</h1>
	<form action='${pageContext.request.contextPath}/lecture-evaluation?action=join' method="POST" >
		이름<input type="text" name="name" required><br>
		닉네임<input type="text" name="nickname" required><br>
		<div class="form-group">
			<label for="user_id"> 아이디</label>
				<input type="text" class="form-control" name="user_id" id="user_id"  required>
		<div class="check_font" id="id_check"></div>
		</div>
		비밀번호<input type="password" name="pwd" required><br>
		비밀번호 확인<input type="password" name="checkpwd" required><br>
		학과<select name="dept" id="dept">
			<option value=""></option>
			<option value="컴퓨터소프트웨어공학부">컴퓨터소프트웨어공학부</option>
		</select><br>
		이메일<input type="text" name="email" required><br>
		<input type="submit" value="회원가입" id="reg_submit" /><br>
	</form>
	
</body>
</html>