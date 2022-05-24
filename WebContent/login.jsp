<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="./semantic/semantic.css">
<style>
	* {margin:0; padding:0;}
	
	@media all and (min-width:300px) {
		
		#mq1 img { width:100%;	}
	}
	
	div {font-size: 0;}
</style>
</head>
<body align="center">

	<header>
		<div id="header1">
			<center>Main page</center>
		</div>
	</header>
	<div id="mq1">
		<img src="picture/login.jpg" width=200>
	</div><br>
	<form action="check.jsp" method="get">
		아이디 <input type="text" name="id"> <br>
		비밀번호 <input type="password" name="pw" size=18 maxlength=16>
		<input type="submit" value="로그인">
	</form>
	<form action="./join/join.jsp" method="get">
		<input type="submit" value="회원가입">
	</form>
	
</body>
</html>