<%@page import="java.util.List"%>
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
	
	ChatVO ch = new ChatVO();
	ChatDAO dao = ChatDAO.getInstance();
	
	List<ChatVO> list = dao.selectAll();
	
	
	//버튼 열 길이 변수 생성
	int button_width = 0;
	
	// 채팅방 이름을 입력받을 변수 선언
	String roomName = "";
		 
	//list 객체가 null일 때 width=300
	//list객체가 null이 아닐 때 width=200
	if(list==null) { 
		button_width = 300; } 
	else { 
		button_width = 200; }
	
	//행 갯수 변수
	int size = 0;
	
	if(list!=null){
		size = list.size();
	} else {
		size = 1;
	}
	//채팅방 갯수, 갯수가 0이면 테이블 생성을 위해 1로 임의 설정헌다.
	
	//ChatVO의 채팅방 이름들을 입력받기 위해 room배열을 만든다
	String room[] = new String[size]; 
	
	//script 내 startChat()에서 사용하기 위해 local로 선언
	int i = 0;
	
%>
<!DOCTYPE html>
<html>
<head>
<!-- 10초마다 페이지 초기화 // 새로운 채팅방이 생기거나 혹은 새 맴버가 채팅방에 입장했는지 확일할 수 있게-->
<meta charset="UTF-8" HTTP-EQUIV="refresh" CONTENT="10">
<title>Insert title here</title>
</head>
<body align="center">
	
	<h2>채팅방 목록</h2>
	<form method="get">
	<table border="1" width="400" align="center">
		<tr>
			<td>채팅방</td>
			<td>멤버</td>
		</tr>
		<%
			for(i=0; i < size; i++){
				// ch(ChatVO)에 dao.selectAll()로 받아온 정보를 순차적으로 하나씩 입력
				
				//room 배열에 채팅방이름을 순차적으로 입력
				if(list==null){ %>
		<tr>
			<!-- 채팅방이 없으면 빈 테이블 한개 생성 -->
			<td>채팅방이 없습니다</td>	<td> 0 </td>
		<tr>
		<%	} else {
				ch = list.get(i);
				room[i] = ch.getChr_name();
				roomName = room[i];
		%>
		<tr>
			<!-- 채팅방 이름을 클릭하면 main.jsp로 이동 -->
			<td><a href="main.jsp"><%=roomName %></a>
			<td><%=ch.getChr_mem() %></td>
		<tr>
		<% 		} //if-end 
			} //for-end %>
	</table>
	</form>
	
	<table border=0  width="400" align="center">
		<tr>
		<td width="<%=button_width %>"><button onClick="location.href='makeRoom/roomName.jsp';">채팅방 생성</button></td>
		<!-- 페이지 직접 새로고침 -->
		<td><button onClick="window.location.href=window.location.href">새로고침</button></td>
		</tr>
	</table>
		
</body>
</html>