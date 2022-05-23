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
	
	//ChatVO vo = new ChatVO();
	ChatDAO dao = ChatDAO.getInstance();

	String room = dao.get_name(name);
	
	System.out.println("logout페이지 name : "+name);
	System.out.println("logout페이지 room : "+room);
	
	//vo.setChr_name(room);
	
	dao.out_room(room,name); //채팅방에서 현재 사용자 제거
	dao.delete_room(); //채팅방에 사용자 0명일 시 채팅방 제거
	pageContext.forward("../index.jsp");//index.jsp로 이동
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>