<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>마이페이지</title>
        <link rel="stylesheet" href="/resources/css/member.css">
    </head>
    <body>
        <h1>마이페이지</h1>
        <div>
            <form action="/member/update.kh" method="post">
                <fieldset>
                    <legend>회원 상세 정보</legend>
                    <ul id="member-info">
                        <li>
                            <label for="member-id">아이디</label>
                            <input type="text" id="member-id" name="member-id" value="${member.memberId }" readonly>
                            <!-- 
	                            readonly 아이디는 수정 못하게!
	                            세션은 보안이 약해서 최소한의 정보만 저장하는게 좋음
                             -->
                        </li>          
                        <li>
                            <label for="member-pw">비밀번호</label>
                            <input type="password" id="member-pw" name="member-pw" value="${member.memberPw }">
                        </li>
                        <li>
                            <label for="member-name">이름</label>
                            <input type="text" id="member-name" name="member-name" value="${member.memberName }" readonly>
                        </li>
                        <li>
                            <label for="age">나이</label>
                            <input type="text" id="age" name="member-age" value="${member.memberAge }" readonly>
                        </li>
                        <li>
                            <label for="email">이메일</label>
                            <input type="text" id="email" name="member-email" value="${member.memberEmail }">
                        </li>
                        <li>
                            <label for="phone">전화번호</label>
                            <input type="text" id="phone" name="member-phone" value="${member.memberPhone }">
                        </li>
                        <li>
                            <label for="address">주소</label>
                            <input type="text" id="address" name="member-address" value="${member.memberAddress }">
                        </li>
                        <li>
                            <label for="gender">성별</label>
                                              
                           	   
                            
                            <c:if test="${member.memberGender eq 'F' }">
		                    여 <input type="radio" id="gender" name="member-gender" value="F" checked>
		                    남 <input type="radio" id="gender" name="member-gender" value="M" disabled>
		                    </c:if>	
		                    <c:if test="${member.memberGender eq 'M' }">
		                    여 <input type="radio" id="gender" name="member-gender" value="F" disabled>
		                    남 <input type="radio" id="gender" name="member-gender" value="M" checked>
		                    </c:if>	
                       	
<%--                  if문으로 전체 input태그를 감싸면 단순 보여주기(위), check만 감싸면 수정 가능!(아래)
                      남 <input type="radio" name="member-gender" value="M" <c:if test="${member.memberGender eq 'M' }">checked</c:if>>
                      여 <input type="radio" id="gender" name="member-gender" value="F" <c:if test="${member.memberGender eq 'F' }">checked</c:if>>	
--%>
                       
                        </li>
                        <li>
                            <label for="hobby">취미</label>
                            <input type="text" id="hobby" name="member-hobby" value="${member.memberHobby }">
                        </li>
                        <li>
                            <label for="m-date">가입날짜</label>
                            <input type="text" id="m-date" value="${member.memberDate }" readonly>
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