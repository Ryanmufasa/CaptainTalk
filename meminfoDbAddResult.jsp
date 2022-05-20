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
			대기실로 이동<br>
			<a href="../waitingRoom.jsp">대기실</a>
		</c:if>
		<c:if test="${!check }">
			로그인 페이지로 이동<br>
			<a href="../login.jsp">Login</a>
		</c:if>
	</div>
	
	
</body>
</html>
