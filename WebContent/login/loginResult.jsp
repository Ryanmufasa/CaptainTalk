<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="classifyroom.classifyroomDAO.ClassifyroomDAO"%>
<%@page import="classifyroom.classifyroomVO.ClassifyroomVO"%>
<%@page import="member.memberVO.MemberVO"%>
<%
	ClassifyroomVO co = new ClassifyroomVO();
	ClassifyroomDAO cao = ClassifyroomDAO.getInstance();

	MemberVO vo = (MemberVO)session.getAttribute("login");
	String lestmember = vo.getMem_id();
	//현재 들어온 사용자가 예기치 못한 프로그램 종료를 당했을 경우를 대비해 채팅방 목록에서 삭제
	cao.outRoom(lestmember);
%>
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