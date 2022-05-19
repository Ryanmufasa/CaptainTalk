<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
		height:100%;
		margin: 0;
		padding: 0;
		color: white;
	}
	
	#aa {
		background-size: cover;
		background-image: url("../picture/join2.jpg");
		background-position: center;
		min-height: 100%;
		border: 0;
		padding: 0;
	}
</style>
</head>
<body>
	<div id="aa" align="center">
		<h2>회원가입</h2>
			<form action="joinok.jsp" method="post">
			<table border="1" style="margin:auto; text-align:center" width="500" height="320">
				<tr height="60">
					<td>아이디</td><td colspan="3"><input type="text" name="id" style="width:240px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>비밀번호</td><td colspan="3"><input type="password" name="pw" style="width:240px; height:22px; font-size:15px;"></td> 
				</tr>
				<tr height="60">
					<td>이름</td>
					<td colspan="3"><input type="text" name="name" style="width:240px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>전화번호</td>
					<td><input type="text" name="phone1" size="5" style="width:70px; height:22px; font-size:8px;"></td>
					<td><input type="text" name="phone2" size="5" style="width:70px; height:22px; font-size:8px;"></td>
					<td><input type="text" name="phone3" size="5" style="width:70px; height:22px; font-size:8px;"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="회원가입" style="width:220pt; height:32pt"></td>
				</tr>
			</table>
			</form>
	</div>
</body>
</html>