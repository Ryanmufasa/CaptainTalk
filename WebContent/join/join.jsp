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
		<h2>회원가입</h2>
			<form action="./joinok.jsp" method="post">
				아이디:<input type="text" name="id"><br> 
				비밀번호:<input type="password" name="pw"><br> 
				이름:<input type="text" name="name"><br> 
				전화번호:<input type="text" name="tel1" size="5"> 
				<input type="text" name="tel2" size="5"> 
				<input type="text" name="tel3" size="5"><br>
				<input type="submit" value="회원가입">
			</form>
	</div>
</body>
</html>