<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ������</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#user_id").blur(function(){
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action=checkid&userid='+user_id,
			type : 'get',
			success : function(data){
				console.log("1=�ߺ�/0=�ߺ�x"+data);
			}
		});
	});
}); 

	
</script>

	 	
	  

</head>


<body>
	<h1>ȸ������</h1>
	<form action='${pageContext.request.contextPath}/lecture-evaluation?action=join' method="POST" >
		�̸�<input type="text" name="name" required><br>
		�г���<input type="text" name="nickname" required><br>
		<div class="form-group">
			<label for="user_id"> ���̵�</label>
				<input type="text" class="form-control" name="user_id" id="user_id"  required>
		<div class="check_font" id="id_check"></div>
		</div>
		��й�ȣ<input type="password" name="pwd" required><br>
		��й�ȣ Ȯ��<input type="password" name="checkpwd" required><br>
		�а�<select name="dept" id="dept">
			<option value=""></option>
			<option value="��ǻ�ͼ���Ʈ������к�">��ǻ�ͼ���Ʈ������к�</option>
		</select><br>
		�̸���<input type="text" name="email" required><br>
		<input type="submit" value="ȸ������" id="reg_submit" /><br>
	</form>
	
</body>
</html>