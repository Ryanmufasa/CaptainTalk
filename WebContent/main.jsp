<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅채팅 </title>
<style>
	html, body {
		height:100%; /* %가 중요하다 */
		margin: 0;
		padding: 0;
	}
	
	#aa {
		background-size: cover;
		background-image: url("./picture/indexBg.jpg");
		background-position: center;
		min-height: 100%;
		border: 0;
		padding: 0;
	}
</style>
</head>
<body>
<!--index.html 도 하나 더 생성  .. 하나는 서버, 하나는 클라이언트라고 생각하면 됨. -->
	<div id="aa">
		<h3> 채팅 </h3>
		<textarea rows="10" cols="50" readonly id="ta1"></textarea> <br>
		
		<h3>닉네임</h3>
		<input type="text" id="who1" placeholder="한번정하면 수정불가">
		
		<h3>보낼 글 </h3>
		<input type="text" id="chat1" onkeyup="enterkey()" placeholder="이곳에메세지입력">
		<!-- onkeyup : down이 누르는거고 on 은 눌렀다 뗐을 때  -->
		
		<input type="submit" value="가자" onclick="kajaChool();">
	</div>
	<script>
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
	

	var ws1 = new WebSocket("ws://localhost:8080" + "<%=request.getContextPath()%>/kaja");

	
	var chat1 = document.getElementById('chat1');
	var ta1 = document.getElementById('ta1');
	
	ws1.onerror = function(aa){
		alert('error');
	};
	
	ws1.onopen = function(aa){
		alert("[채팅 시작하세요 ]")
		who1.focus();
		who1.select();
	}
	
	ws1.onmessage = function(aa){
		ta1.value += aa.data + "\n";
		var sendchat1 = aa.data.split(",");
			//귓속말이라면 전송시 ,로 구분되어 보낸사람,chat을 받게됨
		var sendwho1 = sendchat1[0];
		var mesg1 = sendchat[1];
		var mal = sendshat[1].split(":");
		// /w홍길동2:hi   입력
		
		if(mesg1 !=""){
			if(mesg1.match("\w")){ //이제 귓속말이 온다
				
					//내이름이 aaa이면 /waaa:방가방가 로 귓속말을 보내므로
				if(mesg1.match("\w"+"["+who1.value+"]")) // /aaa인 나에게 왔을 경우
					ta1.value += "(귓속말)" + sendwho1+ " ~ " + ma[1] + "\n";

			}
			else
				ta1.value += sendwho1 + "  " + mesg1 + "\n"; //귓속말 아님
		}
	}
	</script>
	
	
	
	<script>
		// HTML5, websocket api
		window.onload = function() {
			if (window.Notification) {
				Notification.requestPermission();
				//크롬 우측상단에서 아이콘을 눌러 알림부분
				//or
				setTime(function() {
					kaja();
				},1000); //7초후에 kaja를 호출
				
			}
		}
		
		
		function kaja() {
			if (Notification.permission != "granted") { // denied
				alert("알림허용이 안되어 있음");//7초후에 알림허용이 아닐 때 이 메시지
			}
			else { // 아래 내용아 화면 우측 아래에 알림으로 뜬다
				//알림객체 생성시 알림 출력할 제목, 아이콘 ,실제 문장등을 인자로 넣는다
				var noti1 = new Notification("즐거운 chat하세요", {
					icon: "bed.jpg", //pixabay에서 받아서 index.jsp와 같은 위치에 넣는다
					body: "클릭하면 즐거운 홈페이지가 열립니다"
				});
			
			noti1.onclick = function() { // 알림 메시지를 클릭하면 아래 사이트가 열린다
				alert("감사합니다")
				window.open("http://www.naver.com");
				//이거는 pc 우측아래에 hwp한글 upgrade 알림이 들 때 내가 클릭하면
				// 한글 upgrade 사이트로 가서 진행되는 것과 같다
				};
			}
		}
	</script>
</body>
</html>