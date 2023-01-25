<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그인 성공!</title>
	</head>
	<body>
	<!-- 세션을 사용해서 이 파일 사용 안하게됨 -->
		<h1>로그인성공!</h1>
		<b>${memberId }</b>님 환영합니다 <br>
		<input type="hidden" id="member-id" value="${memberId }">
		<!-- 스크립트 영역에서 달러표시(주석에 적으면 오류남) 쓸 수 없으니까 input태그 이용 -->
		<hr>
		<a href="/member/myinfo.kh?member-id=${memberId }">마이페이지</a><br>
		<a href="/notice/write">공지사항 작성</a>
		<a href="javascript:void(0);" onclick="removeCheck();">회원탈퇴</a>
		<!-- javascript:void(0) a태그의 링크기능 무효화 -->
		<script>
			function removeCheck() {
				if(confirm("탈퇴를 진행하겠습니까?")) {
					var memberId = document.querySelector("#member-id").value;
					location.href = "/member/remove.kh?member-id="+memberId;

					// 다른방법으로
					// var memberId = "${memberId }";
					// location.href = "/member/remove.kh?member-id="+memberId;
					// 하면 input태그 안만들고 바로 가능하나 비추천 방법
				}
			}
		</script>
	</body>
</html>

<!-- 
	Web-INF 폴더에 넣으면 주소 숨길 수 있음
	주소 쳐도 그 페이지 못들어옴(직접 접근 불가능)
	request 통해 접근해야함
	
	직접 접근 : WebContent 안에 넣기
-->

