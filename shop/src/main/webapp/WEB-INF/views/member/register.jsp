<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		<form action="" id="regestr_form" method="post">
			<div class="form-signin">
				<h2 class="form-signin-heading">회원가입</h2>
				<div class="form-group">
					<label class="sr-only">아이디</label> <input class="form-control"
						name="memberId" placeholder="아이디"> <span
						class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
						class="id_input_re_2">아이디가 이미 존재합니다.</span> <label class="sr-only">비밀번호</label>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="memberPw"
						placeholder="비밀번호">
				</div>
				<div class="form-group">
					<label class="sr-only">비밀번호 확인</label> <input type="password"
						class="form-control" placeholder="비밀번호 확인">
				</div>
				<div class="form-group">
					<label class="sr-only">이름</label> <input class="form-control"
						name="memberName" placeholder="이름">
				</div>
				<div class="form-group">
					<label class="sr-only">이메일</label> <input class="form-control"
						name="memberMail" placeholder="이메일">
				</div>
				<div class="form-inline">
					<div class="form-group">
						<label class="sr-only">인증번호</label> 
						<input class="form-control"	id="disabledInput" name="인증번호" placeholder="인증번호" disabled="disabled">
						<input type="button" class="btn btn-sm btn-success" value="인증번호전송"></input>
					</div>
					<span id="mail_check_input_box_warn"></span>
				</div>
				<div class="form-inline">
					<div class="form-group">
						<label class="sr-only">주소</label> <input class="form-control"
							name="memberAddr1" placeholder="우편번호">
						<button type="button" class="btn btn-sm btn-success">주소
							찾기</button>
					</div>
				</div>
				<div class="form-group">
					<label class="sr-only"></label> <input class="form-control"
						name="memberAddr2" placeholder="주소">
				</div>
				<div class="form-group">
					<input class="form-control" name="memberAddr3" placeholder="나머지주소">
					<div class="pull-right">
						<input type="button" class="btn btn-lg btn-success" value="가입하기"></input>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
	var code = "";                //이메일전송 인증번호 저장위한 코드
		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$('[value="가입하기"]').click(function() {
				$("#regestr_form").attr("action", "/member/register");
				$("#regestr_form").submit();
			});
		});
		//아이디 중복검사
		$("input[name=memberId]").on(
				"propertychange change keyup paste input",
				function() {

					var memberId = $("input[name=memberId]").val(); // memberId에 입력되는 값
					var data = {
						memberId : memberId
					} // '컨트롤에 넘길 데이터 이름' : '데이터(memberId에 입력되는 값)'

					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result) {
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
							}
						} //success 종료
					}); // ajax 종료
				});
		/* 인증번호 이메일 전송 */
		$('[value="인증번호전송"]').click(function() {
			  var email = $('input[name=memberMail]').val();        // 입력한 이메일
			  var checkBox = $("input[name=인증번호]") ;
			  var boxWrap = $("input[name=인증번호]")
			    $.ajax({
			        
			        type:"GET",
			        url:"mailCheck?email=" + email,
			        success:function(data){
			        	
			        	checkBox.attr("disabled", false);
			        	code = data;
			        }
			    });
		});

		 
		/* 인증번호 비교 */
		$("input[name=인증번호]").blur(function(){
		    
			var inputCode = $("input[name=인증번호]").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 
		    
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");        
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    }    
		    
		});
	</script>
</body>
</html>