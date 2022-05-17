<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
		height:100%; /* %가 중요하다 */
		margin: 0;
		padding: 0;
	}
	
	#aa {
		background-size: cover;
		background-image: url("./picture/join.jpg");
		background-position: center;
		min-height: 100%;
		border: 0;
		padding: 0;
	}
</style>
</head>
<body>
	<div id="aa">
		<form action=".jsp" method="get">
			아이디 <input type="text" name="name" readonly> <br>
			비밀번호 <input type="password" name="pw" size=18 maxlength=16>
			<input type="submit" value="회원가입">
		</form>
	</div>
</body>
</html>