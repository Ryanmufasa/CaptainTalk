<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			채팅 대기실에서 채팅방을 생성하거나 생성된 채팅방에 입장할 수 있습니다.<br>
			<a href="/CaptainTalk/waitingRoom.jsp">채팅하러 ㄱㄱ </a>
		</c:if>
		<c:if test="${!check }">
			로그인을 다시 시도해주세요.<br>
			<a href="login.jsp">Login</a>
		</c:if>
	</div>
	
<%@ include file="/layout/footer.jsp" %>