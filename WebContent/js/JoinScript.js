window.onload = function(){
	$("#e_code").attr("disabled",true);
	$("#code_btn").attr("disabled",true);
	$("#reg_submit").attr("disabled",true);
	
	function check_ajax(url,id,user,$check,J){		// ajax 함수
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action='+url+'&'+id+'='+user,
			type : 'get',
			success : function(data){
				console.log("data:"+data);
				if(data == 1){	// 중복
					$check.text("사용중입니다.");
					$check.css("color","red");
				} else{
					if(J.test(user)){	// 길이, 문자열 검사
						$check.text("사용 가능합니다.");
						$check.css('color','blue');
					} else {
						$check.text("다시 입력해주세요.");
						$check.css('color','red');
					}
				}
			}, error : function(){
				console.log("실패");
			}
		});
	}
	$("#user_id").blur(function(){		
		var user_id = $('#user_id').val();
		check_ajax('checkid','userid',user_id,$("#id_check"),idJ);
	});
	$('#user_nick').blur(function(){
		var user_nick = $('#user_nick').val();
		check_ajax('checknick','nick',user_nick,$("#nick_check"),nickJ);
	});
	$('#user_pw').blur(function(){		// 비밀번호 정규식
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
	$("#check_mail").click(function(){			// 이메일 정규식
		if(mailJ.test($("#user_email").val())){		// 이메일 인증번호 발송
			$("#e_code").attr("disabled",false);
			$("#reg_submit").attr("disabled",false);
			$("#code_btn").attr("disabled",false);
		} else{
			alert("sillain.ac.kr로 입력해주세요.");
			$("#reg_submit").attr("disabled",true);
		}
		
	});
} 