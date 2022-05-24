<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>채팅</h3>
	<textarea rows="10" cols="50" readonly id="ta1"></textarea>
	
	<h3>who></h3>
	<input type="text" id="who1" value="홍길동">
	
	<h3>보낼 글</h3>
	<input type="text" id="chat1" onkeyup="enterkey()">
	
	<input type="submit" value="가자" onclick="kajaChool();" />
	
	<script>
		function enterkey() {
			if(window.event.keyCode == 13) {
				kajaChool();
			}
		}
		
		function kajaChool() {
			document.getElementById("who1").disabled=true; //이름한번 정하고 중간에 못바꿈
			
			ta1.value += "["+who1.value+"]" + chat1.value + "\n";
							//이것하면 [홍길동] 이 먼저 출력되고 뒤에 홍길동이 보낸 chat이 출력
							
			ws1.send("["+who1.value+"]" + chat1.value);
							//그리고 상대방에게도 [홍길동] 및 chat내용이 출력되게 하는 문장임
			chat1.value = "";
			chat1.focus();
			
		}
	</script>
	
	<script>															//프로젝트경로명
	var ws1 = new WebSocket("ws://121.140.170.207:80"+"<%=request.getContextPath()%>/kaja");
			//ws: 에 주의
			//시작은 http로 ==> 중간에 websocket 으로 변환 (상호요청이 가능)
		var chat1 = document.getElementById('chat1');
		var ta1 = document.getElementById('ta1');
		
		ws1.onerror = function(aa){
			alert('error');
		};
		
		ws1.onopen = function(aa) {//연결이 잘 되었을때
			//ta1.value += "채팅 시작하세요~"
			alert("[채팅시작하세요]");
			who1.focus();
			who1.select();
		};
		
		ws1.onmessage = function(aa) {
			ta1.value += aa.data + "\n";
		};
		
		//Notification.requestPermission();
		
			ws.onclose = function() {
			setTimeout(socketInit, 300); //websocket 다시연결
		};
		
	</script>
</body>
</html>