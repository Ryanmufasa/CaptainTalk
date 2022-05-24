<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			대기실로 이동<br>
			<a href="/CaptainTalk/waitingRoom.jsp">대기실</a>
		</c:if>
		<c:if test="${!check }">
			마이페이지로 이동<br>
			<a href="/CaptainTalk/member/myPage.jsp">Login</a>
		</c:if>
	
	</div>

<%@ include file="/layout/footer.jsp"%>
	