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
			메인 페이지로...<br>
			<a href="main.jsp">채팅하러 ㄱㄱ </a>
		</c:if>
		<c:if test="${!check }">
			로그인 페이지로....<br>
			<a href="login.jsp">Login</a>
		</c:if>
	</div>
	
	
</body>
</html>