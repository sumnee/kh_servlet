<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>학생 가입</title>
        <link rel="stylesheet" href="/resources/css/student.css">
    </head>
    <body>
        <h1>학생 가입 정보</h1>
        <h3>학생정보를 입력하세요!</h3>
        <div>
            <form action="/member/enrollView.do" method="post">
                <fieldset>
                    <legend>학생 가입 정보</legend>
                    <ul id="student-register">
                        <li>
                            <label for="student-id">아이디</label>
                            <input type="text" id="student-id" name="student-id">
                        </li>
                        <li>
                            <label for="student-pw">비밀번호</label>
                            <input type="password" id="student-pw" name="student-pw">
                        </li>
                        <li>
                            <label for="student-name">이름</label>
                            <input type="text" id="student-name" name="student-name">
                        </li>
                        <li>
                            <label for="student-email">이메일</label>
                            <input type="text" id="student-email" name="student-email">
                        </li>
                        <li>
                            <label for="student-phone">전화번호</label>
                            <input type="text" id="student-phone" name="student-phone">
                        </li>
                        <li>
                            <label for="student-addr">주소</label>
                            <input type="text" id="student-addr" name="student-addr">
                        </li>
                        <li>
                            <label for="student-gender">성별</label>
                            <input type="text" id="student-gender" name="student-gender">
                        </li>
                    </ul>
                </fieldset>
                <div>
                    <input type="submit" value="가입하기">
                    <input type="reset" value="초기화">
                </div>
            </form>
        </div>
    </body>
</html>