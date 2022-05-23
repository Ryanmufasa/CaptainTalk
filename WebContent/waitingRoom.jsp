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

	request.setCharacterEncoding("UTF-8");
	
	ChatVO ch = new ChatVO();
	ChatDAO dao = ChatDAO.getInstance();
	
	List<ChatVO> list = dao.selectAll();
	
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
<!-- 4초마다 페이지 초기화 // 새로운 채팅방이 생겼나 4초마다 확일할 수 있게-->
<meta charset="UTF-8" HTTP-EQUIV="refresh" CONTENT="4">
<title>Insert title here</title>
</head>
<body align="center">
	<script>
	function roomname() {
		window.open("./makeRoom/roomName.jsp","popupWin1",
				"width=370,height=200,top=20,left=350,loaction=no,menubar=0")
		}
	
	function startChat() {		
		<% dao.join_room(room[i],name); %> /* 현재 사용자를 생성한 채팅방 db에 입력시킨다 */
		<% request.setAttribute("room",room); %>
		location.href="main.jsp"; //채팅방으로 이동//url 따로 만드는 법 강구
	}
	</script>
	
	<h2 align="center">채팅방 목록</h2>
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
			<td></td>	<td></td>
		<tr>
		<%	} else
				ch = list.get(i);
				room[i] = ch.getChr_name();
		%>
		<tr>
			<!-- 채팅방 이름을 클릭하면 startChat()실행 -->
			<td><button onClick="startChat()"><%=room[i] %></button></td>
			<td><%=ch.getChr_mem() %></td>
		<tr>
		<% } %>
		
	<script>
	</script>
		
	</table>
	
	<button onClick="roomname()">채팅창 만들기</button> &nbsp;&nbsp;
	<!-- 페이지 직접 새로고침 -->
	<button onClick="window.location.href=window.location.href">페이지 새로고침</button>
		
</body>
</html>