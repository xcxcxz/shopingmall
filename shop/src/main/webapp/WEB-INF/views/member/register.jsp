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
						class="id_input_re_2">아이디가 이미 존재합니다.</span> 
						<span class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<div class="form-group">
					<label class="sr-only">비밀번호</label> <input type="password"
						class="form-control" name="memberPw" placeholder="비밀번호"> 
						<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div class="form-group">
					<label class="sr-only">비밀번호 확인</label> <input type="password"
						class="form-control" name="memberPwck" placeholder="비밀번호 확인"> 
						<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
						<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                		<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="form-group">
					<label class="sr-only">이름</label> <input class="form-control"
						name="memberName" placeholder="이름"> 
						<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="form-group">
					<label class="sr-only">이메일</label> <input class="form-control"
						name="memberMail" placeholder="이메일"> 
						<span class="final_mail_ck">이메일을 입력해주세요.</span>
				</div>
				<div class="form-inline">
					<div class="form-group">
						<label class="sr-only">인증번호</label> <input class="form-control"
							id="disabledInput" name="인증번호" placeholder="인증번호"
							readonly="readonly"> <input type="button"
							class="btn btn-sm btn-success" value="인증번호전송"></input>
					</div>
					<span id="mail_check_input_box_warn"></span>
				</div>
				<div class="address_wrap">
					<div class="form-inline">
						<div class="form-group">
							<label class="sr-only">주소</label> <input class="form-control"
								name="memberAddr1" placeholder="우편번호" readonly="readonly">
							<input type="button" class="btn btn-sm btn-success" value="주소찾기"
								onclick="execution_daum_address()"></input>

						</div>
					</div>
					<div class="form-group">
						<label class="sr-only"></label> 
						<input class="form-control"	name="memberAddr2" placeholder="주소" disabled="disabled">
					</div>
					<div class="form-group">
						<input class="form-control" name="memberAddr3" placeholder="나머지주소" readonly="readonly">
						<div class="pull-right">
							<input type="button" class="btn btn-lg btn-success" value="가입하기"></input>
						</div>
					</div>
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
		</form>
	</div>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<%@ include file = "plugin/regPlugin.jsp" %>
</body>
</html>