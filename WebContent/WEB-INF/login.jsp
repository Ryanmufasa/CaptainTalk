<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
	* {margin:0; padding:0;}
	
	@media all and (min-width:300px) {
		
		#mq1 img { width:100%;	}
	}
	
	div {font-size: 0;}
</style>
</head>
<body>
	<center>
	<h1> Main page </h1>
	<div id="mq1">
		<img src="./picture/login.jpg" width=200>
	</div><br>
	</center>
	<form action="check.jsp" method="get">
	아이디 <input type="text" name="name" readonly> <br>
	비밀번호 <input type="password" name="pw" size=18 maxlength=16>
	<input type="submit" value="로그인">
	</form>
	<form action="./join/join.jsp" method="get">
	<input type="reset" value="회원가입">
	</form>
</body>
</html>