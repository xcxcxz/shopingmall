<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">

			<div class="navbar-header">
				<a class="navbar-brand" href="#">shoping mall</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
          
			<div class="navbar-form navbar-right">
				<div class="form-control">
					<h1>Search area</h1>
				</div>

				<div class="btn btn-success">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${member == null }">
						<a class="btn btn-success" href="/member/login">로그인</a>
						<span><a class="btn btn-success" href="/member/register">회원가입</a></span>
					</c:if>
					<!-- 로그인한 상태 -->
					<c:if test="${ member != null }">
						<div class="login_success_area">
							<span>회원 : ${member.memberName}</span> 
							<span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="#,###.##"/>원</span> 
							<span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" />point</span>
						</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			
			</div>
			<div class="nav nav-justified">
				<h1>navi area</h1>
			</div>
			<section>
			
				<h1>content area</h1>
			</section>
			
		</div>

	</nav>
</body>
</html>