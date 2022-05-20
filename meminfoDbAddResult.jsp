<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			채팅 페이지로 이동<br>
			<a href="../waitingRoom.jsp">채팅 시작</a>
		</c:if>
		<c:if test="${!check }">
			회원정보수정 페이지로 이동<br>
			<a href="joinAdd.jsp">Login</a>
		</c:if>
	</div>
	
	
</body>
</html>