<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			메인 페이지로...<br>
			<a href="/CaptainTalk/waitingRoom.jsp">채팅하러 ㄱㄱ </a>
		</c:if>
		<c:if test="${!check }">
			로그인 페이지로....<br>
			<a href="./login/login.jsp">Login</a>
		</c:if>
	</div>
	
<%@ include file="/layout/footer.jsp" %>