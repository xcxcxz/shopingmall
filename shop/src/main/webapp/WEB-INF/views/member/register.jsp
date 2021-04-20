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
						<input class="form-control"	id="disabledInput" name="인증번호" placeholder="인증번호" readonly="readonly">
						<input type="button" class="btn btn-sm btn-success" value="인증번호전송"></input>
					</div>
					<span id="mail_check_input_box_warn"></span>
				</div>
				<div class="form-inline">
					<div class="form-group">
						<label class="sr-only">주소</label> <input class="form-control"
							name="memberAddr1" placeholder="우편번호" readonly="readonly">
						<input type="button" class="btn btn-sm btn-success" value="주소찾기" onclick="execution_daum_address()"></input>
							
					</div>
				</div>
				<div class="form-group">
					<label class="sr-only"></label> <input class="form-control"
						name="memberAddr2" placeholder="주소" disabled="disabled">
				</div>
				<div class="form-group">
					<input class="form-control" name="memberAddr3" placeholder="나머지주소" readonly="readonly">
					<div class="pull-right">
						<input type="button" class="btn btn-lg btn-success" value="가입하기"></input>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		

		 
		/* 다음 주소 연동 */
		function execution_daum_address(){
		 
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                   		addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               $("[name=memberAddr1]").val(data.zonecode);    // 대체가능
		           $("[name=memberAddr2]").val(addr)
	                // 커서를 상세주소 필드로 이동한다.
		           $("[name=memberAddr3]").attr("readonly",false);
		            $("[name=memberAddr3]").focus();
	            }
		    }).open();    
		 
		}
	</script>
</body>
</html>