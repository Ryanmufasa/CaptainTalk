<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="chat.chatDAO.ChatDAO"%>
<%@page import="chat.chatVO.ChatVO"%>
<%@page import="member.memberVO.MemberVO"%>
<%@page session="true"%>
<% request.setCharacterEncoding("UTF-8");

	MemberVO voo = (MemberVO)session.getAttribute("login");
	String name = voo.getMem_id();
	String room = request.getParameter("room");
	
	ChatVO vo = new ChatVO();
	
	vo.setChr_name(room);
	vo.setChr_mem(name);
	
	ChatDAO dao = ChatDAO.getInstance();
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
			<form method="get">
				<a href="../waitingRoom.jsp">대기실로 이동</a> &nbsp;&nbsp;
				<a href="../main.jsp?room=<%=room%>">생성한 채팅방으로 이동</a>
			</form>
		</c:if>
		<c:if test="${!check }">
			<form>
				<a href="../waitingRoom.jsp">대기실로 이동</a>
			</form>	
		</c:if>
	</div>

</body>
</html>