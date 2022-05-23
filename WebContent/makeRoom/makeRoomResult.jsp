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
	
	ChatDAO dao = ChatDAO.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 	<script type="text/javascript">
	function goWait(){
		opener.document.location.href="../waitingRoom.jsp"
		self.close();
	}
	function goChat(){
		opener.document.location.href="../main.jsp"
		self.close();
	}
	</script> -->
	
		<script type="text/javascript">
		function goWait() {//대기실로 이동 (waitRoom.jsp)
			//window.opener.location.reload(); //부모 창(waitingRoom.jsp)새로고침 한 후
			//opener.location.reload(); // 부모 창 새로고침하는 다른 방법
			// 하지만 부모창은 make.Room이기 때문에...? 현재 창을 닫고 waitingRoom.jsp를 
			// 일정시간마다 자동 새로고침 하는 방식을 사용하겠다
			
			opener.open('about:blank','_self').close(); //부모창(waitingRoom.jsp)닫기
			window.open('../waitingRoom.jsp','goWaitingRoom'); // 대기실 창을 생성
			window.open("about:blank","_self").close(); // 현재 팝업창을 삭제한다
			
			//부모창을 닫고 현재창에서 waitingRoom으로 이동하지 않는 이유는
			//현재 팝업창이 작기 떄문에, location.href로는 안됐다.
			
			//부모창에 4초마다 reset(새로고침)을 하기 떄문에 현재창을 닫고 부모창을 열면 되지만
			//부모창을 닫고 현재창을 여는 이유는 새로 업데이트 된 내용을 바로 볼 수 있게 하기 위해서이고
			//부모창을 4초마다 업데이트 하는 이유는 다른 사용자가 채팅방을 개설하면 확인할 수 있게 하기 위해서다
		}
		
		function goChat() {//생성한 채팅방으로 이동
			opener.open('about:blank','_self').close();
			<% dao.join_room(room,name); %> //현재 사용자를 생성한 채팅방 db에 입력시킨다
			location.href="main.jsp"; //채팅창으로 이동// url 따로 만드는 법 강구
		}
		
		function makeRoom() {//채팅방 다시 만들기 (makeRoom.jsp 으로 이동)
			location.href="makeRoom.jsp";
		}
	</script>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			<form>
				<button onClick="goWait()">대기실로 이동</button> &nbsp;&nbsp;
				<button onClick="goChat()">생성한 채팅방으로 이동</button>
			</form>
		</c:if>
		<c:if test="${!check }">
			<form>
				<button onClick="goWait()">대기실로 이동</button> &nbsp;&nbsp;
				<button onClick="makeRoom()">채팅방 다시 만들기</button>
			</form>	
		</c:if>
	</div>

</body>
</html>