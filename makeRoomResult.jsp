<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<script>
		function goWait() {
			window.opener.location.reload(); //부모 창(waitingRoom.jsp)새로고침 한 후
			//opener.location.reload(); // 부모 창 새로고침하는 다른 방법
			self.close(); //현재 창(makeRoomResult.jsp)닫기
			// -> 현재 창 닫고 미리 켜져있는 waitingRoom()을 다시 사용자가 사용하게 한다
		}
		function goChat() {
			location.href="main.jsp"; //채팅창으로 이동 후
			self.close();//현재 창 닫기
		}
	</script>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			<form>
				<input type="button" value="대기실로 이동"  onClick="goWait()">
				<input type="button" value="생성한 채팅방으로 이동" onClick="goChat()">
			</form>
		</c:if>
		<c:if test="${!check }">
			<form>
				<input type="button" value="대기실로 이동" onClick="goWait()">
			</form>	
		</c:if>
	</div>

</body>
</html>