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
	ChatDAO dao = ChatDAO.getInstance();
	
	String roomMem = dao.get_mem(room);
	
	vo.setChr_name(room);
	vo.setChr_mem(roomMem);
	
	dao.join_room(vo, room, name);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅채팅 </title>
</head>
<body>
<!--index.html 도 하나 더 생성  .. 하나는 서버, 하나는 클라이언트라고 생각하면 됨. -->
	
	
	<h3> 채팅 </h3>
	<textarea rows="10" cols="50" readonly id="ta1"></textarea> <br>
	
	<h3>닉네임</h3>
	<input type="text" id="who1" value="홍길동">
	
	<h3>보낼 글 </h3>
	<input type="text" id="chat1" onkeyup="enterkey();">
	<!-- onkeyup : down이 누르는거고 on 은 눌렀다 뗐을 때  -->
	
	<input type="submit" value="보내기" onClick="kajaChool();">
	<input type="submit" value="로그아웃" onClick="location.href='makeRoom/logOut.jsp';">
	<!-- <button onClick="logOut();">로그아웃</button> -->
	<h4>귓속말 사용법 = <mark>\w[상대방 사용자명]:메시지</mark></h4>
	
	<script>
	<%-- function logOut(){
		<%dao.out_room(room,name); //채팅방 맴버에서 현재 사용자 제거
		dao.delete_room();%> //채팅방에 사용자 0명일 시 채팅방 제거
		location.href='index.jsp'; // index.jsp로 이동
	} --%>
	
	function enterkey(){
		if(window.event.keyCode == 13){ // ascii code 에서 엔터키 13 
			kajaChool();
		}
	}
	
	function kajaChool(){               // 비활성화 
		document.getElementById("who1").disabled=true; // 이름 한번 정하면 변경 불가 
		
		ta1.value += "[" + who1.value + "] " + chat1.value + "\n";
		// [홍길동] 이먼저 출력되고 그 다음 입력한 채팅 내용 출력 
		
		ws1.send("[" + who1.value +"] " + chat1.value );
		//그리고 상대방에게도 [홍길동] 및 채팅내용이 출력되게 함 
		
		chat1.value = "";
		chat1.focus();
		
	}
	</script>
	<!-- [한기태]방가방가 -->
	
	
	<script>
	
	// ws(웹 소켓) 은 시작을 http 로 했다가 websocket 으로 바뀜.
	//  -> 서버에서도 websocket에 접근이 가능.. 따라서 상호요청이 가능한 것. 
	var ws1 = new WebSocket("ws://localhost:8080" + "<%=request.getContextPath()%>/kaja");
	// request 가 가지고 있는 메소드 중 하나 .getContextPath() : 프로젝트 경로를 찾아감. 
	// 프로젝트경로/kaja 로 가는 것. 
	// .java 에도 @ServerEndpoint("/kaja") 로 되어 있음. 
	
	// index.jsp 를 실행하면 url 주소창에는 index.jsp 로 끝나겠지만 실제 찾아가는 곳은 /kaja 라는 것. 
	
	var chat1 = document.getElementById('chat1');
	var ta1 = document.getElementById('ta1');
	
	ws1.onerror = function(aa){
		alert('error');
	};
	
	ws1.onopen = function(aa){
		alert("[ 채팅 시작하세요 ]")
		who1.focus();
		who1.select();
	}
	
	ws1.onmessage = function(aa){
		//ta1.value += aa.data + "\n";
		var sendchat = aa.data.split("]");
				//입력한(data) [사용자명] 메시지내용 에서 ]를 기준으로 index[0], index[1]로 나눔
		var sendwho1 = sendchat[0]+"]";
		var mesg1 = sendchat[1];
		var mal = (sendchat[1]+"]"+sendchat[2]).split(":");
		// \w[귓속말 할 상대방 사용자명]:메시지 입력
		
		var sendchat1 = mesg1.split("]"); // \w[상대방 사용자명]:메시지내용 에서 ']'을 기준으로 나눔
		var who1 = sendchat1[0].length;  // \w[상대방 사용자명의 길이를 구함
		var who = sendchat1[0].substring(3,who1); // '상대방 사용자명'을 구함
		
		if(mesg1 !=""){
			if(mesg1.match("\w")){ //이제 귓속말이 온다
							//  \w[내 아이디]:메시지 형식으로 보내므로
				if(mesg1.match("\w"+"["+who+"]"))
					ta1.value += "(귓속말)" + sendwho1+ " ~ " + mal[1] + "\n";
				//mal1[1]에는 : 다음에 있는 "메시지내용"이 들어있으므로
				//(귓속말)[보낸사람] ~방가방가
			}
			else
				ta1.value += sendwho1 + mesg1 + "\n"; //귓속말 아님
		}
	}
	</script>
	
	
	
	<script>
		// HTML5, websocket api
		window.onload = function() {
			if (window.Notification) {
				Notification.requestPermission();
				//알람권한을 허용받는다
				setTimeout(function() {
					kaja();
				},2000); //n초후에 kaja를 호출
			}
		}
		
		function kaja() {
			if (Notification.permission != "granted") { // denied
				alert("알림허용이 안되어 있음"); //n초후에 알림허용이 아닐 때 이 메시지
				//var noti0 = new Notification("알림허용 안돼 있음");
			}
			else { // 아래 내용아 화면 우측 아래에 알림으로 뜬다
				//알림객체 생성시 알림 출력할 제목, 아이콘 ,실제 문장등을 인자로 넣는다
				var noti1 = new Notification("즐거운 chat하세요", {
					icon: "./picture/happy.jpg",//picture 파일에 그림을 넣어 사용한다
					body: "클릭하면 채팅에 유용한 검색 페이지가 나옵니다"
				});
			
				noti1.onclick = function() { // 알림 메시지를 클릭하면 아래 사이트가 열린다
					//alert("naver로 이동합니다")
					window.open("http://www.naver.com");
					//이거는 pc 우측아래에 hwp한글 upgrade 알림이 들 때 내가 클릭하면
					// 한글 upgrade 사이트로 가서 진행되는 것과 같다
				}
			}
		}
			
	</script>
</body>
</html>