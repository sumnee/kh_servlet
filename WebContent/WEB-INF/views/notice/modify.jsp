<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항 수정</title>
        <link rel="stylesheet" href="/resources/css/notice.css">
    </head>
    <body>
        <h1>공지사항 수정</h1>
        <form action="/notice/modify" method="post">
         <!-- UPDATE NOTICE_TBL SET NOTICE_SUBJECT = ?, NOTICE_CONTENT = ? WHERE NOTICE_NO = ? -->
        	<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
            <fieldset>
                <legend>공지사항 수정</legend>
                <ul>
                    <li>
                        <label for="">제목</label>
                        <input type="text" value="${notice.noticeSubject }" name="subject">
                    </li>
                    <li>
                        <label for="">내용</label>
                        <textarea cols="40" rows="20" name="content">${notice.noticeContent }</textarea>
                    </li>
                </ul>
            </fieldset>
            <div id="btn-area">
                <input type="submit" value="수정">
                <input type="reset" value="초기화">
            </div>
        </form>
    </body>
</html>