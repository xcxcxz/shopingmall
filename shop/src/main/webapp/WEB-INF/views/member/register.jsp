<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>

<div class="container">
	<form action="">
	<div class="form-signin">
			<h2 class="form-signin-heading">회원가입</h2>
			<label class="sr-only">아이디</label> 
				<input	class="form-control" placeholder="아이디"> 
			<label class="sr-only">비밀번호</label> 
				<input	class="form-control" placeholder="비밀번호"> 
			<label class="sr-only">비밀번호 확인</label> 
				<input	class="form-control" placeholder="비밀번호 확인"> 
			<label class="sr-only">이름</label> 
				<input	class="form-control" placeholder="이름"> 
			<label class="sr-only">이메일</label> 
				<input	class="form-control" placeholder="이메일"> 
			<label class="sr-only">인증번호</label> 
				<input	class="form-control" placeholder="인증번호"> 
			<button type="button" class="btn btn-sm btn-success">인증버노 전송</button>
			
			<label class="sr-only">주소</label> 
				<input	class="form-control" placeholder="우편번호"> 
				<button type="button" class="btn btn-sm btn-success">주소 찾기</button>
			<label class="sr-only"></label> 
				<input	class="form-control" placeholder="주소">
				<input	class="form-control" placeholder="나머지주소"> 
			<button type="button" class="btn btn-lg btn-success">가입하기</button>
		</div>
	</form>
</div>

</body>
</html>