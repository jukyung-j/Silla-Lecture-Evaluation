window.onload = function(){
	var idJ = /^[a-z0-9]{4,12}$/;	// 아이디 정규식
	var nickJ = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/; 	// 닉네임 정규식
	var pwJ = /^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;		// 비밀번호 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@sillain.ac.kr$/;		// 이메일 정규식	
	
	$("#e_code").attr("disabled",true);
	$("#code_btn").attr("disabled",true);
	$("#reg_submit").attr("disabled",true);
	
	function check_ajax(id,user,$check,J){		// 아이디와 닉네임 중복 확인을 위한 함수
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action=overlapping_check&'+id+'='+user,
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
				console.log("중복체크실패");
			}
		});
	}
	function send_mail(){		// 이메일 인증 보내기
		var user_mail = $("#user_email").val();
		$.ajax({
			url : 'mailsend?action=send_mail&usermail='+user_mail,
			type: 'get',
			success : function(data){
				console.log(data);
			}, error : function(){
				console.log("메일실패");
			}
		});
	}
	
	$("#user_id").blur(function(){		// 아이디 입력시
		var user_id = $('#user_id').val();
		check_ajax('userid',user_id,$("#id_check"),idJ);
	});
	$('#user_nick').blur(function(){	// 닉네임 입력시
		var user_nick = $('#user_nick').val();
		check_ajax('usernick',user_nick,$("#nick_check"),nickJ);
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
	$("#user_pw2").blur(function(){		// 비밀번호 확인 체크
		if($("#user_pw").val() != $(this).val()){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
			$("#pw2_check").css('color','red');
		}else{
			$("#pw2_check").text("");
		}
	});
	$("#check_mail").click(function(){			// 인증번호 발송 버튼 클릭
		if(mailJ.test($("#user_email").val())){		// 이메일 정규식 검사
			send_mail();
			$("#e_code").attr("disabled",false);
			$("#reg_submit").attr("disabled",false);
		} else{
			alert("sillain.ac.kr로 입력해주세요.");
			$("#reg_submit").attr("disabled",true);
		}
		
	});
} 