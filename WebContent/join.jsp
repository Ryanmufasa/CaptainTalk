<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>

	<form action="joinok.jsp" method="post">
		아이디:<input type="text" name="id"><br> 
		비밀번호:<input type="password" name="pw"><br> 
		이름:<input type="text" name="name"><br> 
		전화번호:<input type="text" name="phone1" size="5"> 
		<input type="text" name="phone2" size="5"> 
		<input type="text" name="phone3" size="5"><br>
		<input type="submit" value="회원가입">
	</form>

</body>
</html>