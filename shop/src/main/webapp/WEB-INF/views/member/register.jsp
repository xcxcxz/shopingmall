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
				<label class="sr-only">아이디</label> <input class="form-control"
					name="memberId" placeholder="아이디"> <span
					class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
					class="id_input_re_2">아이디가 이미 존재합니다.</span> <label class="sr-only">비밀번호</label>
				<input class="form-control" name="memberPw" placeholder="비밀번호">
				<label class="sr-only">비밀번호 확인</label> <input class="form-control"
					placeholder="비밀번호 확인"> <label class="sr-only">이름</label> <input
					class="form-control" name="memberName" placeholder="이름"> <label
					class="sr-only">이메일</label> <input class="form-control"
					name="memberMail" placeholder="이메일"> <label class="sr-only">인증번호</label>
				<input class="form-control" placeholder="인증번호">
				<button type="button" class="btn btn-sm btn-success">인증버노
					전송</button>

				<label class="sr-only">주소</label> <input class="form-control"
					name="memberAddr1" placeholder="우편번호">
				<button type="button" class="btn btn-sm btn-success">주소 찾기</button>
				<label class="sr-only"></label> <input class="form-control"
					name="memberAddr2" placeholder="주소"> <input
					class="form-control" name="memberAddr3" placeholder="나머지주소">
				<input type="button" class="btn btn-lg btn-success" value="가입하기"></input>
			</div>
		</form>
	</div>
	<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$('[value="가입하기"]').click(function(){
		$("#regestr_form").attr("action", "/member/register");
		$("#regestr_form").submit();
	});
});
//아이디 중복검사
$("input[name=memberId]").on("propertychange change keyup paste input", function(){

	var memberId = $("input[name=memberId]").val();			// .id_input에 입력되는 값
	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");				
			}else{
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");				
			}
		} //success 종료
	}); // ajax 종료
});
</script>
</body>
</html>