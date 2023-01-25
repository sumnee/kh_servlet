<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나이스 멤버 웹</title>
		<link rel="stylesheet" href="/resources/css/index.css">
	</head>
	<body>
	<c:if test="${sessionScope.memberId eq null }">
		<h1>나이스 멤버 웹!</h1>
		<div id="container">
			<h2>로그인 페이지</h2>
			<fieldset>
				<legend>로그인</legend>
				<form action="/member/login.kh" method="post">
					<input type="text" name="member-id" placeholder="ID"> <br>
					<input type="password" name="member-pw" placeholder="PW"> <br>
					<div id="login-area">
						<input type="submit" value="로그인">
						<input type="reset" value="취소">
					</div>
				</form>
			</fieldset>
			<span><a href="/member/enrollView.kh">회원가입</a></span>
		</div>
	</c:if>
	<c:if test="${sessionScope.memberId ne null }">
		<span><b>${sessionScope.memberId }</b></span>님 환영합니다 <br>
		<input type="hidden" id="member-id" value="${sessionScope.memberId }">
		<hr>
		<a href="/member/myinfo.kh?member-id=${sessionScope.memberId }">마이페이지</a><br>
		<a href="/notice/write">공지사항 작성</a><br>
		<a href="/member/logout.kh">로그아웃</a><br>
		<a href="javascript:void(0);" onclick="removeCheck();">회원탈퇴</a>
	</c:if>
	<script>
		function removeCheck() {
			if(confirm("탈퇴를 진행하겠습니까?")) {
				var memberId = document.querySelector("#member-id").value;
				location.href = "/member/remove.kh?member-id="+memberId;
			}
		}
	</script>
	</body>
</html>

	<!-- JSP <=> controller 같이 보면 오류 잡기 쉬움 -->
