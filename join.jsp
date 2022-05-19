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
	<div id="aa" align="center">
		<h2>회원가입</h2>
			<form action="joinok.jsp" method="post">
			<table border="1" style="margin:auto; text-align:center">
				<tr>
					<td>아이디</td><td colspan="3"><input type="text" name="id" style="width:160pt"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td colspan="3"><input type="password" name="pw" style="width:160pt"></td> 
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="3"><input type="text" name="name" style="width:160pt"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone1" size="5"></td>
					<td><input type="text" name="phone2" size="5"></td>
					<td><input type="text" name="phone3" size="5"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td colspan="3"><input type="text" name="sex" style="width:160pt"></td>
				</tr>
				<tr>
					<td>생일</td>
					<td colspan="3"><input type="text" name="date" style="width:160pt"></td>
				</tr>
				<tr>
					<td>메일</td>
					<td colspan="3"><input type="text" name="email" style="width:160pt"></td>
				</tr>
				<tr>
					<td>지역</td>
					<td colspan="3"><input type="text" name="region" style="width:160pt"></td>
				</tr>
				<tr>
					<td>메모</td>
					<td colspan="3"><input type="text" name="memo" style="width:160pt"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="회원가입" style="width:220pt"></td>
				</tr>
			</table>
			</form>
	</div>
</body>
</html>