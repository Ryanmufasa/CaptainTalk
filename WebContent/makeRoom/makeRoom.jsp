<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="chat.chatDAO.ChatDAO"%>
    <%@page import="chat.chatVO.ChatVO"%>
    <%@page import="member.memberVO.MemberVO"%>
	<%@page session="true"%>
<%

	request.setCharacterEncoding("UTF-8");

	MemberVO voo = (MemberVO)session.getAttribute("login");
	String name = voo.getMem_id();
	String room = request.getParameter("room");
	
	ChatVO vo = new ChatVO();
	
	vo.setChr_name(room);
	vo.setChr_mem(name);
	
	ChatDAO dao = ChatDAO.getInstance();
	
	
	boolean result = false;
	String msg = null;
	
	result = dao.make_room(room, name);
	
	if(result==true) {
		msg = vo.getChr_name() + "채팅방을 개설하였습니다.";
	} 
	else {
		msg = "중복된 채팅방 이름입니다.";
	}
	
	request.setAttribute("room", room);
	request.setAttribute("check", result);
	request.setAttribute("msg", msg);
	
	pageContext.forward("makeRoomResult.jsp");
	
%>
