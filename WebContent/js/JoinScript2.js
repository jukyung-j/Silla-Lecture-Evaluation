$(document).ready(function(){
	$("#user_id").blur(function(){		
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action=checkid&userid='+user_id,
			type : 'get',
			success : function(data){
				console.log("data:"+data);
				if(data == 1){	// 아이디 중복
					$("#id_check").text("아이디가 사용중입니다.");
					$("#id_check").css("color","red");
					$("#reg_submit").attr("disabled",true);
				} else{
					if(idJ.test(user_id)){	// 아이디 길이, 문자열 검사
						$("#id_check").text("사용 가능한 아이디입니다.");
						$("#id_check").css('color','blue');
						$("#reg_submit").attr("disabled",false);
					} else {
						$("#id_check").text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
						$("#id_check").css('color','red');
						$("#reg_submit").attr("disabled",true);
					}
				}
			}, error : function(){
				console.log("실패");
			}
		});
	});
	$('#user_pw').blur(function(){
		if(pwJ.test($('#user_pw').val())){
			console.log("true");
			$("#pw_check").text("");
		} else{
			console.log("false");
			$("#pw_check").text("숫자와 문자포함 6~12자리 입력");
			$("#pw_check").css('color','red');
		}
	});
	$("#user_pw2").blur(function(){
		if($("#user_pw").val() != $(this).val()){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
			$("#pw2_check").css('color','red');
		}else{
			$("#pw2_check").text("");
		}
	});
	$("#check_mail").click(function(){		
		if(mailJ.test($("#user_email").val())){		// 이메일 정규식
			
		} else{
			alert("sillain.ac.kr로 입력해주세요.");
		}
		
	});
}); 