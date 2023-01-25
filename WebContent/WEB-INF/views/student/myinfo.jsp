<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>학생 마이페이지</title>
        <link rel="stylesheet" href="/resources/css/student.css">
    </head>
    <body>
        <h1>학생 상세 정보</h1>
        <div>
            <form action="">
                <fieldset>
                    <legend>학생 정보</legend>
                    <ul id="student-info">
                        <li>
                            <label for="student-id">아이디</label>
                            <input type="text" id="student-id" name="student-id" value="${student.studentId }">
                        </li>
                        <li>
                            <label for="student-pw">비밀번호</label>
                            <input type="password" id="student-pw" name="student-pw" value="${student.studentPw }">
                        </li>
                        <li>
                            <label for="student-name">이름</label>
                            <input type="text" id="student-name" name="student-name" value="${student.studentName }">
                        </li>
                        <li>
                            <label for="student-email">이메일</label>
                            <input type="text" id="student-email" name="student-email" value="${student.studentEmail }">
                        </li>
                        <li>
                            <label for="student-phone">전화번호</label>
                            <input type="text" id="student-phone" name="student-phone" value="${student.studentPhone }">
                        </li>
                        <li>
                            <label for="student-addr">주소</label>
                            <input type="text" id="student-addr" name="student-addr" value="${student.studentAddr }">
                        </li>
                        <li>
                            <label for="student-gender">성별</label>
                            <input type="text" id="student-gender" name="student-gender" value="${student.studentGender }">
                        </li>
                    </ul>
                </fieldset>
                <div>
                    <input type="submit" value="수정하기">
                    <input type="reset" value="초기화">
                </div>
            </form>
        </div>
    </body>
</html>