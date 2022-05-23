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

	<h3>회원가입</h3>
	<hr>
	
<!-- 	<form id = "gogo" action="logincheck.jsp" method="post"> -->
	<form action="./login.jsp">
		<table id="join">
			<tr>
				<td><label>아아디</label></td>
				<td><input id="id" type="text" required/> 
				 <input type="button" value="중복확인" onclick = ""/></td>
			</tr>
			<tr>
				<td><label>이름</label></td>
				<td><input id="name" type="text" required /></td>
			</tr>
			<tr>
				<td><label for="password">비밀번호</label></td>
				<td><input id="password" type="password" required /></td>
			</tr>
			<tr>
				<td><label for="passwordCheck">비밀번호확인</label></td>
				<td><input id="passwordCheck" type="password" required /></td>
			</tr>
			<tr>
				<td><label for="telnumber">전화번호</label></td>
				<td><input id = "phone1" type="text" style="width:50px;" required/>
				    - <input id = "phone2" type="text" style="width:50px;" required/>
				    - <input id = "phone3" type="text" style="width:50px;" required/>
			</td></tr>
		</table>         
			<br><hr>
				<input type="submit" value="회원가입">
				<button type="button" onclick="history.back()">취소</button>
			</form>
</body>
</html>