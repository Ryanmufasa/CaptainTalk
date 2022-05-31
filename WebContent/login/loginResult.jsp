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
			<a href="../waitingRoom.jsp"><h3>대기실로 이동</h3></a>
		</c:if>
		<c:if test="${!check }">
			<a href="login.jsp"><h3>Login 페이지로<h3></a>
		</c:if>
	</div>

</body>
</html>