window.onload = function(){
	var idJ = /^[a-z0-9]{4,12}$/;	// 아이디 정규식
	var nickJ = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/; 	// 닉네임 정규식
	var pwJ = /^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;		// 비밀번호 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@sillain.ac.kr$/;		// 이메일 정규식	
	var join=[1,1,1,1,1]	// 입력확인 5개
	
	$("#e_code").attr("disabled",true);
	$("#code_btn").attr("disabled",true);
	$("#reg_submit").attr("disabled",true);
	
	function check_ajax(id,user,$check,J,index){		// 아이디와 닉네임 중복 확인을 위한 함수
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action=overlapping_check&'+id+'='+user,
			type : 'get',
			success : function(data){
				console.log("data:"+data);
				if(data == 1){	// 중복
					$check.text("사용중입니다.");
					$check.css("color","red");
					join[index]=1;
					
				} else{
					if(J.test(user)){	// 길이, 문자열 검사
						$check.text("사용 가능합니다.");
						$check.css('color','blue');
						join[index]=0;
					} else {
						$check.text("다시 입력해주세요.");
						$check.css('color','red');
						$("#reg_submit").attr("disabled",true);
						join[index]=1;
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
			url  : 'mailsend?action=send_mail&usermail='+user_mail,
			type : 'get',
			success : function(data) {
				console.log("key:"+data);
				$("#code_btn").attr("disabled",false);
				$("#code_btn").click(function(){
					var ecode = $("#e_code").val();
					console.log(ecode);
					if(data==ecode){	// 인증번호 맞게 입력
						$("#code_check").text("인증에 성공하셨습니다.");
						$("#code_check").css('color','blue');
						$("#reg_submit").attr("disabled",false);
						join[4]=0;
					}
					else{				// 인증번호 실패
						$("#code_check").text("인증에 실패하셨습니다. 다시입력해 주세요.");
						$("#code_check").css('color','red');
						$("#reg_submit").attr("disabled",true);
						join[4]=1;
					}
				});
				
			}, error:function(){
					console.log("중복체크");
		       }

		});
	}
	
	$("#user_id").blur(function(){		// 아이디 입력시
		var user_id = $('#user_id').val();
		check_ajax('userid',user_id,$("#id_check"),idJ,0);
	});
	$('#user_nick').blur(function(){	// 닉네임 입력시
		var user_nick = $('#user_nick').val();
		check_ajax('usernick',user_nick,$("#nick_check"),nickJ,1);
	});
	$('#user_pw').blur(function(){		// 비밀번호 정규식
		if(pwJ.test($('#user_pw').val())){
			console.log("true");
			$("#pw_check").text("");
			join[2]=0;
		} else{
			console.log("false");
			$("#pw_check").text("숫자와 문자포함 6~12자리 입력");
			$("#pw_check").css('color','red');
			join[2]=1;
		}
	});
	$("#user_pw2").blur(function(){		// 비밀번호 확인 체크
		if($("#user_pw").val() != $(this).val()){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
			$("#pw2_check").css('color','red');
			join[3]=1;
		}else{
			$("#pw2_check").text("");
			join[3]=0;
		}
	});
	$("#check_mail").click(function(){			// 인증번호 발송 버튼 클릭
		if(mailJ.test($("#user_email").val())){		// 이메일 정규식 검사
			send_mail();
			$("#e_code").attr("disabled",false);
			
		} else{
			alert("sillain.ac.kr로 입력해주세요.");
			$("#reg_submit").attr("disabled",true);
			join[4]=1;
		}
	});
	$("#reg_submit").click(function(){
		for(var i=0; i<5;i++){
			if(join[i]==1){
				alert("다시 입력해주세요");
				return false;
			}
		}
	});
} 