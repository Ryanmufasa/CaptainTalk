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
		<h2>추가 정보 입력</h2>
			<form action="waitingRoom.jsp" method="post">
			<table border="1" style="margin:auto; text-align:center" width="390" height="360">
				<tr height="60">
					<td>성별</td>
					<td><input type="text" name="sex" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>생일</td>
					<td><input type="text" name="date" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>메일</td>
					<td><input type="text" name="email" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>지역</td>
					<td><input type="text" name="region" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>메모</td>
					<td><input type="text" name="memo" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원정보수정" style="width:280pt; height:32pt"></td>
				</tr>
			</table>
			</form>
	</div>
</body>
</html>