<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>알려드립니다</title>
</head>
<body>
	<script>
	function popClose(){
	    self.close();
	}
	</script>
	<center>
		<form action="makeRoom.jsp">
			채팅방 이름 : <input type="text" name="room">
			<input type="submit" value="생성" onclick="popClose()"/>
		</form>
	<!-- <div onclick="self.close()">닫기</div> -->
	</center>
</body>
</html>
