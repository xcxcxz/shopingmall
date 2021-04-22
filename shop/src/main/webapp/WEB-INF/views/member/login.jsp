<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>

	<div class="container">

		<div class="form-signin">
			<h2 class="form-signin-heading">로그인</h2>
				
				<form id="login_form" method="post">
				<label class="sr-only">Email address</label> 
				<input	class="form-control" placeholder="Email address" name="memberId"> 
				<label class="sr-only">Password</label>
				<input class="form-control" placeholder="Password" name="memberPw">
				
				<c:if test = "${result == 0 }">
				<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				
            
			
				<button class="btn btn-lg btn-primary btn-block" type="submit" name="로그인버튼">Sign in</button>
				</form>
</div>
</div>
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    
    $("[name=로그인버튼]").click(function(){
    	/* 로그인 메서드 서버 요청 */
    	 $("#login_form").attr("action", "/member/login");
         $("#login_form").submit();
        
    });
 
</script>

</body>
</html>