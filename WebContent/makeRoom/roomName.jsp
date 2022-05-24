<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>알려드립니다</title>
</head>
<body>
	<center>
		<form action="makeRoom.jsp" method="post">
			채팅방 이름 : <input type="text" name="room">
			<input type="submit" value="생성">
		</form>
	<!-- <div onclick="self.close()">닫기</div> -->
	</center>
</body>
</html>
