<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"  %>

	<div id="aa">
		<h2>회원가입</h2>
		<hr>
			<form action="./joinok.jsp" method="post">
				<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="tel1" size="5">
						<input type="text" name="tel2" size="5"> 
						<input type="text" name="tel3" size="5">
					</td>
				</tr>
			</table>         
			<br><hr>
				<input type="submit" value="회원가입">
				<button type="button" onclick="history.back()">취소</button>
			</form>
		</div>
		
<%@ include file="/layout/footer.jsp" %>