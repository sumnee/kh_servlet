<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항 상세 조회</title>
        <link rel="stylesheet" href="/resources/css/notice.css">
        <style>
	        .border-remove {
	        border : 0;
	        }
        </style>
    </head>
    <body>
        <h1>공지사항 상세</h1>
        <ul>
        	<li>
                <label>글번호</label>
                <input type="text" value="${notice.noticeNo }"  class="border-remove" readonly>
                <!-- 이것도 가능 <span readonly>${notice.noticeNo }</span> -->
            </li>
            
            <li>
                <label>작성일</label>
                <input type="text" value="${notice.noticeDate }"  class="border-remove" readonly>
            </li>
            <li>
                <label>글쓴이</label>
                <input type="text" value="${notice.noticeWriter }"  class="border-remove" readonly>
            </li>
            <li>
                <label for="">제목</label>
                <input type="text" value="${notice.noticeSubject }" class="border-remove" readonly>
            </li>
            <li>
                <label for="">내용</label>
                <textarea cols="40" rows="30" readonly class="border-remove">${notice.noticeContent }</textarea>
            </li>
        </ul>
        <a href="/notice/list">목록으로 이동</a>
        <a href="/notice/modify?notice-no=${notice.noticeNo }">수정하기</a>
        <a href="javascript:void(0);" onclick="deleteCheck();">삭제하기</a>
        <script>
            const deleteCheck = () => {
            	var noticeNo = "${notice.noticeNo }";
                if(confirm("정말 삭제하나요?")) {
                    location.href="/notice/remove?notice-no="+noticeNo;
                }
            }
        </script>
    </body>
</html>