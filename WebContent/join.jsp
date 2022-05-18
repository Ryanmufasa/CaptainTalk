<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<style>


</style>
</head>
<body>

	

	<h3>회원가입</h3>
	<hr>
	
<!-- 	<form id = "gogo" action="logincheck.jsp" method="post"> -->
	<form>
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
            <a href="joincheckok.jsp"><input type="button" value="회원가입" /></a>
            <input type="button" value="취소" onclick="history.back()" />
	</form>
	
	<!-- 	<form action="logincheck.jsp" method="post"> -->
<!-- 	<div class="wrapper"> -->
<!-- 		<div class="title"><h1 style="font-size: 21px;">회원가입</h1></div> -->
<!-- 		<div class="name"> -->
<!-- 			<input id="name" type="text" placeholder="이름을 입력해주세요" required/> -->
<!-- 		</div> -->
<!-- 		<div class="id"> -->
<!-- 			<input id="id" type="text" placeholder="아이디를 입력해주세요" required/> -->
<!-- 		</div> -->
<!-- 		<div class="password"> -->
<!-- 			<input id="password" type="password" placeholder ="비밀번호를 입력해주세요" required/> -->
<!-- 		</div> -->
<!-- 		<div class="passwordCheck"> -->
<!-- 			<input id="passwordCheck" type="password" placeholder ="비밀번호를 입력해주세요" required/> -->
<!-- 		</div> -->
<!-- 		<div class="phone"> -->
<!-- 			<input id="phone1" type="text" size="3" required/> -->
<!-- 			<input id="phone2" type="text" size="3" required/> -->
<!-- 			<input id="phone3" type="text" size="3" required/> -->
<!-- 		</div> -->
<!-- 		<div class="signUp"> -->
<!-- 			<input id="signUpButton" type="submit" value="가입하기"> -->
<!-- 			<input id="cancel" type="button" value="취소" onclick = "history.back()"> -->
<!-- 		</div> -->
		
<!-- 	</div> -->

<!-- 	</form> -->
<!-- </body> -->

</body>
</html>